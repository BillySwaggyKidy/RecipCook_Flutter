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
    return Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        direction: Axis.vertical,
        children: [
          Container(
              width: width - 20,
              height: height - 20,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.fill,
                alignment: FractionalOffset.topCenter,
              ))),
          Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 10),
          )
        ]);
  }
}
