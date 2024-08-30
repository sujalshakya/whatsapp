import 'package:flutter/material.dart';
import 'package:whatsapp/screens/contact_page.dart';
import 'package:whatsapp/screens/home_page.dart';
import 'package:whatsapp/screens/login_page.dart';
import 'package:whatsapp/screens/message_detail_page.dart';
import 'package:whatsapp/screens/register_page.dart';
import 'package:whatsapp/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
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
