import 'package:flutter/material.dart';
import 'package:flutter_trip/Models/grid_nav_model.dart';
import 'package:flutter_trip/Models/pinda_item_model.dart';
import 'dart:ui';

enum CardDirection {
  TopLeft,    // 上部类型
  TopRight,   // 下面类型
  BottomLeft,
  BottomRight,
  none,
}

enum CardIndex {
  First,
  Between,
  Last,
}

class SingleCardView extends StatelessWidget {

  SingleCardView({this.gridtem,this.cardIndex});

  final width = window.physicalSize.width;
  final scale = window.devicePixelRatio;
  final height = window.physicalSize.height;

  final GridNavItem gridtem;
  final CardIndex cardIndex;

     get _itemWidth {
     var itemWidth = (width/scale - 20 - 2)/3.0;
     return itemWidth;
  }

  BorderRadius _cornerType() {
    BorderRadius radius;
    const double rad = 10;
    //CardDirection d = getDirection(index);
    switch (cardIndex) {
      case CardIndex.First:
        {
          radius = BorderRadius.only(topLeft: Radius.circular(rad),topRight: Radius.circular(rad));
          break;
        }
      case CardIndex.Between:
        {
          break;
        }
      case CardIndex.Last:
        {
          radius = BorderRadius.only(bottomLeft: Radius.circular(rad),bottomRight: Radius.circular(rad));
          break;
        }
    }
    return radius;
  }

  _buildMainItem() {
    return  Container(
        width: _itemWidth,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            ConstrainedBox(
              child: Image.network(gridtem.mainItem.icon,fit: BoxFit.contain,alignment: Alignment.bottomCenter,),
              constraints: BoxConstraints.expand(),
            ),

            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Text(gridtem.mainItem.title,textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
              ),
            )
          ],
        ),
    );
  }

  Border borderIndex(index){
       Border b;
       BorderSide s = BorderSide(color: Colors.white,width: 1);

       if (index == 2 || index == 3) {
         b = Border(
           left: s,
           bottom: s
         );
       } else if (index == 4 || index == 5) {
         b = Border(
           left: s,
         );
       }
       return b;
  }

  _buildSingleItem(PindaItemModel model,int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: borderIndex(index),
        // border与borderRadius这是一个问题 borderRadius: _cornerType(index),
      ),
     
      alignment: Alignment.center,
        child: Text(model.title,style: TextStyle(fontSize: 16,color: Colors.white),),
    );
  }

    _buildBetweenDoubleItems() {
      return Container(
        height: 150,
        width: _itemWidth,
        child: Column(
          children: <Widget>[
            Expanded(child: _buildSingleItem(gridtem.item1,2),),
            Expanded(child: _buildSingleItem(gridtem.item3,4),)
          ],
        ),
      );
    }

    _buildRightDoubleItems() {
      return Container(
        width: _itemWidth,
        child: Column(
          children: <Widget>[
            Expanded(child: _buildSingleItem(gridtem.item2, 3)),
            Expanded(child: _buildSingleItem(gridtem.item4,5))
          ],
        ),
      );
    }

    _buildCardView() {
      Color startColor = Color(int.parse('0xff${gridtem.startColor}'));
      Color endColor = Color(int.parse('0xff${gridtem.endColor}'));
      return Container(
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [startColor,endColor]),
          borderRadius: _cornerType(),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildMainItem(),
           _buildBetweenDoubleItems(),
           _buildRightDoubleItems(),
          ],
        ),
      );
    }

    @override
    Widget build(BuildContext context) {
      return _buildCardView();
    }
  }
