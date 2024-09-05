import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/constants/strings.dart';
import 'package:whatsapp/base/constants/validators.dart';
import 'package:whatsapp/base/widgets/custom_textfield.dart';
import 'package:whatsapp/base/widgets/logo.dart';
import 'package:whatsapp/views/register/provider/register_viewmodel.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: context.read<RegisterViewModel>().registerKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Logo(),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(Strings.name),
            ),
            CustomTextField(
              controller: context.read<RegisterViewModel>().fullNameController,
              validator: (value) {
                return validateLogin(value);
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(Strings.email),
            ),
            CustomTextField(
              controller: context.read<RegisterViewModel>().emailController,
              validator: (value) {
                return validateEmail(value);
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(Strings.password),
            ),
            CustomTextField(
              controller: context.read<RegisterViewModel>().passwordController,
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
                      if (context
                          .read<RegisterViewModel>()
                          .registerKey
                          .currentState!
                          .validate()) {
                        context.read<RegisterViewModel>().registerApiRequest();
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
                    Navigator.pushReplacementNamed(context, 'login');
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
