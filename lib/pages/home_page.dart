import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/Models/grid_nav_model.dart';
import 'package:flutter_trip/Models/home_model.dart';
import 'package:flutter_trip/Models/pinda_item_model.dart';
import 'package:flutter_trip/Models/sales_box_model.dart';
import 'package:flutter_trip/Services/home_service.dart';
import 'package:flutter_trip/Views/operator_header_view.dart';
import 'package:flutter_trip/Views/single_card_view.dart';

const kNavigationMaxPercentOffset = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* final _headerImgUrlsList = [
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=412622558,2708772173&fm=26&gp=0.jpg',
    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=10738452,4253697254&fm=26&gp=0.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562253153136&di=31166f7f762053da0b7249fdc4034874&imgtype=0&src=http%3A%2F%2Fww2.sinaimg.cn%2Flarge%2F85cc5ccbgy1ffo8hvs1o3g20cu06qx6q.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3774273329,2521451184&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3177382786,787579333&fm=26&gp=0.jpg'
  ];*/

  double _percentOpacity = 0;
  bool _loading = true;
  String city = '杭州市';

  List<PindaItemModel> bannerList = []; //轮播图列表
  List<PindaItemModel> localNavList = []; //local导航
  GridNavModel gridNav; //网格卡片
  List<PindaItemModel> subNavList = []; //活动导航
  SalesBoxModel salesBox; //salesBox数据

  Future<Null> _handleDownPullRefresh() async {
    try {
      HomeModel homeMod = await HomeServiceDio.fetch();
      setState(() {
        bannerList = homeMod.bannerList;
        localNavList = homeMod.localNavList;
        gridNav = homeMod.gridNav;
        subNavList = homeMod.subNavList;
        salesBox = homeMod.salesBox;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
    }
  }

  _appBarWidget() {
    return Opacity(
      opacity: _percentOpacity,
      child: Container(
        padding: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(color: Colors.blue),
        height: 88,
        child: Center(
          child: Text(
            '首页',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  _updadateNavigationBar(offset) {
    double currentPercent = offset / kNavigationMaxPercentOffset;

    if (currentPercent < 0) {
      currentPercent = 0;
    }

    if (currentPercent > 1) {
      currentPercent = 1;
    }

    setState(() {
      _percentOpacity = currentPercent;
    });
  }

  _headerLoopViewWidget() {
    return Container(
      height: 250,
      child: Swiper(
        itemCount: bannerList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            bannerList[index].icon,
            fit: BoxFit.cover,
          );
        },
        pagination: SwiperPagination(alignment: Alignment.bottomLeft),
      ),
    );
  }

  _pindaItemsWidget() {
    return Container(
      color: Color(0xfff2f2f2),
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child:
            localNavList.length > 0 ? OperatorHeaderView(localNavList) : null,
      ),
    );
  }

  _cardItemsWidget() {

    if (gridNav == null) return Text('1111');

    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10),
      color: Color(0xfff2f2f2),
      height: 470,
      child: Container(
        color: Color(0xfff2f2f2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SingleCardView(gridtem: gridNav.hotel,type: CardDirection.TopLeft,),
            SingleCardView(gridtem: gridNav.flight,type: CardDirection.none,),
            SingleCardView(gridtem: gridNav.travel,type: CardDirection.BottomLeft,),
          ],
        ),
      ),
    );
  }

  _listViewWidget() {
    return ListView(
      children: <Widget>[
        _headerLoopViewWidget(),

        _pindaItemsWidget(),

        _cardItemsWidget(),

        Row(
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: NotificationListener(
          onNotification: (ScrollNotification) {
            if (ScrollNotification is ScrollUpdateNotification &&
                ScrollNotification.depth == 0) {
              _updadateNavigationBar(ScrollNotification.metrics.pixels);
            }
            return true;
          },
          child: RefreshIndicator(
              child: Stack(
                children: <Widget>[
                  _listViewWidget(),
                  _appBarWidget(),
                ],
              ),
              onRefresh: _handleDownPullRefresh)),
    ));
  }
}
