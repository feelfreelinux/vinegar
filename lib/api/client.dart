import 'dart:async';
import 'dart:io';

import 'dart:convert';
import 'dart:async' show Future;
import 'package:dio/dio.dart';
import 'package:webfeed/webfeed.dart';

class ApiClient {
  var _dio = new Dio(Options(
    connectTimeout: 5000,
    receiveTimeout: 5000,
  ));

  Future<String> getXml(String feedUrl) async {
    var response = await _dio.get(feedUrl);
    // @TODO Error handling
    return response.data;
  }

  Future<dynamic> getJson(String feedUrl) async {
    var response = await _dio.get(feedUrl);
    // @TODO Error handling
    print(response.data);
    return response.data;
  }
  ApiClient();
}
