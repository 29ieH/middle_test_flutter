import 'package:applogin/models/authen.dart';
import 'package:flutter/material.dart';
import '../component/ButtonCustom.dart';
import '../component/TextFieldCustom.dart';
import 'forgot_page.dart';
import 'register_page.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key, required this.username});
  final String username;
  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  String validUser = "";
  String validPassword = "";
  String validNewPassword = "";
  String validConfirmPassword = "";
  @override
  Widget build(BuildContext context) {
    TextEditingController userController =
        TextEditingController(text: widget.username);
    TextEditingController passwordCurrent = TextEditingController();
    TextEditingController passwordNewController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    login() {
      validUser = "";
      validPassword = "";
      validNewPassword = "";
      validConfirmPassword = "";
      bool check = true;
      if (userController.text.trim().isEmpty) {
        validUser = "Please enter username";
        check = false;
      }
      if (passwordCurrent.text.trim().isEmpty) {
        validPassword = "Please enter password";
        check = false;
      }
      if (passwordNewController.text.trim().isEmpty) {
        validNewPassword = "Please enter new password";
        check = false;
      }
      if (confirmPasswordController.text.trim().isEmpty) {
        validConfirmPassword = "Please enter confirm password";
        check = false;
      }
      if (!passwordNewController.text.trim().isEmpty &&
          !confirmPasswordController.text.trim().isEmpty) {
        if (!(passwordNewController.text.trim() ==
            confirmPasswordController.text.trim())) {
          validConfirmPassword = "Password incorrect";
          check = false;
        }
      }
      (check)
          ? (passwordCurrent.text.trim() != Authen.password)
              ? {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Old password is incorrect')))
                }
              : {
                  Authen.password = confirmPasswordController.text.trim(),
                  Navigator.pop(context),
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Change password succesful')))
                }
          : setState(() {});
    }

    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 36),
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Text(
                  'Username',
                  style: TextStyle(color: Colors.amber, fontSize: 16.0),
                  textAlign: TextAlign.left,
                ),
                TextFiledCustom(
                  userController,
                  hintText: "Enter username",
                  action: TextInputAction.next,
                  preIcon: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
                validUser.isNotEmpty
                    ? Text(validUser,
                        style:
                            const TextStyle(color: Colors.red, fontSize: 14.5))
                    : const SizedBox(),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Password',
                  style: TextStyle(color: Colors.amber, fontSize: 16.0),
                  textAlign: TextAlign.left,
                ),
                TextFiledCustom(
                  isPassword: true,
                  passwordCurrent,
                  hintText: "Enter password",
                  action: TextInputAction.next,
                  preIcon: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
                validPassword.isNotEmpty
                    ? Text(
                        validPassword,
                        style:
                            const TextStyle(color: Colors.red, fontSize: 14.5),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'New password',
                  style: TextStyle(color: Colors.amber, fontSize: 16.0),
                  textAlign: TextAlign.left,
                ),
                TextFiledCustom(
                  isPassword: true,
                  passwordNewController,
                  hintText: "Enter new password",
                  action: TextInputAction.next,
                  preIcon: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
                validNewPassword.isNotEmpty
                    ? Text(validNewPassword,
                        style:
                            const TextStyle(color: Colors.red, fontSize: 14.5))
                    : const SizedBox(),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'ReEnter new password',
                  style: TextStyle(color: Colors.amber, fontSize: 16.0),
                  textAlign: TextAlign.left,
                ),
                TextFiledCustom(
                  isPassword: true,
                  confirmPasswordController,
                  hintText: "ReEnter new password",
                  action: TextInputAction.done,
                  preIcon: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
                validConfirmPassword.isNotEmpty
                    ? Text(validConfirmPassword,
                        style:
                            const TextStyle(color: Colors.red, fontSize: 14.5))
                    : const SizedBox(),
                const SizedBox(
                  height: 30,
                ),
                FractionallySizedBox(
                  widthFactor: 0.4,
                  child: ButtonCustom(
                    Text(
                      'Change',
                      style: TextStyle(color: Colors.white),
                    ),
                    onpressed: () => login(),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ForgotPage())),
                    child: Text('Forgot password?')),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text('|')),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage())),
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ))
      ]),
    );
  }
}
