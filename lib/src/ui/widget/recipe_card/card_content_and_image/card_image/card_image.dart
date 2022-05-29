import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  double imageWidth;
  double imageHeight;
  String imageUrl;

  CardImage(
      {required this.imageWidth,
      required this.imageHeight,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: imageWidth,
        height: imageHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.fill,
          alignment: FractionalOffset.topCenter,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 20.0,
                height: 20.0,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                )),
          ],
        ));
  }
}
