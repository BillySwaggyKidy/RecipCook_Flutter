import 'package:flutter/material.dart';
import 'package:recipcook/src/models/item_recipe_model/recipe/recipe.dart';
import './card_content/card_content.dart';
import './card_image/card_image.dart';

class CardContentAndImage extends StatelessWidget {
  Recipe recipe;
  bool favoriteEnabled;
  CardContentAndImage({required this.recipe, required this.favoriteEnabled});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CardContent(recipe: recipe, favoriteEnabled: favoriteEnabled),
        CardImage(
          imageWidth: 100,
          imageHeight: 150,
          imageUrl: recipe.image!,
        ),
      ],
    );
  }
}
