import 'package:flutter/material.dart';
import 'package:flutter_trip/Models/pinda_item_model.dart';
import 'package:flutter_trip/Models/sales_box_model.dart';

class HotActivityView extends StatelessWidget {
  HotActivityView({this.salesBoxModel});

  final SalesBoxModel salesBoxModel;

  _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
      ),
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 2),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 2),
      height: 30,
      child: Row(
        children: <Widget>[
         Image.network(
              salesBoxModel.icon,
              height: 20,
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
            ),
           Expanded(
               child: Container(
                 padding: const EdgeInsets.only(right: 5),
                 alignment: Alignment.centerRight,
                 child: Container(
                     height: 20,
                     width: 130,
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                         gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
                         borderRadius: BorderRadius.all(Radius.circular(10))),
                     child: Text(
                       '获取更多的福利 >',
                       style: TextStyle(
                         fontSize: 13,
                         color: Colors.white,
                       ),
                       textAlign: TextAlign.center,
                     ),
                   ),
                 ),
               ),
        ],
      ),
    );
  }

  _buildSingleCard(PindaItemModel model, bool isBig) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Image.network(
                model.icon,
                alignment: isBig ? Alignment.topRight : Alignment.topRight,
                fit: isBig ? BoxFit.cover : BoxFit.cover,
              )),
          Text('')
        ],
      ),
    );
  }

  _buildBigCard() {
    return Container(
      height: 120,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(right: 2),
            child: _buildSingleCard(salesBoxModel.bigCard1, true),
          )),
          Expanded(
              child: Container(
            child: _buildSingleCard(salesBoxModel.bigCard2, true),
          )),
        ],
      ),
    );
  }

  _buildSmallCard(PindaItemModel leftModel, PindaItemModel rightModel) {
    return Container(
      padding: const EdgeInsets.only(top: 3),
      height: 70,
      color: Color(0xfff2f2f2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(right: 2),
            child: _buildSingleCard(leftModel, false),
          )),
          Expanded(
              child: Container(
            color: Colors.green,
            child: _buildSingleCard(rightModel, false),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 3, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHeader(),
          _buildBigCard(),
          _buildSmallCard(salesBoxModel.smallCard1, salesBoxModel.smallCard2),
          _buildSmallCard(salesBoxModel.smallCard3, salesBoxModel.smallCard4),
        ],
      ),
    );
  }
}
