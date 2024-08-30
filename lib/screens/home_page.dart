import 'package:flutter/material.dart';
import 'package:whatsapp/constants/colors.dart';

import '../widgets/message.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "WhatsApp",
          style: TextStyle(color: AppColors.white),
        ),
        centerTitle: false,
        leadingWidth: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          ),
          Icon(
            Icons.more_vert,
            color: AppColors.white,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(
                    Icons.people,
                    color: AppColors.white,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("CHATS",
                              style: TextStyle(color: AppColors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: AppColors.white),
                            width: 15,
                            height: 15,
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(4, 0, 0, 3),
                              child: Text(
                                "3",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 4,
                      width: 102,
                      color: AppColors.white,
                    )
                  ],
                ),
                const Text("CALLS", style: TextStyle(color: AppColors.white)),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child:
                      Text("STATUS", style: TextStyle(color: AppColors.white)),
                )
              ],
            ),
          ),
          const Message(),
          const Message(),
          const Message(),
          const Message(),
          const Message(),
          const Message(),
          const Message(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Colors.grey,
              height: 2,
              width: 380,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock,
                  size: 12,
                ),
                Text(" Your personal messages are "),
                Text(
                  "end to end encrypted",
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'contact');
                  },
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.white,
                  shape: const CircleBorder(),
                  child: const Icon(Icons.message),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
