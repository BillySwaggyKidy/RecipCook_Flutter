import 'package:flutter/material.dart';
import 'package:recipcook/src/models/item_recipe_model/recipe/instruction/instruction_object/instruction_object.dart';
import './image_label/image_label.dart';

class ImageList extends StatelessWidget {
  List<InstructionObject> imageList;
  String baseImageUrl;

  ImageList({required this.imageList, required this.baseImageUrl});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: imageList.length,
      itemBuilder: (context, index) => ImageLabel(
          width: 120,
          height: 120,
          imageUrl: baseImageUrl + "_100x100/" + imageList[index].image!,
          label: imageList[index].name!),
    );
  }
}
