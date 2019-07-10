
import 'package:flutter_trip/Models/pinda_item_model.dart';

class GridNavModel {
  final GridNavItem hotel;
  final GridNavItem flight;
  final GridNavItem travel;

  GridNavModel({this.hotel,this.flight,this.travel});

  factory GridNavModel.fromJson(Map<String,dynamic>json) {
    if (json == null) return null;
    return GridNavModel(
      hotel: GridNavItem.fromJson(json['hotel']),
      flight: GridNavItem.fromJson(json['flight']),
      travel: GridNavItem.fromJson(json['travel']),
    );
  }
}

class GridNavItem {
  final String startColor;
  final String endColor;
  final PindaItemModel mainItem;
  final PindaItemModel item1;
  final PindaItemModel item2;
  final PindaItemModel item3;
  final PindaItemModel item4;

  GridNavItem(
      {this.startColor,
        this.endColor,
        this.mainItem,
        this.item1,
        this.item2,
        this.item3,
        this.item4});

  factory GridNavItem.fromJson(Map<String, dynamic> json) {
    return GridNavItem(
        startColor: json['startColor'],
        endColor: json['endColor'],
        mainItem: PindaItemModel.fromJson(json['mainItem']),
        item1: PindaItemModel.fromJson(json['item1']),
        item2: PindaItemModel.fromJson(json['item2']),
        item3: PindaItemModel.fromJson(json['item3']),
        item4: PindaItemModel.fromJson(json['item4']));
  }
}