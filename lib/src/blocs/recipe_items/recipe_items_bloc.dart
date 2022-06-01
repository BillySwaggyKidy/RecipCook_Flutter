import 'package:recipcook/src/provider/provider.dart';
import 'package:recipcook/src/models/item_recipe_model/item_recipe_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../status.dart';
part 'recipe_items_state.dart';

class RecipeItemsEvent {
  final Map fieldData;
  RecipeItemsEvent({
    required this.fieldData,
  });
}

class RecipeItemsBloc extends Bloc<RecipeItemsEvent, RecipeItemsState> {
  RecipeItemsBloc() : super(RecipeItemsState()) {
    on<RecipeItemsEvent>(_fetchAllRecipeItems);
  }

  void _fetchAllRecipeItems(
      RecipeItemsEvent event, Emitter<RecipeItemsState> emit) async {
    emit(state.copyWith(status: Status.loading, recipes: null));
    try {
      final recipesApiProvider = Provider();
      final recipeItems =
          await recipesApiProvider.fetchAllRecipes(event.fieldData);
      emit(
        state.copyWith(
          status: Status.success,
          recipes: recipeItems,
        ),
      );
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      emit(state.copyWith(status: Status.error));
    }
  }
}

final bloc = RecipeItemsBloc();
