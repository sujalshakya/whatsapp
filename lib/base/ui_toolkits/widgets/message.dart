import 'package:flutter/material.dart';
import 'package:whatsapp/base/ui_toolkits/text/text_labellarge.dart';
import 'package:whatsapp/base/ui_toolkits/text/text_labelsmall.dart';

/// An individual chat box.
class MessageWidget extends StatelessWidget {
  final String firstName;
  final String avatar;
  final String lastName;

  /// Requires [firstName] which is shown as [text].
  /// Requires [avatar] which is used to show profile picture by converting url to image.
  /// Requires [lastName] which is shown as [text].
  const MessageWidget(
      {super.key,
      required this.firstName,
      required this.avatar,
      required this.lastName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'message');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(avatar),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      LabelLarge(text: firstName),
                      const Text(" "),
                      LabelLarge(text: lastName),
                    ],
                  ),
                  const Text("Message")
                ],
              ),
            ),
            const Spacer(),
            Column(
              children: [
                // Static time
                const Text("14:24"),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Theme.of(context).colorScheme.onSecondary),
                    width: 25,
                    height: 25,

                    // Static number of messages.
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 4, 0, 0),
                      child: TextLabelSmall(text: "3"),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
