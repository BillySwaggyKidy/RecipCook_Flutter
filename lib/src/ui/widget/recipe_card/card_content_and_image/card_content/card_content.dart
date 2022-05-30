import 'package:flutter/material.dart';
import 'package:recipcook/src/models/item_recipe_model/recipe/recipe.dart';
import 'package:recipcook/src/ui/navigator_and_context/inherited_navbar/inherited_navbar.dart';
import './card_content_title/card_content_title.dart';
import './card_content_body/card_content_body.dart';
import './card_content_favorite/card_content_favorite.dart';

class CardContent extends StatelessWidget {
  Recipe recipe;
  bool favoriteEnabled;

  CardContent({required this.recipe, required this.favoriteEnabled});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardContentTitle(title: recipe.title!),
        CardContentBody(
            servings: recipe.servings.toString(),
            healthScore: recipe.healthScore.toString()),
        if (favoriteEnabled)
          CardContentFavorite(
            recipe: recipe,
            iconSize: 40,
            isStarred: InheritedNavbar.of(context)
                .favoriteRecipeList
                .map((e) => e.id)
                .toList()
                .contains(recipe.id),
          )
      ],
    ));
  }
}
