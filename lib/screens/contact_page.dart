import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:whatsapp/constants/colors.dart';
import 'package:whatsapp/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:whatsapp/widgets/chats.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late List users = [];

  void fetchUsers() async {
    const String baseUrl = 'https://reqres.in/api/users?page=2p';

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> userData = jsonData['data'];

      setState(() {
        users = userData.map((user) => User.fromJson(user)).toList();
      });
    } else {
      debugPrint("Fetching failed");
    }
  }

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: const Icon(
          Icons.arrow_back,
          color: AppColors.white,
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select contact",
              style: TextStyle(color: AppColors.white, fontSize: 16),
            ),
            Text(
              "256 contacts",
              style: TextStyle(color: AppColors.white, fontSize: 12),
            )
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          ),
          Icon(
            Icons.more_vert,
            color: AppColors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text("Create"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.primaryColor),
                      child: const Icon(
                        Icons.people,
                        size: 28,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "New Group",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.primaryColor),
                      child: const Icon(
                        Icons.people,
                        size: 28,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "New Contact",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.qr_code,
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.primaryColor),
                      child: const Icon(
                        Icons.people,
                        size: 28,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "New Community",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                ],
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text("Discover"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.primaryColor),
                      child: const Icon(
                        Icons.house,
                        size: 28,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Businesses",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                ],
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text("Contacts on WhatsApp"),
                ),
              ],
            ),
            Chats(users: users)
          ],
        ),
      ),
    );
  }
}
