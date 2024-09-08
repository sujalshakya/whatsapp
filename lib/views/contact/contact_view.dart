import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/provider/theme_provider.dart';
import 'package:whatsapp/base/provider/user_viewmodel.dart';
import 'package:whatsapp/views/contact/widget/contact_body.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => context.read<UserViewModel>().fetchUsers());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        leading: Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.surface,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select contact",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.surface),
            ),
            Text(
              "256 contacts",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: Theme.of(context).colorScheme.surface),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.surface,
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
              ))
        ],
      ),

      /// Body in different file.
      body: const ContactBody(),
    );
  }
}
