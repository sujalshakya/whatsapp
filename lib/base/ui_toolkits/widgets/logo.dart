import 'package:flutter/material.dart';
import 'package:whatsapp/base/constants/assets.dart';

class Logo extends StatelessWidget {
  /// Logo of app.

  const Logo({
    super.key,
  });

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
