import 'package:flutter/material.dart';
import 'package:whatsapp/base/constants/strings.dart';
import 'package:whatsapp/base/constants/validators.dart';
import 'package:whatsapp/base/ui_toolkits/text/text_labellarge_black.dart';
import 'package:whatsapp/base/ui_toolkits/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/ui_toolkits/widgets/logo.dart';
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
                      context.read<LoginViewModel>().loginApiRequest();
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
                  child: const TextLabellargeBlack(
                    text: Strings.register,
                  ),
                )
              ],
            ),
          ]),
    ));
  }
}
