import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/provider/message_provider.dart';
import 'package:whatsapp/base/provider/theme_provider.dart';
import 'package:whatsapp/views/message_detail/widgets/messages_widget.dart';

class MessageDetailView extends StatefulWidget {
  const MessageDetailView({super.key});

  @override
  State<MessageDetailView> createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetailView> {
  final TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
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
      body: Consumer<MessageProvider>(
        builder: (context, messageProvider, child) {
          return Container(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.onError),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("AUGUST 29, 2024"),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock,
                            color: Theme.of(context).colorScheme.onSurface,
                            size: 16,
                          ),
                          const Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Messages to this chat and calls are now secured with end-to-end encryption. Tap for more info.",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "1 UNREAD MESSAGE",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ),
                  ),
                ),
                //Divider
                Container(
                  width: double.infinity,
                  height: 0.5,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("TODAY"),
                    ),
                  ),
                ),
                MessagesWidget(messages: messageProvider.messages),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        width: 330,
                        child: TextField(
                          controller: messageController,
                          decoration: InputDecoration(
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    messageProvider.addMessage();
                                  },
                                  child: const Icon(Icons.send),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.attach_file,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.camera_alt),
                                ),
                              ],
                            ),
                            icon: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.emoji_emotions_outlined,
                                color: Colors.grey,
                              ),
                            ),
                            hintText: "Type a message",
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            hintStyle: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'contact');
                      },
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.surface,
                      shape: const CircleBorder(),
                      child: const Icon(Icons.mic),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
