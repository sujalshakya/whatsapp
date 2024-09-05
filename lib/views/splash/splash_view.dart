import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/widgets/logo.dart';
import 'package:whatsapp/views/splash/provider/splash_provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => context.read<SplashViewModel>().startApp());
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacementNamed(
            context, context.read<SplashViewModel>().navigate));

    return const Logo();
  }
}
