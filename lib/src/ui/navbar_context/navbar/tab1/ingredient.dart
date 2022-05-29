import 'package:flutter/material.dart';
import 'package:recipcook/src/ui/widget/tab_title/tab_title.dart';
import 'ingredient_input_list/ingredient_form.dart';

class Ingredient extends StatefulWidget {
  Ingredient({required Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Ingredient();
  }
}

class _Ingredient extends State {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      textDirection: TextDirection.ltr,
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('img/tab1-background.png'),
            fit: BoxFit.fill,
            alignment: FractionalOffset.topCenter,
          )),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabTitle(title: "Ingredients"),
          ],
        ),
        IngredientForm(key: null),
      ],
    );
  }
}
