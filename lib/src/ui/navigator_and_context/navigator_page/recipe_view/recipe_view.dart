import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipcook/src/blocs/all_blocs.dart';
import 'package:recipcook/src/blocs/navigator_page/navigator_page_bloc.dart';
import 'package:recipcook/src/models/item_recipe_model/recipe/recipe.dart';
import 'package:recipcook/src/ui/widget/button/button.dart';
import './instruction_card/intruction_card.dart';

class RecipeView extends StatelessWidget {
  Recipe recipe;
  late List<InstructionCard> instructions;
  RecipeView({required this.recipe}) {}

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
          // BlocBuilder<RecipeInstructionsBloc, RecipeInstructionsState>(
          //   builder: (context, state) {
          //     return instructions[state.instructionIndex];
          //   },
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Button(
                  text: "Previous",
                  width: 20,
                  height: 20,
                  color: const Color.fromRGBO(154, 119, 28, 1)),
              Button(
                  text: "Next",
                  width: 20,
                  height: 20,
                  color: const Color.fromRGBO(154, 119, 28, 1))
            ],
          ),
        ],
      ),
    );
  }
}
