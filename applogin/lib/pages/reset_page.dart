import 'package:applogin/component/ButtonCustom.dart';
import 'package:applogin/component/TextFieldCustom.dart';
import 'package:applogin/models/authen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String validPassword = "";
    String validConfirmPassword = "";
    checked() {
      validPassword = "";
      validConfirmPassword = "";
      bool flag = true;
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
              Navigator.of(context).pop(),
              Navigator.of(context).pop(),
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Change password success")))
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
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Text(
                  "Reset password",
                  style: TextStyle(color: Colors.amber, fontSize: 38),
                  textAlign: TextAlign.center,
                )),
            Text(
              'Enter new password',
              style: TextStyle(color: Colors.amber),
              textAlign: TextAlign.left,
            ),
            TextFiledCustom(newPasswordController,
                isPassword: true,
                hintText: 'Enter new password',
                action: TextInputAction.next),
            validPassword.isNotEmpty
                ? Text(validPassword,
                    style: const TextStyle(color: Colors.red, fontSize: 14.5))
                : const SizedBox(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Re-Enter new password',
              style: TextStyle(color: Colors.amber),
              textAlign: TextAlign.left,
            ),
            TextFiledCustom(confirmPasswordController,
                isPassword: true,
                hintText: 'Re-Enter new password',
                action: TextInputAction.done),
            validConfirmPassword.isNotEmpty
                ? Text(validConfirmPassword,
                    style: const TextStyle(color: Colors.red, fontSize: 14.5))
                : const SizedBox(),
            SizedBox(
              height: 20,
            ),
            FractionallySizedBox(
                widthFactor: 0.4,
                child: ButtonCustom(onpressed: () => checked(), Text('Change')))
          ],
        ),
      ),
    );
  }
}
