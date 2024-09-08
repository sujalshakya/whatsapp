import 'package:flutter/material.dart';
import 'package:whatsapp/views/contact/contact_view.dart';
import 'package:whatsapp/views/home/home_view.dart';
import 'package:whatsapp/views/login/login_view.dart';
import 'package:whatsapp/views/message_detail/message_detail_view.dart';
import 'package:whatsapp/views/register/register_view.dart';
import 'package:whatsapp/views/splash/splash_view.dart';

/// Defines a list of routes of to use for navigation without context.

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Route<dynamic>? routes(RouteSettings settings) {
  switch (settings.name) {
    case 'home':
      return MaterialPageRoute(builder: (_) => const HomeView());
    case 'login':
      return MaterialPageRoute(builder: (_) => const LoginView());
    case 'register':
      return MaterialPageRoute(builder: (_) => const RegisterView());
    case 'message':
      return MaterialPageRoute(builder: (_) => const MessageDetailView());
    case 'contact':
      return MaterialPageRoute(builder: (_) => const ContactView());
    case 'splash':
      return MaterialPageRoute(builder: (_) => const SplashView());
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
      );
  }
}
