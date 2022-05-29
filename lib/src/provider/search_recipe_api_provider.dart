import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_recipe_model/item_recipe_model.dart';
import '../auth/secret.dart' as secret;

class RecipeApiProvider {
  Client client = Client();
  final _apiKey = secret.apiKey;

  Future<RecipeItemModel> fetchRecipeList(Map parameters) async {
    String requestUrl =
        "https://api.spoonacular.com/recipes/complexSearch?apiKey=$_apiKey&addRecipeInformation=true&fillIngredients=true";
    parameters.forEach((key, value) {
      requestUrl += "&" + key + "=" + value;
    });
    final response = await client.get(Uri.parse(requestUrl));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return RecipeItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
