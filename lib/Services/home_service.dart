import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_trip/Models/home_model.dart';

const HOME_URL =  'https://apk-1256738511.file.myqcloud.com/FlutterTrip/data/home_page.json';

class HomeServiceDio {
  static Future<HomeModel> fetch() async {
   Response response = await Dio().get(HOME_URL);
   if (response.statusCode == 200) {
     return HomeModel.fromJson(response.data);
   }else{
     throw Exception('Fail load to load cache data');
   }
  }
}