import 'package:flutter/material.dart';
import 'package:whatsapp/constants/colors.dart';

class Message extends StatelessWidget {
  const Message({
    super.key,
  });

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
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: AppColors.secondaryColor),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Message")
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
                Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}
