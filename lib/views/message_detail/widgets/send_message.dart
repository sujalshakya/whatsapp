import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/views/message_detail/viewmodel/message_viewmodel.dart';

/// Row of widgets for typing message and sending it.

class SendMessage extends StatelessWidget {
  const SendMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
              controller: context.watch<MessageViewModel>().messageController,
              decoration: InputDecoration(
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<MessageViewModel>().addMessage();
                      },
                      child: const Icon(Icons.send),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.attach_file,
                        color: Theme.of(context).colorScheme.onSurface,
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
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          foregroundColor: Theme.of(context).colorScheme.surface,
          shape: const CircleBorder(),
          child: const Icon(Icons.mic),
        )
      ],
    );
  }
}
