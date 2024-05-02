import 'package:applogin/component/ButtonCustom.dart';
import 'package:applogin/component/TextFieldCustom.dart';
import 'package:applogin/models/authen.dart';
import 'package:applogin/pages/forgot_page.dart';
import 'package:applogin/pages/home_page.dart';
import 'package:applogin/pages/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String validUser = "";
  String validPassword = "";
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  login() {
    validUser = "";
    validPassword = "";
    bool check = true;
    if (userController.text.trim().isEmpty) {
      validUser = "Please enter username";
      check = false;
    }
    if (passwordController.text.trim().isEmpty) {
      validPassword = "Please enter password";
      check = false;
    }
    (check)
        ? Authen.checkedAccount(userController.text, passwordController.text)
            ? {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contect) => HomePage(
                              username: userController.text.trim(),
                            ))),
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Login succes')))
              }
            : ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Username and Password are incorrect')))
        : setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                    'Login',
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
                  passwordController,
                  hintText: "Enter password",
                  action: TextInputAction.done,
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
                FractionallySizedBox(
                  widthFactor: 0.4,
                  child: ButtonCustom(
                    Text(
                      'Login',
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
