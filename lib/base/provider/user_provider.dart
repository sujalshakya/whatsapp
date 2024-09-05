import 'package:flutter/material.dart';
import 'package:whatsapp/base/models/user.dart';
import 'package:whatsapp/base/repository/fetch_repository.dart';

class UserViewModel extends ChangeNotifier {
  late UserData users = UserData(data: []);
  bool fetch = true;

  void fetchUsers() async {
    if (fetch == true) {
      try {
        final fetchedUsers = await FetchRepository.fetchUsersToRepository();
        users = fetchedUsers;
        fetch = false;
        notifyListeners();
      } catch (error) {
        debugPrint('Error fetching data.');
      }
    }
  }
}
