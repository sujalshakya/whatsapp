import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/base/constants/api_urls.dart';
import 'package:whatsapp/base/models/user.dart';
import 'package:whatsapp/base/service/interceptor.dart';

class FetchService {
  static fetchUsers() async {
    final dio = Dio();
    dio
      ..interceptors.add(DioInterceptor())
      ..interceptors.add(LogInterceptor());
    ;
    try {
      final response = await dio.get((ApiUrls.fetch));
      final jsonData = json.decode(response.toString());
      final List userData = jsonData['data'];
      return userData.map((user) => User.fromJson(user)).toList();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
