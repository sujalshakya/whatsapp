import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Register({super.key});

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
                image: AssetImage("assets/image/logo.webp"),
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
            child: Text("Phone Number"),
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
            child: Text("Password"),
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Confirm Password"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  controller: confirmPasswordController,
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
                    Navigator.pushNamed(context, 'login');
                  },
                  child: const Text("Register",
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
                child: const Text("Login",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
