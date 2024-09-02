import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/base/provider/theme_provider.dart';
import 'package:whatsapp/views/contact/contact_page.dart';
import 'package:whatsapp/views/home/home_page.dart';
import 'package:whatsapp/views/login/login_page.dart';
import 'package:whatsapp/views/message_detail/message_detail_page.dart';
import 'package:whatsapp/views/register/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool themeBool = prefs.getBool("isDark") ?? false;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => ThemeProvider(isDark: themeBool))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        theme: themeProvider.getTheme,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: {
          'home': (context) => const HomePage(),
          'login': (context) => LoginPage(),
          'register': (context) => RegisterPage(),
          'message': (context) => const MessageDetailPage(),
          'contact': (context) => const ContactPage(),
        },
        initialRoute: 'login',
      );
    });
  }
}
