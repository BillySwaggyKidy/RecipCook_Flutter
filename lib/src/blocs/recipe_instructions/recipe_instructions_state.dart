part of 'recipe_instructions_bloc.dart';

class RecipeInstructionsState {
  int instructionIndex;

  RecipeInstructionsState({
    required this.instructionIndex,
  });

  RecipeInstructionsState copyWith({required int? index}) {
    return RecipeInstructionsState(instructionIndex: index!);
  }
}
