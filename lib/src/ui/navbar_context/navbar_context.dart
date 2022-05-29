import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipcook/src/blocs/all_blocs.dart';
import 'inherited_navbar/inherited_navbar.dart';
import 'navbar/navbar.dart';

class NavbarContext extends StatelessWidget {
  NavbarContext({required Key? key}) : super(key: key);

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
        )
      ],
      child: InheritedNavbar(child: NavBar(key: key)),
    );
  }
}
