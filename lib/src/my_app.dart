import 'package:flutter/material.dart';
import 'ui/ui.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: NavBar(key: null),
      ),
    );
  }
}
