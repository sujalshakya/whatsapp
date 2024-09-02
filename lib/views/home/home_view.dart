import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/provider/theme_provider.dart';
import 'package:whatsapp/base/secure_storage.dart';
import 'package:whatsapp/base/service/fetch_service.dart';

import 'package:whatsapp/base/widgets/chats.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomeView> {
  late List users = [];

  void fetchUsers() async {
    try {
      final fetchedUsers = await FetchService.fetchUsers();
      setState(() {
        users = fetchedUsers;
      });
    } catch (error) {
      debugPrint("Fetching failed: $error");
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
        leading: Container(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "WhatsApp",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Theme.of(context).colorScheme.surface),
        ),
        centerTitle: false,
        leadingWidth: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                Navigator.pushReplacementNamed(context, 'login');
                await SecureStorage().deleteToken('token');
              },
              child: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            child: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.surface,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    Icons.people,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("CHATS",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .surface)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Theme.of(context).colorScheme.surface),
                            width: 15,
                            height: 15,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(4, 0, 0, 3),
                              child: Text("3",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 4,
                      width: 102,
                      color: Theme.of(context).colorScheme.surface,
                    )
                  ],
                ),
                Text("CALLS",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.surface)),
                Text("STATUS",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.surface))
              ],
            ),
          ),
          ChatsWidget(users: users),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Colors.grey,
              height: 2,
              width: 380,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock,
                  size: 12,
                ),
                const Text(" Your personal messages are "),
                Text(
                  "end to end encrypted",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: Colors.blue),
                )
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'contact');
                  },
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.surface,
                  shape: const CircleBorder(),
                  child: const Icon(Icons.message),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
