import './instruction/instruction.dart';
import './ingredient/ingredient.dart';

class Recipe {
  int _id = 0;
  String _title = "";
  String _summary = "";
  int _servings = 2;
  int _aggregateLikes = 1;
  int _readyInMinutes = 10;
  int _cookingMinutes = 10;
  int _preparationMinutes = 10;
  double _pricePerServing = 0.0;
  int _healthScore = 0;
  String _image = "";
  String _imageType = "";
  List<Ingredient> _ingredients = [];
  List<Instruction> _introductions = [];

  Recipe(result) {
    _id = result["id"] ?? 0;
    _title = result["title"] ?? "";
    _summary = result["summary"] ?? "";
    _servings = result["servings"] ?? 2;
    _aggregateLikes = result["aggregateLikes"] ?? 1;
    _readyInMinutes = result["readyInMinutes"] ?? 10;
    _cookingMinutes = result["cookingMinutes"] ?? 10;
    _preparationMinutes = result["preparationMinutes"] ?? 10;
    _pricePerServing = result["pricePerServing"] ?? 0.0;
    _healthScore = result["healthScore"] ?? 0;
    _image = result["image"] ?? "";
    _imageType = result["imageType"] ?? "";
    if (result["extendedIngredients"].isNotEmpty) {
      for (int i = 0; i < result["extendedIngredients"].length; i++) {
        Ingredient ingredient = Ingredient(result["extendedIngredients"][i]);
        _ingredients.add(ingredient);
      }
    }
    if (result["analyzedInstructions"].isNotEmpty) {
      for (int i = 0;
          i < result["analyzedInstructions"][0]["steps"].length;
          i++) {
        Instruction instruction =
            Instruction(result["analyzedInstructions"][0]["steps"][i]);
        _introductions.add(instruction);
      }
    }
  }

  int get id => _id;
  String get title => _title;
  String get summary => _summary;
  int get servings => _servings;
  int get aggregateLikes => _aggregateLikes;
  int get readyInMinutes => _readyInMinutes;
  int get cookingMinutes => _cookingMinutes;
  int get preparationMinutes => _preparationMinutes;
  double get pricePerServing => _pricePerServing;
  int get healthScore => _healthScore;
  String get image => _image;
  String get imageType => _imageType;
  List<Ingredient> get ingredients => _ingredients;
  List<Instruction> get instructions => _introductions;
}
