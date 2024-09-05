import 'package:flutter/material.dart';
import 'package:whatsapp/base/models/user.dart';
import 'package:whatsapp/base/service/fetch_service.dart';

abstract class FetchRepository {
  static fetchUsersToRepository() async {
    try {
      final response = await FetchService.fetchUsersApiCall();
      return UserData.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
