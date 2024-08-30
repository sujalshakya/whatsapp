import 'package:flutter/material.dart';
import 'package:whatsapp/auth/auth.dart';
import 'package:whatsapp/constants/strings.dart';
import '../constants/assets.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey2 = GlobalKey<FormState>();

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
      body: Form(
        key: _formKey2,
        child: Column(
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
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
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
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Please enter a viable email addresss';
                      }

                      return null;
                    },
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
                  child: TextFormField(
                    validator: (value) {
                      if (value!.length < 8) return 'length too low';
                      if (!value.contains(RegExp(r"[a-z]"))) {
                        return 'small case letter is required';
                      }
                      if (!value.contains(RegExp(r"[A-Z]"))) {
                        return 'capital letter is required';
                      }
                      if (!value.contains(RegExp(r"[0-9]"))) {
                        return 'an integer is required';
                      }
                      if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                        return 'a symbol is required';
                      }
                    },
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
                      if (_formKey2.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        register(context);
                      }
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
      ),
    );
  }
}
