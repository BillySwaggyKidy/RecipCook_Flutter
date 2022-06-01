import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:recipcook/src/blocs/status.dart';
import 'package:recipcook/src/ui/navigator_and_context/inherited_navbar/inherited_navbar.dart';
import 'package:recipcook/src/ui/widget/tab_title/tab_title.dart';
import 'package:recipcook/src/blocs/favorite/favorite_bloc.dart';
import 'package:recipcook/src/ui/widget/recipe_card/recipe_card.dart';

class Favorite extends StatefulWidget {
  Favorite({required Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Favorite();
  }
}

class _Favorite extends State {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      textDirection: TextDirection.ltr,
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/image/tab3-background.png'),
            fit: BoxFit.fill,
            alignment: FractionalOffset.topCenter,
          )),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabTitle(title: "Favorites"),
            const SizedBox(height: 15),
            Flexible(
              child: BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  if (state.status == Status.loading) {
                    return const CircularProgressIndicator();
                  } else if (state.status == Status.success) {
                    InheritedNavbar.of(context).favoriteRecipeList =
                        state.favoriteRecipeList!;
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.favoriteRecipeList?.length,
                      itemBuilder: (context, index) => RecipeCard(
                        favoriteEnabled: false,
                        index: index,
                        recipe: state.favoriteRecipeList![index],
                        colorBackground: const Color.fromRGBO(154, 119, 28, 1),
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
