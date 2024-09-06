import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/constants/strings.dart';
import 'package:whatsapp/base/constants/validators.dart';
import 'package:whatsapp/base/ui_toolkits/text/text_bodymedium.dart';
import 'package:whatsapp/base/ui_toolkits/text/text_labellarge_black.dart';
import 'package:whatsapp/base/ui_toolkits/widgets/custom_textfield.dart';
import 'package:whatsapp/base/ui_toolkits/widgets/logo.dart';
import 'package:whatsapp/views/register/viewmodel/register_viewmodel.dart';

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

            //Register Button
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      context.read<RegisterViewModel>().registerApiRequest();
                    },
                    child: const TextBodyMedium(text: Strings.register))),
            const SizedBox(
              height: 20,
            ),

            // Line at the bottom which navigates to login page when tapped.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                  child: const TextLabellargeBlack(
                    text: Strings.login,
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
