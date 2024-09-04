import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/base/provider/user_provider.dart';
import 'package:whatsapp/views/message_detail/provider/message_provider.dart';
import 'package:whatsapp/base/provider/theme_provider.dart';
import 'package:whatsapp/views/contact/contact_view.dart';
import 'package:whatsapp/views/home/home_view.dart';
import 'package:whatsapp/views/login/login_view.dart';
import 'package:whatsapp/views/splash/splash_view.dart';
import 'package:whatsapp/views/message_detail/message_detail_view.dart';
import 'package:whatsapp/views/register/register_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool themeBool = prefs.getBool("isDark") ?? false;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => ThemeProvider(isDark: themeBool)),
    ChangeNotifierProvider(create: (context) => MessageProvider()),
    ChangeNotifierProvider(create: (context) => UserProvider()),
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
          'home': (context) => const HomeView(),
          'login': (context) => LoginView(),
          'register': (context) => RegisterView(),
          'message': (context) => MessageDetailView(),
          'contact': (context) => const ContactView(),
          'splash': (context) => const SplashView()
        },
        initialRoute: 'splash',
      );
    });
  }
}
