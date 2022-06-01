part of 'favorite_bloc.dart';

class FavoriteState {
  Status status;
  List<Recipe>? favoriteRecipeList = [];

  FavoriteState({
    required this.status,
    required this.favoriteRecipeList,
  });

  FavoriteState copyWith(
      {required Status status, List<Recipe>? favoriteRecipeList}) {
    return FavoriteState(
        status: status, favoriteRecipeList: favoriteRecipeList);
  }
}
