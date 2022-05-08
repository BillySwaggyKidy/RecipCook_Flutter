import 'package:flutter/material.dart';
import '../../../models/item_recipe_model.dart';
import '../../../blocs/recipe_items_bloc.dart';

class RecipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllRecipeItems();
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allRecipeItems,
        builder: (context, AsyncSnapshot<RecipeItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<RecipeItemModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data?.number,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            snapshot.data?.results[index].image ?? "",
            fit: BoxFit.cover,
          );
        });
  }
}
