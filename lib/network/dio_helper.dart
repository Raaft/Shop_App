import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        receiveDataWhenStatusError: true,
        headers: {"Content-Type": "application/json"}));
  }

  static Future<Response> getData(
      {String url,
      Map<String, dynamic> query,
      lang = "en",
      token = "0"}) async {
    dio.options.headers = {
      "lang": lang,
      "Authorization": token,
      "Content-Type": "application/json"
    };

    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {@required String url,
      data,
      Map<String, dynamic> query,
      lang = "en",
      token }) async {
    dio.options.headers = {
      "lang": lang,
      "Authorization": token,
      "Content-Type": "application/json"
    };
    return await dio.post(url, data: data, queryParameters: query);
  }


  static Future<Response> putData(
      {@required String url,
        data,
        Map<String, dynamic> query,
        lang = "en",
        token }) async {
    dio.options.headers = {
      "lang": lang,
      "Authorization": token,
      "Content-Type": "application/json"
    };
    return await dio.put(url, data: data, queryParameters: query);
  }

}
