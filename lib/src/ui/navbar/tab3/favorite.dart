import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  Favorite({required Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Favorite();
  }
}

class _Favorite extends State {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("tab 3"));
  }
}
