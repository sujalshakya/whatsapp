import 'package:flutter/material.dart';
import 'package:whatsapp/base/constants/assets.dart';
import 'package:whatsapp/base/constants/strings.dart';
import 'package:whatsapp/base/constants/validators.dart';
import 'package:whatsapp/base/widgets/custom_textfield.dart';
import 'package:whatsapp/views/login/service/login_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  void login(BuildContext context) async {
    final String email = emailController.text;
    final String password = passwordController.text;

    final bool success = await AuthService.login(email, password);

    if (success) {
      Navigator.pushNamed(context, 'home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login failed. Please try again.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
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
              child: Text(Strings.email),
            ),
            CustomTextField(
              controller: emailController,
              validator: (value) {
                Validators.validateLogin(value);
                return null;
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(Strings.password),
            ),
            CustomTextField(
              controller: passwordController,
              validator: (value) {
                Validators.validateLogin(value);
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        login(context);
                      }
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
                  child: Text(
                    Strings.register,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                )
              ],
            ),
          ]),
    ));
  }
}
