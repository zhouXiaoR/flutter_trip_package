import 'package:flutter_trip/Models/pinda_item_model.dart';
import 'package:flutter_trip/Models/sales_box_model.dart';
import 'config_model.dart';
import 'grid_nav_model.dart';

class HomeModel {
  final ConfigModel config;
  final List<PindaItemModel> bannerList;
  final List<PindaItemModel> localNavList;
  final GridNavModel gridNav;
  final List<PindaItemModel> subNavList;
  final SalesBoxModel salesBox;

  HomeModel(
      {this.config,
      this.bannerList,
      this.localNavList,
      this.gridNav,
      this.subNavList,
      this.salesBox});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var localNavListJson = json['localNavList'] as List;
    List<PindaItemModel> localNavList =
    localNavListJson.map((model) => PindaItemModel.fromJson(model)).toList();

    var bannerListJson = json['bannerList'] as List;
    List<PindaItemModel> bannerList =
    bannerListJson.map((i) => PindaItemModel.fromJson(i)).toList();

    var subNavListJson = json['subNavList'] as List;
    List<PindaItemModel> subNavList =
    subNavListJson.map((i) => PindaItemModel.fromJson(i)).toList();
    return HomeModel(
        localNavList: localNavList,
        bannerList: bannerList,
        subNavList: subNavList,
        config: ConfigModel.fromJson(json['config']),
        gridNav: GridNavModel.fromJson(json['gridNav']),
        salesBox: SalesBoxModel.fromJson(json['salesBox']),
    );
  }
}
