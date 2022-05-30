import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;
  double width;
  double height;
  Color color;

  Button(
      {required this.text,
      required this.width,
      required this.height,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      buttonColor: color,
      minWidth: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}
