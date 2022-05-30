import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipcook/src/blocs/all_blocs.dart';
import 'package:recipcook/src/ui/navigator_and_context/navigator_page/recipe_view/recipe_view.dart';
import 'navbar/navbar.dart';

class NavigatorPage extends StatelessWidget {
  NavigatorPage({required Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    BlocProvider.of<NavigatorPageBloc>(context)
        .add(NavigateToPageEvent(page: CurrentPage.navbar));
    return BlocBuilder<NavigatorPageBloc, NavigatorPageState>(
      builder: (context, state) {
        switch (state.currentPage) {
          case CurrentPage.home:
            break;
          case CurrentPage.signup:
            break;
          case CurrentPage.login:
            break;
          case CurrentPage.navbar:
            return NavBar(key: key);
          case CurrentPage.recipeView:
            return RecipeView(recipe: state.data);
          default:
            return const Text("Default");
        }
        return const Text("Default");
      },
    );
  }
}
