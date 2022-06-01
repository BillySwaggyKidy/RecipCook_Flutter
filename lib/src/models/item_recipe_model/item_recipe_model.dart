import './recipe/recipe.dart';

class RecipeItemModel {
  int _offset = 1;
  int _number = 0;
  List<Recipe> _recipes = [];
  int _totalResults = 1;

  RecipeItemModel.fromJson(Map<String, dynamic> parsedJson) {
    _offset = parsedJson['offset'];
    _number = parsedJson['number'];
    _totalResults = parsedJson['totalResults'];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      Recipe result = Recipe(parsedJson['results'][i]);
      _recipes.add(result);
    }
  }

  List<Recipe> get recipes => _recipes;
  int get totalResults => _totalResults;
  int get number => _number;
}
