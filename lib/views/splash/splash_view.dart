import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/widgets/logo.dart';
import 'package:whatsapp/views/splash/provider/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigates according to the variable from splash_viewmodel after 1 second.
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => context.read<SplashViewModel>().startApp());
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacementNamed(
            context, context.read<SplashViewModel>().navigate));

    return const Logo();
  }
}
