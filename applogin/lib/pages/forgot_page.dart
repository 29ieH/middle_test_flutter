import 'package:applogin/component/ButtonCustom.dart';
import 'package:applogin/component/TextFieldCustom.dart';
import 'package:applogin/models/authen.dart';
import 'package:applogin/pages/reset_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  TextEditingController userController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String validUser = "";
    checked() {
      validUser = "";
      bool flag = true;
      if (userController.text.trim().isEmpty) {
        validUser = "Please enter username";
        flag = false;
      }
      (flag)
          ? {
              (userController.text.trim() == Authen.username)
                  ? Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ResetPage()))
                  : ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email not is available')))
            }
          : setState(() {});
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.amber, fontSize: 38),
                )),
            Text(
              'Enter username for search Account',
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
            FractionallySizedBox(
                widthFactor: 0.4,
                child: ButtonCustom(onpressed: () => checked(), Text('Search')))
          ],
        ),
      ),
    );
  }
}
