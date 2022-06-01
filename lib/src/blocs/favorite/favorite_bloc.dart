import 'package:bloc/bloc.dart';
import 'package:recipcook/src/models/item_recipe_model/recipe/recipe.dart';
import '../status.dart';
part 'favorite_state.dart';
part 'favorite_event.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc()
      : super(FavoriteState(status: Status.initial, favoriteRecipeList: [])) {
    on<AddFavoriteRecipe>(_addRecipeToFavorites);
    on<RemoveFavoriteRecipe>(_removeRecipeToFavorites);
  }

  void _addRecipeToFavorites(
      AddFavoriteRecipe event, Emitter<FavoriteState> emit) async {
    emit(state.copyWith(
        status: Status.loading, favoriteRecipeList: state.favoriteRecipeList));
    state.favoriteRecipeList?.add(event.recipe);
    emit(state.copyWith(
        status: Status.success, favoriteRecipeList: state.favoriteRecipeList));
  }

  void _removeRecipeToFavorites(
      RemoveFavoriteRecipe event, Emitter<FavoriteState> emit) async {
    emit(state.copyWith(
        status: Status.loading, favoriteRecipeList: state.favoriteRecipeList));
    state.favoriteRecipeList?.remove(event.recipe);
    emit(state.copyWith(
        status: Status.success, favoriteRecipeList: state.favoriteRecipeList));
  }
}
