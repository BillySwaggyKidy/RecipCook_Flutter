import 'package:flutter/material.dart';
import 'package:recipcook/src/models/item_recipe_model/recipe/instruction/instruction_object/instruction_object.dart';
import 'package:recipcook/src/ui/widget/image_label/image_label.dart';

class ImageList extends StatelessWidget {
  List<InstructionObject> imageList;
  String baseImageUrl;

  ImageList({required this.imageList, required this.baseImageUrl});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(width: 30),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: imageList.length,
      itemBuilder: (context, index) => ImageLabel(
          width: 70,
          height: 70,
          imageUrl: baseImageUrl + "_100x100/" + imageList[index].image,
          label: imageList[index].name),
    ));
  }
}
