import 'package:flutter/material.dart';
import 'package:whatsapp/base/ui_toolkits/text/text_labellarge.dart';

class MessageWidget extends StatelessWidget {
  final String firstName;
  final String avatar;
  final String lastName;

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
                    // Static number of messages unread.
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 4, 0, 0),
                      child: Text(
                        "3",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
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
