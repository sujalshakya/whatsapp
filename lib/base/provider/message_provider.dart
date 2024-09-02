import 'package:flutter/material.dart';

class MessageProvider extends ChangeNotifier {
  final TextEditingController messageController = TextEditingController();

  List<String> messages = [
    "Hello how are you?",
    "I am fine. What about you?",
    "I am great as well."
  ];

  void addMessage() {
    print("add");
    if (messageController.text.isNotEmpty) {
      messages.add(messageController.text);
      messageController.clear();
      notifyListeners();
    }
  }
}
