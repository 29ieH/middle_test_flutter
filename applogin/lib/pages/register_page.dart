import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../component/ButtonCustom.dart';
import '../component/TextFieldCustom.dart';
import '../models/authen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    String validUser = "";
    String validPassword = "";
    String validConfirmPassword = "";
    checked() {
      validPassword = "";
      validConfirmPassword = "";
      bool flag = true;
      if (userController.text.trim().isEmpty) {
        validUser = "Please enter username";
        flag = false;
      }
      if (newPasswordController.text.trim().isEmpty) {
        validPassword = "Please enter new password";
        flag = false;
      }
      if (confirmPasswordController.text.trim().isEmpty) {
        validConfirmPassword = "Please re-enter new password";
        flag = false;
      }
      if (!confirmPasswordController.text.trim().isEmpty &&
          !newPasswordController.text.trim().isEmpty) {
        if (!(newPasswordController.text.trim() ==
            confirmPasswordController.text.trim())) {
          validConfirmPassword = "Password is correct";
          flag = false;
        }
      }
      (flag)
          ? {
              Authen.password = newPasswordController.text.trim(),
              Authen.username = userController.text.trim(),
              Navigator.of(context).pop(),
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Register success")))
            }
          : setState(() {});
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.amber, fontSize: 36),
                )),
            Text(
              'Enter username',
              textAlign: TextAlign.left,
            ),
            TextFiledCustom(userController,
                hintText: 'Enter user name', action: TextInputAction.done),
            validUser.isNotEmpty
                ? Text(validUser,
                    style: const TextStyle(color: Colors.red, fontSize: 14.5))
                : const SizedBox(),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Enter password',
              textAlign: TextAlign.left,
            ),
            TextFiledCustom(newPasswordController,
                isPassword: true,
                hintText: 'Enter password',
                action: TextInputAction.done),
            validPassword.isNotEmpty
                ? Text(validUser,
                    style: const TextStyle(color: Colors.red, fontSize: 14.5))
                : const SizedBox(),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Re-enter password',
              textAlign: TextAlign.left,
            ),
            TextFiledCustom(confirmPasswordController,
                isPassword: true,
                hintText: 'Re-enter password',
                action: TextInputAction.done),
            validConfirmPassword.isNotEmpty
                ? Text(validUser,
                    style: const TextStyle(color: Colors.red, fontSize: 14.5))
                : const SizedBox(),
            const SizedBox(
              height: 30,
            ),
            FractionallySizedBox(
                widthFactor: 0.4,
                child:
                    ButtonCustom(onpressed: () => checked(), Text('Register')))
          ],
        ),
      ),
    );
  }
}
