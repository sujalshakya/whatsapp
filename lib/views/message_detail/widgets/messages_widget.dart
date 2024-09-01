import 'package:flutter/material.dart';

class MessagesWidget extends StatelessWidget {
  const MessagesWidget({
    super.key,
    required this.messages,
  });

  final List<String> messages;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          final isUserMessage = index.isOdd;
          return Align(
            alignment:
                isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: isUserMessage
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(message),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
