import 'package:flutter/material.dart';

class MessageProvider extends ChangeNotifier {
  List<String> messages = [
    "Hello how are you?",
    "I am fine. What about you?",
    "I am great as well."
  ];

  void addMessage(String value) {
    messages.add(value);
    notifyListeners();
  }
}
