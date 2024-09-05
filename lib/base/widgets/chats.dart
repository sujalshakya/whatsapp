import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/models/user.dart';
import 'package:whatsapp/base/provider/user_provider.dart';
import 'package:whatsapp/base/widgets/message.dart';

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
