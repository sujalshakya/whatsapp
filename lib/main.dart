import 'package:flutter/material.dart';
import 'package:whatsapp/views/contact_page.dart';
import 'package:whatsapp/views/home_page.dart';
import 'package:whatsapp/views/login/login_page.dart';
import 'package:whatsapp/views/message_detail/message_detail_page.dart';
import 'package:whatsapp/views/register/register_page.dart';
import 'package:whatsapp/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: dark,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (context) => const HomePage(),
        'login': (context) => LoginPage(),
        'register': (context) => RegisterPage(),
        'message': (context) => const MessageDetailPage(),
        'contact': (context) => const ContactPage(),
      },
      initialRoute: 'home',
    );
  }
}
