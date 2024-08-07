import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipcook/src/blocs/all_blocs.dart';
import 'package:recipcook/src/models/item_recipe_model/recipe/recipe.dart';
import 'card_content_and_image/card_content_and_image.dart';

class RecipeCard extends StatelessWidget {
  final int index;
  final double cardWidth;
  final double cardHeight;
  final Color colorBackground;
  final Recipe recipe;
  final bool favoriteEnabled;

  const RecipeCard({
    Key? key,
    required this.index,
    this.cardWidth = 250,
    this.cardHeight = 170,
    required this.colorBackground,
    required this.recipe,
    required this.favoriteEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: () => {
            BlocProvider.of<NavigatorPageBloc>(context).add(NavigateToPageEvent(
                page: CurrentPage.recipeView, data: recipe)),
            BlocProvider.of<RecipeInstructionsBloc>(context)
                .add(InitiateIntructions(startIndex: 0))
          },
          child: Container(
              padding: const EdgeInsets.all(5.0),
              width: cardWidth,
              height: cardHeight,
              decoration: BoxDecoration(
                  color: colorBackground,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: CardContentAndImage(
                  recipe: recipe, favoriteEnabled: favoriteEnabled)),
        ));
  }
}
