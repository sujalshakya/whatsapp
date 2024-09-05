import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/provider/theme_provider.dart';
import 'package:whatsapp/base/service/secure_storage.dart';
import 'package:whatsapp/views/home/widget/home_body.dart';

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
        body: const HomeBody(),
      ),
    );
  }
}
