import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/provider/theme_provider.dart';
import 'package:whatsapp/base/provider/user_provider.dart';
import 'package:whatsapp/base/service/secure_storage.dart';
import 'package:whatsapp/base/widgets/chats.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.people,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const Tab(text: 'CHATS'),
            const Tab(text: 'CALLS'),
            const Tab(text: 'STATUS'),
          ]),
          leading: Container(),
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
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
                Provider.of<ThemeProvider>(context, listen: false)
                    .changeTheme();
              },
              child: Icon(
                Icons.more_vert,
                color: Theme.of(context).colorScheme.surface,
              ),
            )
          ],
        ),
        body: TabBarView(children: [
          Column(
            children: [
              ChatsWidget(users: context.watch<UserViewModel>().users),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 32),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'contact');
                      },
                      backgroundColor:
                          Theme.of(context).colorScheme.onSecondary,
                      foregroundColor: Theme.of(context).colorScheme.surface,
                      shape: const CircleBorder(),
                      child: const Icon(Icons.message),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(),
          Container(),
          Container(),
        ]),
      ),
    );
  }
}
