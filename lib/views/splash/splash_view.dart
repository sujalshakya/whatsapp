import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp/base/constants/assets.dart';
import 'package:whatsapp/base/service/secure_storage.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    _startApp();
    super.initState();
  }

  Future<void> _startApp() async {
    final token = await SecureStorage().getToken('token');
    if (token == null) {
      Timer(const Duration(seconds: 1),
          () => Navigator.pushReplacementNamed(context, 'login'));
    } else {
      Timer(const Duration(seconds: 1),
          () => Navigator.pushReplacementNamed(context, 'home'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Image(
          image: AssetImage(Assets.logo),
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
