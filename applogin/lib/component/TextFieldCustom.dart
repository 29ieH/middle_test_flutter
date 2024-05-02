import 'package:flutter/material.dart';

class TextFiledCustom extends StatelessWidget {
  const TextFiledCustom(this.textController,
      {super.key,
      required this.hintText,
      this.preIcon,
      required this.action,
      this.borderColor = Colors.amber,
      this.bgColor = Colors.white,
      this.isPassword = false});
  final TextEditingController textController;
  final String hintText;
  final Icon? preIcon;
  final TextInputAction action;
  final Color borderColor;
  final Color bgColor;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: (preIcon == null) ? 26.0 : 0),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1.2),
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: bgColor,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 3), blurRadius: 5.0, color: Colors.black38)
            ]),
        child: TextFormField(
          obscureText: isPassword,
          controller: textController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            prefixIcon: preIcon,
            prefixIconConstraints: const BoxConstraints(minWidth: 40.0),
          ),
        ));
  }
}
