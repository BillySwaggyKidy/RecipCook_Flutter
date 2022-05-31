import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipcook/src/blocs/navigator_page/navigator_page_bloc.dart';
import 'package:recipcook/src/blocs/recipe_instructions/recipe_instructions_bloc.dart';
import 'package:recipcook/src/models/item_recipe_model/recipe/instruction/instruction.dart';
import 'package:recipcook/src/models/item_recipe_model/recipe/recipe.dart';
import 'package:recipcook/src/ui/widget/button/button.dart';

import 'instruction_card/instruction_card.dart';
import 'recipe_detail_card/recipe_detail_card.dart';

class RecipeView extends StatelessWidget {
  Recipe recipe;
  List<Widget> instructionsOfRecipes = [];
  int instructionIndex = 0;
  RecipeView({required this.recipe}) {
    RecipeDetailCard recipeDetail = RecipeDetailCard(
        titleCard: recipe.title,
        image: recipe.image,
        numStep: 0,
        readyInMinutes: recipe.readyInMinutes,
        servings: recipe.servings,
        healthScore: recipe.healthScore,
        ingredientList: recipe.ingredients);

    instructionsOfRecipes.add(recipeDetail);
    for (int i = 0; i < recipe.instructions.length; i++) {
      Instruction instruction = recipe.instructions[i];
      instructionsOfRecipes.add(InstructionCard(
          titleCard: recipe.title,
          numStep: i + 1,
          stepText: instruction.step,
          ingredientList: instruction.ingredients,
          equipmentList: instruction.equipments));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(93, 180, 63, 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.grey,
                child: const Icon(
                  Icons.supervisor_account,
                  size: 20.0,
                ),
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(),
              ),
              IconButton(
                icon: const Icon(Icons.redo),
                onPressed: () {
                  BlocProvider.of<NavigatorPageBloc>(context)
                      .add(NavigateToPageEvent(page: CurrentPage.navbar));
                },
              ),
            ],
          ),
          BlocBuilder<RecipeInstructionsBloc, RecipeInstructionsState>(
            builder: (context, state) {
              instructionIndex = state.instructionIndex;
              return instructionsOfRecipes[instructionIndex];
            },
          ),
          if (instructionsOfRecipes.length > 1)
            BlocBuilder<RecipeInstructionsBloc, RecipeInstructionsState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    if (instructionIndex > 0)
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Button(
                            text: "Previous",
                            width: 20,
                            height: 20,
                            color: const Color.fromRGBO(154, 119, 28, 1),
                            onPressed: () =>
                                BlocProvider.of<RecipeInstructionsBloc>(context)
                                    .add(PreviousInstruction()),
                          )),
                    if (instructionIndex < instructionsOfRecipes.length - 1)
                      Align(
                          alignment: Alignment.centerRight,
                          child: Button(
                              text: "Next",
                              width: 20,
                              height: 20,
                              color: const Color.fromRGBO(154, 119, 28, 1),
                              onPressed: () =>
                                  BlocProvider.of<RecipeInstructionsBloc>(
                                          context)
                                      .add(NextInstruction())))
                  ],
                );
              },
            )
        ],
      ),
    );
  }
}
