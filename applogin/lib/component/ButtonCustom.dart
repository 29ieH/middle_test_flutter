import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom(this.content,
      {super.key,
      this.onpressed,
      this.bgColor = Colors.amber,
      this.borderColor = Colors.grey,
      this.heightB = 38.0});
  final Function()? onpressed;
  final Color bgColor;
  final Color borderColor;
  final Widget content;
  final double heightB;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: heightB,
        decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: bgColor, width: 0.8),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Center(
          child: content,
        ),
      ),
    );
  }
}
