import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipcook/src/blocs/all_blocs.dart';
import 'inherited_navbar/inherited_navbar.dart';
import './navigator_page/navigator.dart';

class BlocAndContext extends StatelessWidget {
  BlocAndContext({required Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavbarBloc(),
        ),
        BlocProvider(
          create: (context) => RecipeItemsBloc(),
        ),
        BlocProvider(
          create: (context) => FavoriteBloc(),
        ),
        BlocProvider(
          create: (context) => NavigatorPageBloc(),
        ),
        BlocProvider(
          create: (context) => RecipeInstructionsBloc(),
        )
      ],
      child: InheritedNavbar(child: NavigatorPage(key: key)),
    );
  }
}
