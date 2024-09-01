import 'package:flutter/material.dart';
import 'package:whatsapp/base/widgets/message.dart';

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({
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
              return MessageWidget(
                firstName: user.firstName,
                avatar: user.avatar,
                lastName: user.lastName,
              );
            }),
      ),
    );
  }
}
