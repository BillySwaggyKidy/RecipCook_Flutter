import 'package:flutter/material.dart';
import 'data.dart';

class Home_m extends StatelessWidget {
  const Home_m({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Data(
      counter: 6,
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Hello !"),
              Builder(builder: (context) {
                return Text(
                "You have ${Data.of(context)!.counter} new message(s)");
              }),
              Builder(builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (var i = 0; i < Data.of(context)!.counter; i++)
                    const Icon(Icons.mail),
                  ],
                );
              }),
            ],
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}