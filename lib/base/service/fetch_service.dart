import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:whatsapp/base/models/user.dart';

class FetchService {
  static fetchUsers() async {
    final dio = Dio();
    const String baseUrl = 'https://reqres.in/api/users?page=2p';
    try {
      final response = await dio.get((baseUrl));

      final jsonData = json.decode(response.toString());
      final List<dynamic> userData = jsonData['data'];
      return userData.map((user) => User.fromJson(user)).toList();
    } catch (e) {
      print(e);
    }
  }
}
