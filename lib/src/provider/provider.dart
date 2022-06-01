import 'dart:async';
import 'package:recipcook/src/blocs/login_items/login_items_bloc.dart';
import 'package:recipcook/src/models/item_login_model/login_item_model.dart';

import 'search_recipe_api_provider.dart';
import '../models/item_recipe_model/item_recipe_model.dart';
import 'profile_provider.dart';

class Provider {
  final recipesItemsApiProvider = RecipeApiProvider();
  final profileItemProvider = ProfileProvider();

  Future<RecipeItemModel> fetchAllRecipes(Map parameters) =>
      recipesItemsApiProvider.fetchRecipeList(parameters);

  Future<dynamic> fetchLogin(String login, String password) =>
    profileItemProvider.fetchData(login, password);

  Future<dynamic> fetchRegister(String login, String password, String name, String cpass) =>
    profileItemProvider.fetchDataR(login, password, name, cpass);
}
