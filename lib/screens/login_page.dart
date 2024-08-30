import 'package:flutter/material.dart';
import 'package:whatsapp/constants/assets.dart';
import 'package:whatsapp/constants/strings.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Image(
                image: AssetImage(Assets.logo),
                width: 100,
                height: 100,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(Strings.phoneNum),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(Strings.password),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(12)),
                child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'home');
                  },
                  child: Text(
                    Strings.login,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ))),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account? "),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'register');
                },
                child: const Text(
                  Strings.register,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ]));
  }
}
