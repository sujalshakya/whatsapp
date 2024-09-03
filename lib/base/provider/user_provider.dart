import 'package:flutter/material.dart';
import 'package:whatsapp/base/service/fetch_service.dart';

class UserProvider extends ChangeNotifier {
  late List users = [];
  bool fetch = true;

  void fetchUsers() async {
    if (fetch == true) {
      try {
        final fetchedUsers = await FetchService.fetchUsers();
        users = fetchedUsers;
        fetch = false;
      } catch (error) {
        debugPrint('Error fetching data.');
      }
      notifyListeners();
    }
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
