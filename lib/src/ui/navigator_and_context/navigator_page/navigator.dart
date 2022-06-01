import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipcook/src/blocs/all_blocs.dart';
import 'package:recipcook/src/ui/navigator_and_context/navigator_page/home/home.dart';
import 'package:recipcook/src/ui/navigator_and_context/navigator_page/id/login.dart';
import 'package:recipcook/src/ui/navigator_and_context/navigator_page/id/register.dart';
import 'package:recipcook/src/ui/navigator_and_context/navigator_page/recipe_view/recipe_view.dart';
import 'package:recipcook/src/ui/navigator_and_context/navigator_page/user_info/user_info.dart';
import 'navbar/navbar.dart';
import '';

class NavigatorPage extends StatelessWidget {
  NavigatorPage({required Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NavigatorPageBloc>(context)
        .add(NavigateToPageEvent(page: CurrentPage.home));
    return BlocBuilder<NavigatorPageBloc, NavigatorPageState>(
      builder: (context, state) {
        switch (state.currentPage) {
          case CurrentPage.home:
            return const HomePage();
          case CurrentPage.register:
            return RegisterScreen();
          case CurrentPage.login:
            return LoginScreen();
          case CurrentPage.navbar:
            return NavBar(key: key);
          case CurrentPage.recipeView:
            return RecipeView(recipe: state.data);
          case CurrentPage.userInfo:
            return UserInfo();
          default:
            return const Text("Default");
        }
      },
    );
  }
}
