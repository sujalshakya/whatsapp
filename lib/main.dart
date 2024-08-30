import 'package:flutter/material.dart';
import 'package:whatsapp/screens/contact.dart';
import 'package:whatsapp/screens/home.dart';
import 'package:whatsapp/screens/login.dart';
import 'package:whatsapp/screens/message_detail.dart';
import 'package:whatsapp/screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (context) => const Home(),
        'login': (context) => Login(),
        'register': (context) => Register(),
        'message': (context) => MessageDetail(),
        'contact': (context) => const Contact(),
      },
      initialRoute: 'login',
    );
  }
}
