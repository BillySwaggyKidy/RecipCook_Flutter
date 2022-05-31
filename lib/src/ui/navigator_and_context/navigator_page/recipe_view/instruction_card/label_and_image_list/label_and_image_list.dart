import 'package:flutter/material.dart';
import 'package:recipcook/src/models/item_recipe_model/recipe/instruction/instruction_object/instruction_object.dart';
import 'package:recipcook/src/ui/navigator_and_context/navigator_page/recipe_view/instruction_card/label_and_image_list/image_list/image_list.dart';
import 'package:recipcook/src/ui/widget/recipe_card/card_content_and_image/card_image/card_image.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelAndImageList extends StatelessWidget {
  String title;
  List<InstructionObject> imageList;
  String baseImageUrl;

  LabelAndImageList(
      {required this.title,
      required this.imageList,
      required this.baseImageUrl});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text(title,
                  style: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black))),
          ImageList(imageList: imageList, baseImageUrl: baseImageUrl)
        ]));
  }
}
