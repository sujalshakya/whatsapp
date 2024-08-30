import 'package:flutter/material.dart';
import 'package:whatsapp/auth/auth.dart';
import 'package:whatsapp/constants/strings.dart';
import '../constants/assets.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  RegisterPage({super.key});

  void register(BuildContext context) async {
    final String email = emailController.text;
    final String password = passwordController.text;
    final String fullName = fullNameController.text;

    final bool success = await AuthService.register(email, password, fullName);

    if (success) {
      Navigator.pushNamed(context, 'home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Registration failed. Please try again.'),
      ));
    }
  }

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
            child: Text(Strings.name),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(Strings.email),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  controller: emailController,
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
                child: TextField(
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
                    register(context);
                  },
                  child: const Text(Strings.register,
                      style: TextStyle(color: Colors.black)))),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account? "),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: const Text(Strings.login,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
