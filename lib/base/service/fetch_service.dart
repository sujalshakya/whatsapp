import 'dart:convert';

import 'package:whatsapp/base/models/user.dart';
import 'package:http/http.dart' as http;

class FetchService {
  static fetchUsers() async {
    const String baseUrl = 'https://reqres.in/api/users?page=2p';

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> userData = jsonData['data'];
      return userData.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception("Failed to fetch users");
    }
  }
}
