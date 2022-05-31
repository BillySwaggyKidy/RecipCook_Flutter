import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipcook/src/blocs/all_blocs.dart';
import 'package:recipcook/src/ui/navigator_and_context/navigator_page/home/home.dart';
import 'package:recipcook/src/ui/navigator_and_context/navigator_page/id/loginn.dart';
import 'package:recipcook/src/ui/navigator_and_context/navigator_page/id/register.dart';
import 'package:recipcook/src/ui/navigator_and_context/navigator_page/recipe_view/recipe_view.dart';
import 'navbar/navbar.dart';
import '';

class NavigatorPage extends StatelessWidget {
  NavigatorPage({required Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    BlocProvider.of<NavigatorPageBloc>(context)
        .add(NavigateToPageEvent(page: CurrentPage.home));
    return BlocBuilder<NavigatorPageBloc, NavigatorPageState>(
      builder: (context, state) {
        switch (state.currentPage) {
          case CurrentPage.home:
            return HomePage();
          case CurrentPage.register:
            return RegisterScreen();
          case CurrentPage.login:
            return Loginn();
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
