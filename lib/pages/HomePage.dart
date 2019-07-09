import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const kNavigationMaxPercentOffset = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _headerImgUrlsList = [
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=412622558,2708772173&fm=26&gp=0.jpg',
    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=10738452,4253697254&fm=26&gp=0.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562253153136&di=31166f7f762053da0b7249fdc4034874&imgtype=0&src=http%3A%2F%2Fww2.sinaimg.cn%2Flarge%2F85cc5ccbgy1ffo8hvs1o3g20cu06qx6q.jpg',
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3774273329,2521451184&fm=26&gp=0.jpg',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3177382786,787579333&fm=26&gp=0.jpg'
  ];

  double _percentOpacity = 0;

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                child: Stack(
                  children: <Widget>[
                    ListView(
                      children: <Widget>[
                        Container(
                          height: 250,
                          child: Swiper(
                            itemCount: _headerImgUrlsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Image.network(
                                _headerImgUrlsList[index],
                                fit: BoxFit.cover,
                              );
                            },
                            pagination: SwiperPagination(
                                alignment: Alignment.bottomLeft),
                          ),
                        ),
                        Container(
                          color: Colors.red,
                          height: 1000,
                        )
                      ],
                    ),
                    Opacity(
                      opacity: _percentOpacity,
                      child: Container(
                        padding: const EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(color: Colors.blue),
                        height: 88,
                        child: Center(
                          child: Text(
                            '首页',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
