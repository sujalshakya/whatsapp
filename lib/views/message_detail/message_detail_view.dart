import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/provider/theme_provider.dart';
import 'package:whatsapp/views/message_detail/widgets/message_detail_body.dart';

class MessageDetailView extends StatelessWidget {
  const MessageDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          leading: Row(
            children: [
              Icon(Icons.arrow_back,
                  color: Theme.of(context).colorScheme.surface),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ],
          ),
          title: Column(
            children: [
              Row(
                children: [
                  Text("Name",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.surface)),
                ],
              ),
              Row(
                children: [
                  Text("online",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.surface)),
                ],
              ),
            ],
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.video_call,
                    color: Theme.of(context).colorScheme.surface)),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.phone,
                    color: Theme.of(context).colorScheme.surface)),
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

        /// Body in a different file
        body: const MessageDetailBody());
  }
}
