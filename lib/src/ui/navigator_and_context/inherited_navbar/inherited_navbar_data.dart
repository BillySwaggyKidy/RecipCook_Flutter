import 'dart:async';
import 'package:recipcook/src/models/item_login_model/login_item_model.dart';
import 'package:recipcook/src/models/item_recipe_model/recipe/recipe.dart';

class InheritedNavbarData {
  LoginItemModel profil = LoginItemModel(name: "", photo: "", email: "", password: "", cpass: "");
  Map fieldData = Map();
  List<Recipe> recipeList = [];
  List<Recipe> favoriteRecipeList = [];

  final StreamController _streamController = StreamController.broadcast();

  Stream get stream => _streamController.stream;

  Sink get sink => _streamController.sink;
}
