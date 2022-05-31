import 'package:flutter/material.dart';
import 'package:recipcook/src/models/item_recipe_model/recipe/ingredient/ingredient.dart';
import 'package:recipcook/src/ui/navigator_and_context/navigator_page/recipe_view/recipe_detail_card/ingredient_label_grid/ingredient_label_grid.dart';
import 'package:recipcook/src/ui/widget/recipe_card/card_content_and_image/card_image/card_image.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeDetailCard extends StatelessWidget {
  String titleCard;
  String image;
  int numStep;
  int readyInMinutes;
  int servings;
  int healthScore;
  List<Ingredient> ingredientList;

  RecipeDetailCard({
    required this.titleCard,
    required this.image,
    required this.numStep,
    required this.readyInMinutes,
    required this.servings,
    required this.healthScore,
    required this.ingredientList,
  });

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
                          alignment: Alignment.center,
                          child: CardImage(
                              imageWidth: 150,
                              imageHeight: 130,
                              imageUrl: image)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    titleCard,
                    style: GoogleFonts.ebGaramond(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        readyInMinutes.toString() + " min",
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text(servings.toString() + " servings",
                          style: const TextStyle(color: Colors.black)),
                      Text("HealthScore: " + healthScore.toString(),
                          style: const TextStyle(color: Colors.black))
                    ],
                  ),
                  const Divider(
                    height: 10,
                    thickness: 2,
                    indent: 2,
                    endIndent: 2,
                    color: Colors.black,
                  ),
                  IngredientLabelGrid(ingredientList: ingredientList)
                ],
              ))),
    ));
  }
}
