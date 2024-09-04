import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/constants/assets.dart';
import 'package:whatsapp/views/splash/provider/splash_provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => context.read<SplashProvider>().startApp(context));

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
