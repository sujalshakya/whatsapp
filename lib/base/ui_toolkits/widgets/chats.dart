import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/models/user.dart';
import 'package:whatsapp/base/provider/user_viewmodel.dart';
import 'package:whatsapp/base/ui_toolkits/widgets/message.dart';

/// This is used to build list of user chats.
/// Requires [users] which is list of user data.

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({
    super.key,
    required this.users,
  });

  final UserData users;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => context.read<UserViewModel>().fetchUsers());
    return SizedBox(
      height: 500,
      child: ListView.builder(
          itemCount: users.data!.length,
          itemBuilder: (context, index) {
            final user = users.data![index];
            return MessageWidget(
              firstName: user.firstName,
              avatar: user.avatar,
              lastName: user.lastName,
            );
          }),
    );
  }
}
