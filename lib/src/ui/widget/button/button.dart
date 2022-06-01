import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;
  double width;
  double height;
  Color color;
  dynamic onPressed;

  Button(
      {required this.text,
      required this.width,
      required this.height,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      buttonColor: color,
      minWidth: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color)),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
