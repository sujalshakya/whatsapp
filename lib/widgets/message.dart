import 'package:flutter/material.dart';
import 'package:whatsapp/constants/colors.dart';

class Message extends StatelessWidget {
  final String firstName;
  final String avatar;
  final String lastName;

  const Message(
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
                      Text(
                        firstName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(" "),
                      Text(
                        lastName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Text("Message")
                ],
              ),
            ),
            const Spacer(),
            Column(
              children: [
                const Text("14:24"),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: AppColors.primaryColor),
                    width: 25,
                    height: 25,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(10, 4, 0, 0),
                      child: Text(
                        "3",
                        style: TextStyle(fontSize: 12, color: AppColors.white),
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
