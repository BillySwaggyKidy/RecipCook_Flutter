import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Ingredient extends StatefulWidget {
  Ingredient({required Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Ingredient();
  }
}

class _Ingredient extends State {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      textDirection: TextDirection.ltr,
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('img/tab1-background.jpeg'),
            fit: BoxFit.fitHeight,
            alignment: FractionalOffset.topCenter,
          )),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 154, 119, 28),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Text(
                  "Ingredient",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              )
            ]),
          ],
        )
      ],
    );
  }
}
