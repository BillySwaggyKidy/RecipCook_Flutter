import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:recipcook/src/blocs/navbar/navbar_bloc.dart';
import 'package:recipcook/src/blocs/recipe_items/recipe_items_bloc.dart';
import 'package:recipcook/src/ui/navigator_and_context/inherited_navbar/inherited_navbar.dart';

import 'package:recipcook/src/ui/widget/field_form/field_form.dart';

class IngredientForm extends StatefulWidget {
  IngredientForm({required Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IngredientForm();
  }
}

Future<List<dynamic>> readJson() async {
  final String response =
      await rootBundle.loadString('json/ingredient_input_list.json');
  final data = await json.decode(response);
  return data;
}

class _IngredientForm extends State<IngredientForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  List<FieldForm> _fieldFormList = [];

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FutureBuilder<List<dynamic>>(
            future: readJson(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map fieldsValue = InheritedNavbar.of(context).fieldData;
                _fieldFormList = snapshot.data!
                    .map((field) => FieldForm(
                        value: fieldsValue.isNotEmpty
                            ? fieldsValue[field["data"]["label"].toLowerCase()]
                            : field["data"]["value"],
                        type: field["type"],
                        required: field["required"],
                        data: field["data"]))
                    .toList();
                return Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 20,
                      childAspectRatio: 2.2,
                      children: _fieldFormList,
                    ));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  _formKey.currentState?.save();
                  List<MapEntry<String, String>> fieldMapEntryList =
                      _fieldFormList
                          .map((field) => field.controller.getFieldData())
                          .toList();
                  InheritedNavbar.of(context).fieldData =
                      Map.fromEntries(fieldMapEntryList);
                  Map fieldData = Map.fromEntries(fieldMapEntryList.where(
                      (field) =>
                          field.value.isNotEmpty || field.value != "None"));
                  BlocProvider.of<NavbarBloc>(context)
                      .add(NavbarEvent(tabIndex: 1));
                  BlocProvider.of<RecipeItemsBloc>(context)
                      .add(RecipeItemsEvent(fieldData: fieldData));
                }
              },
              child: const Text('Submit'),
            ),
          ],
        )
      ],
    );
  }
}
