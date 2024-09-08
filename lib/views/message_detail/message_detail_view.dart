import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/provider/theme_provider.dart';
import 'package:whatsapp/base/ui_toolkits/text/text_titlelarge.dart';
import 'package:whatsapp/base/ui_toolkits/text/text_titlemedium.dart';
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
          title: const Column(
            children: [
              Row(
                children: [
                  TextTitleLarge(text: "Name"),
                ],
              ),
              Row(
                children: [TextTitleMedium(text: "Online")],
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

            /// Toggle theme of app.
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
        body: const MessageDetailBody());
  }
}
