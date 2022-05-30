import 'package:flutter/material.dart';

class ImageLabel extends StatelessWidget {
  double width;
  double height;
  String imageUrl;
  String label;

  ImageLabel(
      {required this.width,
      required this.height,
      required this.imageUrl,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.fill,
                  alignment: FractionalOffset.topCenter,
                ))),
            Text(label)
          ],
        ));
  }
}
