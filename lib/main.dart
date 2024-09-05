import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/base/provider/user_provider.dart';
import 'package:whatsapp/base/route.dart';
import 'package:whatsapp/views/login/viewmodel/login_viewmodel.dart';
import 'package:whatsapp/views/message_detail/viewmodel/message_viewmodel.dart';
import 'package:whatsapp/base/provider/theme_provider.dart';
import 'package:whatsapp/views/contact/contact_view.dart';
import 'package:whatsapp/views/home/home_view.dart';
import 'package:whatsapp/views/login/login_view.dart';
import 'package:whatsapp/views/register/viewmodel/register_viewmodel.dart';
import 'package:whatsapp/views/splash/provider/splash_viewmodel.dart';
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
    ChangeNotifierProvider(create: (context) => MessageViewModel()),
    ChangeNotifierProvider(create: (context) => UserViewModel()),
    ChangeNotifierProvider(create: (context) => SplashViewModel()),
    ChangeNotifierProvider(create: (context) => LoginViewModel()),
    ChangeNotifierProvider(create: (context) => RegisterViewModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        onGenerateRoute: routes,
        navigatorKey: navigatorKey,
        theme: themeProvider.getTheme,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: {
          'home': (context) => const HomeView(),
          'login': (context) => const LoginView(),
          'register': (context) => const RegisterView(),
          'message': (context) => const MessageDetailView(),
          'contact': (context) => const ContactView(),
          'splash': (context) => const SplashView()
        },
        initialRoute: 'splash',
      );
    });
  }
}
