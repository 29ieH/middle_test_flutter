import 'package:applogin/pages/change_password_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.username});
  final String username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(children: [
        Positioned.fill(
          child: Center(
            child: Text(
              'Welcome Admin ❤️',
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 43,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
            bottom: 20,
            right: 20,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePasswordPage(
                                  username: widget.username,
                                ))),
                    child: Text('Changle Password')),
                GestureDetector(
                    onTap: () => Navigator.pop(context), child: Text('Logout'))
              ],
            ))
      ]),
    );
  }
}
