import 'package:flutter/material.dart';

class MessageViewModel extends ChangeNotifier {
  final TextEditingController messageController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  List<String> messages = [
    "Hello how are you?",
    "I am fine. What about you?",
    "I am great as well."
  ];

  void addMessage() {
    if (messageController.text.isNotEmpty) {
      messages.add(messageController.text);
      messageController.clear();
    }
    notifyListeners();
  }
}
