import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/views/message_detail/viewmodel/message_viewmodel.dart';
import 'package:whatsapp/views/message_detail/widgets/date_container.dart';
import 'package:whatsapp/views/message_detail/widgets/messages_widget.dart';
import 'package:whatsapp/views/message_detail/widgets/send_message.dart';

class MessageDetailBody extends StatelessWidget {
  const MessageDetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.onError),
      child: Column(
        children: [
          /// Blue colored container with text.
          const DateContainer(text: 'SEPTEMBER 05, 2024'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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

          // Divider
          Container(
            width: double.infinity,
            height: 0.5,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          const DateContainer(
            text: 'TODAY',
          ),

          /// Shows messages alternatingly in different colors.
          MessagesWidget(messages: context.watch<MessageViewModel>().messages),

          /// The row of textfield with button to add text to messages list and floating action button.

          const SendMessage()
        ],
      ),
    );
  }
}
