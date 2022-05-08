import 'dart:async';
import 'search_recipe_api_provider.dart';
import '../models/item_recipe_model.dart';

class Provider {
  final recipesItemsApiProvider = RecipeApiProvider();

  Future<RecipeItemModel> fetchAllRecipes() =>
      recipesItemsApiProvider.fetchRecipeList();
}
