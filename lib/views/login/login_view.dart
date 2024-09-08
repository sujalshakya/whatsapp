import 'package:flutter/material.dart';
import 'package:whatsapp/base/constants/strings.dart';
import 'package:whatsapp/base/constants/validators.dart';
import 'package:whatsapp/base/ui_toolkits/text/text_labellarge_black.dart';
import 'package:whatsapp/base/ui_toolkits/widgets/auth_footer.dart';
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
            // Email Textfield
            CustomTextField(
              controller: context.read<LoginViewModel>().emailController,
              validator: (value) {
                return Validators.validateLogin(value);
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(Strings.password),
            ),

            // Password textfield
            CustomTextField(
              controller: context.read<LoginViewModel>().passwordController,
              validator: (value) {
                return Validators.validateLogin(value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            // Login Button
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      context.read<LoginViewModel>().loginApiRequest();
                    },
                    child: const TextLabellargeBlack(text: Strings.login))),
            const SizedBox(
              height: 20,
            ),

            /// Line at the bottom which helps navigate to register page.
            AuthFooter(
                message: "Don't have an account?  ",
                ontap: () {
                  Navigator.pushReplacementNamed(context, 'register');
                },
                tap: Strings.register),
          ]),
    ));
  }
}
