import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/provider/user_provider.dart';
import 'package:whatsapp/base/widgets/chats.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'contact');
                  },
                  backgroundColor: Theme.of(context).colorScheme.onSecondary,
                  foregroundColor: Theme.of(context).colorScheme.surface,
                  shape: const CircleBorder(),
                  child: const Icon(Icons.message),
                ),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
    ]);
  }
}
