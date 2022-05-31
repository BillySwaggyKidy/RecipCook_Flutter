import 'package:flutter/material.dart';
import 'package:recipcook/src/models/item_recipe_model/recipe/ingredient/ingredient.dart';
import 'package:recipcook/src/ui/widget/image_label/image_label.dart';

class IngredientLabelGrid extends StatelessWidget {
  List<Ingredient> ingredientList;

  IngredientLabelGrid({
    required this.ingredientList,
  });

  @override
  Widget build(BuildContext context) {
    List<ImageLabel> imageLabelList = ingredientList
        .map((ingredient) => ImageLabel(
            width: 70,
            height: 70,
            imageUrl: "https://spoonacular.com/cdn/ingredients_100x100/" +
                ingredient.image,
            label: ingredient.amount.toString() +
                " " +
                ingredient.unit +
                " " +
                ingredient.name))
        .toList();
    return Flexible(
        child: GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 2,
      children: imageLabelList,
    ));
  }
}
