import 'package:flutter/material.dart';

class MessageDetail extends StatefulWidget {
  const MessageDetail({super.key});

  @override
  State<MessageDetail> createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> {
  final TextEditingController messageController = TextEditingController();
  List<String> messages = [
    "Hello how are you?",
    "I am fine. What about you?",
    "I am great as well."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00856e),
        leading: Row(
          children: [
            const Icon(Icons.arrow_back, color: Colors.white),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
            ),
          ],
        ),
        title: const Column(
          children: [
            Text("Name", style: TextStyle(color: Colors.white, fontSize: 18)),
            Text("online", style: TextStyle(color: Colors.white, fontSize: 14)),
          ],
        ),
        actions: const [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.video_call, color: Colors.white)),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.phone, color: Colors.white)),
          Icon(Icons.more_vert, color: Colors.white),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color(0XFFDFD4C7)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color.fromARGB(255, 164, 225, 255),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("AUGUST 29, 2024"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 249, 248, 157),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.lock),
                    Flexible(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "1 UNREAD MESSAGE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color.fromARGB(255, 164, 225, 255),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("TODAY"),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isUserMessage = index.isOdd;

                  return Align(
                    alignment: isUserMessage
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isUserMessage
                              ? const Color.fromARGB(255, 192, 234, 144)
                              : Colors.white,
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
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                                setState(() {
                                  if (messageController.text.isNotEmpty) {
                                    messages.add(messageController.text);
                                    messageController.clear();
                                  }
                                });
                              },
                              child: const Icon(Icons.send),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.attach_file),
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
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'contact');
                  },
                  backgroundColor: const Color(0xFF00856e),
                  foregroundColor: Colors.white,
                  shape: const CircleBorder(),
                  child: const Icon(Icons.mic),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
