import 'package:flutter/material.dart';

class CardContentBody extends StatelessWidget {
  String servings;
  String healthScore;

  CardContentBody({required this.servings, required this.healthScore});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text("Servings: " + servings),
          Text("Health score: " + healthScore)
        ]));
  }
}
