import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/base/constants/api_urls.dart';
import 'package:whatsapp/base/models/user.dart';
import 'package:whatsapp/base/service/interceptor.dart';

class FetchService {
  static fetchUsers() async {
    final dio = Dio();
    dio.interceptors.add(DioInterceptor());
    try {
      final response = await dio.get((ApiUrls.fetch));
      return UserData.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.toString());
    }
  }
}
