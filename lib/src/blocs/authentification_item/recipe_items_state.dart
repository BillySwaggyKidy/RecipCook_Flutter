part of 'recipe_items_bloc.dart';

class RecipeItemsState {
  Status status;
  RecipeItemModel? recipes;

  RecipeItemsState({this.status = Status.initial, this.recipes});

  RecipeItemsState copyWith(
      {required Status status, RecipeItemModel? recipes}) {
    return RecipeItemsState(status: status, recipes: recipes);
  }
}
