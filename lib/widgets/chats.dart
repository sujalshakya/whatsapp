import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/message.dart';

class Chats extends StatelessWidget {
  const Chats({
    super.key,
    required this.users,
  });

  final List users;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Expanded(
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Message(
                firstName: user.firstName,
                avatar: user.avatar,
                lastName: user.lastName,
              );
            }),
      ),
    );
  }
}
