import 'package:flutter/material.dart';
import 'package:recipcook/src/models/item_recipe_model/recipe/instruction/instruction_object/instruction_object.dart';
import 'package:recipcook/src/ui/navigator_and_context/navigator_page/recipe_view/instruction_card/label_and_image_list/label_and_image_list.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructionCard extends StatelessWidget {
  String titleCard;
  int numStep;
  String stepText;
  List<InstructionObject> ingredientList;
  List<InstructionObject> equipmentList;

  InstructionCard(
      {required this.titleCard,
      required this.numStep,
      required this.stepText,
      required this.ingredientList,
      required this.equipmentList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FractionallySizedBox(
      widthFactor: 1.0,
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              numStep.toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                          )),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            titleCard,
                            style: GoogleFonts.ebGaramond(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red)),
                          ))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(stepText, style: const TextStyle(color: Colors.black)),
                  const SizedBox(height: 10),
                  const Divider(
                    height: 10,
                    thickness: 2,
                    indent: 2,
                    endIndent: 2,
                    color: Colors.black,
                  ),
                  LabelAndImageList(
                      title: "ingredients:",
                      imageList: ingredientList,
                      baseImageUrl: "https://spoonacular.com/cdn/ingredients"),
                  const Divider(
                    height: 10,
                    thickness: 2,
                    indent: 2,
                    endIndent: 2,
                    color: Colors.black,
                  ),
                  LabelAndImageList(
                      title: "equipments:",
                      imageList: equipmentList,
                      baseImageUrl: "https://spoonacular.com/cdn/equipment")
                ],
              ))),
    ));
  }
}
