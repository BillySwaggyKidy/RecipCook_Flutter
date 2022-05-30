import 'dart:async';
import 'package:recipcook/src/models/item_recipe_model/recipe/recipe.dart';

class InheritedNavbarData {
  Map fieldData = Map();
  List<Recipe> recipeList = [];
  List<Recipe> favoriteRecipeList = [];

  final StreamController _streamController = StreamController.broadcast();

  Stream get stream => _streamController.stream;

  Sink get sink => _streamController.sink;
}
