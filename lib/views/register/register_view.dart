import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/base/constants/strings.dart';
import 'package:whatsapp/base/constants/validators.dart';
import 'package:whatsapp/base/ui_toolkits/text/text_labellarge_black.dart';
import 'package:whatsapp/base/ui_toolkits/widgets/custom_textfield.dart';
import 'package:whatsapp/base/ui_toolkits/widgets/logo.dart';
import 'package:whatsapp/views/register/viewmodel/register_viewmodel.dart';
import 'package:whatsapp/base/ui_toolkits/widgets/auth_footer.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Register Form
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
            // Name controller
            CustomTextField(
              controller: context.read<RegisterViewModel>().fullNameController,
              validator: (value) {
                return Validators.validateLogin(value);
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(Strings.email),
            ),

            // Email controller
            CustomTextField(
              controller: context.read<RegisterViewModel>().emailController,
              validator: (value) {
                return Validators.validateEmail(value);
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(Strings.password),
            ),
            // Password controller
            CustomTextField(
              controller: context.read<RegisterViewModel>().passwordController,
              validator: (value) {
                return Validators.validatePassword(value);
              },
            ),
            const SizedBox(
              height: 20,
            ),

            /// Register Button
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      context.read<RegisterViewModel>().registerApiRequest();
                    },
                    child: const TextLabellargeBlack(text: Strings.register))),
            const SizedBox(
              height: 20,
            ),

            /// Line at the bottom which helps navigate to login page.

            AuthFooter(
                message: 'Already have an account?  ',
                ontap: () {
                  Navigator.pushReplacementNamed(context, 'login');
                },
                tap: Strings.login),
          ],
        ),
      ),
    );
  }
}
