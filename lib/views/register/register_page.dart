import 'package:flutter/material.dart';
import 'package:whatsapp/base/constants/strings.dart';
import 'package:whatsapp/base/constants/validators.dart';
import 'package:whatsapp/base/widgets/custom_textfield.dart';
import 'package:whatsapp/views/register/service/register_service.dart';
import '../../base/constants/assets.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final registerKey = GlobalKey<FormState>();

  RegisterPage({super.key});

//Register method
  void register(BuildContext context) async {
    final String email = emailController.text;
    final String password = passwordController.text;
    final String fullName = fullNameController.text;

    final bool success = await AuthService.register(email, password, fullName);

    if (success) {
      if (context.mounted) {
        Navigator.pushNamed(context, 'home');
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Registration failed. Please try again.'),
        ));
      }
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: registerKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Logo
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
            CustomTextField(
              controller: fullNameController,
              validator: (value) {
                return validateLogin(value);
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(Strings.email),
            ),

            CustomTextField(
              controller: emailController,
              validator: (value) {
                return validateEmail(value);
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(Strings.password),
            ),
            CustomTextField(
              controller: passwordController,
              validator: (value) {
                return validatePassword(value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (registerKey.currentState!.validate()) {
                        register(context);
                      }
                    },
                    child: Text(Strings.register,
                        style: Theme.of(context).textTheme.bodyMedium))),
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
                  child: Text(
                    Strings.login,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
