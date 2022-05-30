import 'package:flutter/material.dart';
import 'package:recipcook/src/models/item_recipe_model/recipe/instruction/instruction_object/instruction_object.dart';

class InstructionCard extends StatelessWidget {
  String titleCard;
  String? image;
  String? stepText;
  List<InstructionObject> ingredientList;
  List<InstructionObject> equipmentList;

  InstructionCard(
      {required this.titleCard,
      this.image,
      this.stepText,
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
                children: [],
              ))),
    ));
  }
}
