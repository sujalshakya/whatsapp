import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/provider/user_provider.dart';
import 'package:whatsapp/base/ui_toolkits/widgets/chats.dart';
import 'package:whatsapp/views/contact/widget/contact_group.dart';

class ContactBody extends StatelessWidget {
  const ContactBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          const ContactGroup(
            text: 'New Group',
            icon: Icons.people,
          ),
          const ContactGroup(
            text: 'New Contact',
            icon: Icons.people,
          ),
          const ContactGroup(
            text: 'New Community',
            icon: Icons.people,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text("Discover"),
              ),
            ],
          ),
          const ContactGroup(
            text: 'Businesses',
            icon: Icons.house,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text("Contacts on WhatsApp"),
              ),
            ],
          ),

          /// A list of list tiles with user data.
          ChatsWidget(users: context.read<UserProvider>().users)
        ],
      ),
    );
  }
}
