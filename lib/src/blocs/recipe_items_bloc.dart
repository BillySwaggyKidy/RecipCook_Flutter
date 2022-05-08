import '../provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_recipe_model.dart';

class RecipeItemsBloc {
  final _provider = Provider();
  final _recipesItemsFetcher = PublishSubject<RecipeItemModel>();

  Stream<RecipeItemModel> get allRecipeItems => _recipesItemsFetcher.stream;

  fetchAllRecipeItems() async {
    RecipeItemModel recipeItemModel = await _provider.fetchAllRecipes();
    _recipesItemsFetcher.sink.add(recipeItemModel);
  }

  dispose() {
    _recipesItemsFetcher.close();
  }
}

final bloc = RecipeItemsBloc();
