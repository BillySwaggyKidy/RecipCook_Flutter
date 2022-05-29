import 'package:flutter/material.dart';

class TabTitle extends StatelessWidget {
  String title;

  TabTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 154, 119, 28),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      )
    ]);
  }
}
