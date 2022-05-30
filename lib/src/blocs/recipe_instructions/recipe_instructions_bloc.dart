import 'package:bloc/bloc.dart';
part 'recipe_instructions_state.dart';
part 'recipe_instructions_event.dart';

class RecipeInstructionsBloc
    extends Bloc<RecipeInstructionsEvent, RecipeInstructionsState> {
  RecipeInstructionsBloc()
      : super(RecipeInstructionsState(instructionIndex: 0)) {
    on<InitiateIntructions>(_initiateInstructions);
    on<InitiateIntructions>(_moveToNextInstruction);
    on<InitiateIntructions>(_moveToPreviousInstruction);
  }

  void _initiateInstructions(RecipeInstructionsEvent event,
      Emitter<RecipeInstructionsState> emit) async {
    state.instructionIndex = event.index!;
    emit(state.copyWith(index: state.instructionIndex));
  }

  void _moveToNextInstruction(RecipeInstructionsEvent event,
      Emitter<RecipeInstructionsState> emit) async {
    state.instructionIndex += 1;
    emit(state.copyWith(index: state.instructionIndex));
  }

  void _moveToPreviousInstruction(RecipeInstructionsEvent event,
      Emitter<RecipeInstructionsState> emit) async {
    state.instructionIndex -= 1;
    emit(state.copyWith(index: state.instructionIndex));
  }
}
