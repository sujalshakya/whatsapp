import 'package:flutter/material.dart';
import 'package:whatsapp/base/constants/strings.dart';
import 'package:whatsapp/base/constants/validators.dart';
import 'package:whatsapp/base/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/widgets/logo.dart';
import 'package:whatsapp/views/login/viewmodel/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: context.read<LoginViewModel>().loginKey,
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
              child: Text(Strings.email),
            ),
            CustomTextField(
              controller: context.read<LoginViewModel>().emailController,
              validator: (value) {
                return validateLogin(value);
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(Strings.password),
            ),
            CustomTextField(
              controller: context.read<LoginViewModel>().passwordController,
              validator: (value) {
                return validateLogin(value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (context
                          .read<LoginViewModel>()
                          .loginKey
                          .currentState!
                          .validate()) {
                        context.read<LoginViewModel>().loginApiRequest();
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
                    Navigator.pushReplacementNamed(context, 'register');
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
