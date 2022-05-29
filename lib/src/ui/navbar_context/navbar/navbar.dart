import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'tab1/ingredient.dart';
import 'tab2/recipe_list.dart';
import 'tab3/favorite.dart';
import '../../../blocs/navbar/navbar_bloc.dart';

class NavBar extends StatefulWidget {
  NavBar({required Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NavBar();
  }
}

class _NavBar extends State<NavBar> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    Ingredient(
      key: null,
    ),
    const RecipeList(key: null),
    Favorite(
      key: null,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarBloc, NavbarState>(
      builder: (context, state) {
        selectedIndex = state.tabIndex;
        return Scaffold(
            floatingActionButton: FloatingActionButton(
                onPressed: () => {},
                elevation: 0,
                child: const Text("profile")),
            floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
            body: tabs[state.tabIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color.fromARGB(255, 93, 180, 63),
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "icons/cooking-pot-icon.svg",
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                  label: "Ingredients",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "icons/app-tab-icon-cook.svg",
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                  label: "Recipes",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  label: "Favorites",
                )
              ],
              onTap: (int index) {
                context.read<NavbarBloc>().add(NavbarEvent(tabIndex: index));
              },
            ));
      },
    );
  }
}
