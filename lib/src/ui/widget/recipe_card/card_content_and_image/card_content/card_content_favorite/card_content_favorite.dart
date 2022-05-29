import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipcook/src/blocs/favorite/favorite_bloc.dart';
import 'package:recipcook/src/models/item_recipe_model/recipe/recipe.dart';
import 'package:recipcook/src/ui/navbar_context/inherited_navbar/inherited_navbar.dart';

class CardContentFavorite extends StatelessWidget {
  Recipe recipe;
  double iconSize;
  bool isStarred;

  CardContentFavorite(
      {required this.recipe, required this.iconSize, required this.isStarred});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: StarButton(
        iconSize: iconSize,
        isStarred: isStarred,
        valueChanged: (_isFavorite) => {
          if (_isFavorite)
            {
              if (!InheritedNavbar.of(context)
                  .favoriteRecipeList
                  .map((e) => e.id)
                  .toList()
                  .contains(recipe.id))
                {
                  BlocProvider.of<FavoriteBloc>(context)
                      .add(AddFavoriteRecipe(recipe: recipe))
                }
            }
          else
            {
              BlocProvider.of<FavoriteBloc>(context)
                  .add(RemoveFavoriteRecipe(recipe: recipe))
            }
        },
      ),
    );
  }
}
