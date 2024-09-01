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
  final _formKey2 = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey2,
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
                Validators.validateLogin(value);
                return null;
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(Strings.email),
            ),

            CustomTextField(
              controller: emailController,
              validator: (value) {
                Validators.validateEmail(value);
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
                Validators.validatePassword(value);
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey2.currentState!.validate()) {
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
