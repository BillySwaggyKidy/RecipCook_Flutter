import 'package:flutter/material.dart';

class CardContentBody extends StatelessWidget {
  String aggregateLikes;
  String healthScore;

  CardContentBody({required this.aggregateLikes, required this.healthScore});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text("Likes: " + aggregateLikes),
          Text("Health score: " + healthScore)
        ]));
  }
}
