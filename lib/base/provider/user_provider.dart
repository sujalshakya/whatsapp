import 'package:flutter/material.dart';
import 'package:whatsapp/base/models/user.dart';
import 'package:whatsapp/base/repository/fetch_user/fetch_repository_implementation.dart';

class UserProvider extends ChangeNotifier {
  late UserData users = UserData(data: []);
  bool fetch = true;
  final fetchRepo = FetchRepositoryImplementation();
  void fetchUsers() async {
    if (fetch == true) {
      try {
        final fetchedUsers = await fetchRepo.fetchUsersToRepository();
        users = fetchedUsers;
        fetch = false;
        notifyListeners();
      } catch (error) {
        debugPrint('Error fetching data.');
      }
    }
  }
}
