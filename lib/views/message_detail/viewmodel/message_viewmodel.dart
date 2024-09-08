import 'package:flutter/material.dart';

class MessageViewModel extends ChangeNotifier {
  final TextEditingController messageController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  /// List of pre existing messages.
  List<String> messages = [
    "Hello how are you?",
    "I am fine. What about you?",
    "I am great as well."
  ];

  /// Method to add to list if controller is not empty
  /// And clear the controller after adding.
  void addMessage() {
    if (messageController.text.isNotEmpty) {
      messages.add(messageController.text);
      messageController.clear();
    }
    notifyListeners();
  }
}
