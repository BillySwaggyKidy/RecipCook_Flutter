import 'package:flutter/material.dart';

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
    return const Center(child: Text("tab 1"));
  }
}
