part of 'recipe_instructions_bloc.dart';

class RecipeInstructionsEvent {
  int? index;

  RecipeInstructionsEvent({
    this.index,
  });
}

class InitiateIntructions extends RecipeInstructionsEvent {
  InitiateIntructions({required int startIndex}) : super(index: startIndex);
}

class NextInstruction extends RecipeInstructionsEvent {
  NextInstruction();
}

class PreviousInstruction extends RecipeInstructionsEvent {
  PreviousInstruction();
}
