import 'package:flutter_trip/Models/pinda_item_model.dart';

///活动入口模型
class SalesBoxModel {
  final String icon;
  final String moreUrl;
  final PindaItemModel bigCard1;
  final PindaItemModel bigCard2;
  final PindaItemModel smallCard1;
  final PindaItemModel smallCard2;
  final PindaItemModel smallCard3;
  final PindaItemModel smallCard4;

  SalesBoxModel({
    this.icon,
    this.moreUrl,
    this.bigCard1,
    this.bigCard2,
    this.smallCard1,
    this.smallCard2,
    this.smallCard3,
    this.smallCard4,
  });

  factory SalesBoxModel.fromJson(Map<String, dynamic> json) {
    return SalesBoxModel(
      icon: json['icon'],
      moreUrl: json['moreUrl'],
      bigCard1: PindaItemModel.fromJson(json['bigCard1']),
      bigCard2: PindaItemModel.fromJson(json['bigCard2']),
      smallCard1: PindaItemModel.fromJson(json['smallCard1']),
      smallCard2: PindaItemModel.fromJson(json['smallCard2']),
      smallCard3: PindaItemModel.fromJson(json['smallCard3']),
      smallCard4: PindaItemModel.fromJson(json['smallCard4']),
    );
  }
}
