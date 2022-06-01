part of 'favorite_bloc.dart';

class FavoriteEvent {
  final Recipe recipe;

  FavoriteEvent({
    required this.recipe,
  });
}

class AddFavoriteRecipe extends FavoriteEvent {
  AddFavoriteRecipe({required Recipe recipe}) : super(recipe: recipe);
}

class RemoveFavoriteRecipe extends FavoriteEvent {
  RemoveFavoriteRecipe({required Recipe recipe}) : super(recipe: recipe);
}
