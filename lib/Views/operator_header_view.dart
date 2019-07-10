import 'package:flutter/material.dart';
import 'package:flutter_trip/Models/pinda_item_model.dart';

class OperatorHeaderView extends StatelessWidget {

  OperatorHeaderView(@required this.items,);

  final List<PindaItemModel> items;
  
   Widget _item(PindaItemModel model){
    return Container(
      color: Color.fromARGB(0, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.network(model.icon,fit: BoxFit.cover,width: 30,height: 30,),
          Container(
            child: Text(model.title),
          )
        ],
      ),
    );
  }

  List<Widget> _itemsWidget() {
    if (items.length == 0) return null;
    List<Widget> itemList = [];
    items.forEach((model){
      itemList.add(_item(model));
    });
    return itemList;
}
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0),
      body: Container(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _itemsWidget(),
        ),
      )
    );
  }
}