import 'package:flutter/material.dart';
import 'package:whatsapp/base/service/fetch_service.dart';

class UserProvider extends ChangeNotifier {
  late List users = [];

  void fetchUsers() async {
    try {
      final fetchedUsers = await FetchService.fetchUsers();

      users = fetchedUsers;
    } catch (error) {
      debugPrint('Error fetching data.');
    }
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
