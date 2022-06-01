import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipcook/src/blocs/status.dart';
import 'package:recipcook/src/ui/navigator_and_context/inherited_navbar/inherited_navbar.dart';
import 'package:recipcook/src/ui/widget/recipe_card/recipe_card.dart';
import 'package:recipcook/src/ui/widget/tab_title/tab_title.dart';
import 'package:recipcook/src/blocs/recipe_items/recipe_items_bloc.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({required Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RecipeList();
  }
}

class _RecipeList extends State {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      textDirection: TextDirection.ltr,
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/image/tab2-background.png'),
            fit: BoxFit.fill,
            alignment: FractionalOffset.topCenter,
          )),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabTitle(title: "Recipes"),
            const SizedBox(height: 15),
            Flexible(
              child: BlocBuilder<RecipeItemsBloc, RecipeItemsState>(
                builder: (context, state) {
                  if (state.status == Status.loading) {
                    return const CircularProgressIndicator();
                  } else if (state.status == Status.success) {
                    InheritedNavbar.of(context).recipeList =
                        state.recipes!.recipes;
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.recipes?.recipes.length,
                      itemBuilder: (context, index) => RecipeCard(
                        favoriteEnabled: true,
                        index: index,
                        recipe: state.recipes!.recipes[index],
                        colorBackground: const Color.fromRGBO(93, 180, 63, 1),
                      ),
                    );
                  } else {
                    return const Text("Error");
                  }
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
