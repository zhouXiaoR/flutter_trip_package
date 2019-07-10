import 'package:flutter/material.dart';
import 'package:flutter_trip/Models/grid_nav_model.dart';
import 'package:flutter_trip/Models/pinda_item_model.dart';

enum CardDirection {
  TopLeft,    // 上部类型
  TopRight,   // 下面类型
  BottomLeft,
  BottomRight,
  none,
}

class SingleCardView extends StatelessWidget {

  SingleCardView({this.gridtem, this.type});

  final CardDirection type;
  final GridNavItem gridtem;

  BoxDecoration _cornerType(CardDirection directionType) {
    BoxDecoration radius;
    switch (directionType) {
      case CardDirection.TopLeft:
        {
          radius = BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
          );
          break;
        }
      case CardDirection.TopRight:
        {
          radius = BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(6)),
          );
          break;
        }
      case CardDirection.BottomLeft:
        {
          radius = BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6)),
          );
          break;
        }
      case CardDirection.BottomRight:
        {
          radius = BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(6)),
          );
          break;
        }
      case CardDirection.none:
        {
          break;
        }
    }
    return radius;
  }

  _buildMainItem() {
    return  Container(
        width: 150,
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

  _buildSingleItem(PindaItemModel model) {
    return Container(
      color: Colors.green,
      alignment: Alignment.center,
        child: Text(model.title,style: TextStyle(fontSize: 16,color: Colors.white),),
    );
  }

    _buildBetweenDoubleItems() {
      return Container(
        height: 150,
        width: 100,
        child: Column(
          children: <Widget>[
            Expanded(child: _buildSingleItem(gridtem.item1),flex: 1,),
            Expanded(child: _buildSingleItem(gridtem.item3),flex: 1,)
          ],
        ),
      );
    }

    _buildRightDoubleItems() {
      return Container(
        width: 130,
        child: Column(
          children: <Widget>[
            Expanded(child: _buildSingleItem(gridtem.item2),flex: 1,),
            Expanded(child: _buildSingleItem(gridtem.item4),flex: 1,)
          ],
        ),
      );
    }

    _buildCardView() {
      return Container(
        height: 150,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.red,Colors.orange])),
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
