import 'package:flutter/material.dart';
import 'package:whatsapp/base/models/user.dart';
import 'package:whatsapp/base/repository/fetch_user/fetch_repository.dart';
import 'package:whatsapp/base/service/fetch_service.dart';

/// Convert Api data to list of user datas.

interface class FetchRepositoryImplementation implements FetchRepository {
  @override
  fetchUsersToRepository() async {
    try {
      final response = await FetchService.fetchUsersApiCall();
      return UserData.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
