import 'package:flutter/material.dart';
import '../field_form/field_form_controller.dart';

// Pour utiliser un controller on va n´ecessairement avoir besoin d'un widget de
// type Statefull. Le controller sera dans le state.
// Il faudra ´egalement bien penser `a le d´etruire gr^ace `a l'instruction dispose
class TextSearch extends StatefulWidget {
  FieldFormController controller;
  late List<String> words;
  bool required;

  TextSearch(
      {Key? key,
      required this.controller,
      required this.words,
      required this.required})
      : super(key: key);

  @override
  State<TextSearch> createState() => _TextSearch();
}

class _TextSearch extends State<TextSearch> {
  // D´eclaration d'un controller sur un champ de texte
  late List<String> listOfWords;
  @override
  void initState() {
    // Initialisation de listOfWords via la m´ethode filterList()
    filterList();
    super.initState();
  }

  // Imm´ediatement apr`es avoir instanci´e un controller, pensez `a d´efinir la
  // m´ethode qui permet de le d´etruire
  @override
  void dispose() {
    super.dispose();
  }

  void filterList() {
    // S´election des mots de la liste qui commence par les caract`eres renseign´es
    // dans le champ de recherche et mise `a jour du state
    setState(() {
      listOfWords = widget.words
          .where(
            (word) => word.toLowerCase().startsWith(
                  widget.controller.text.toLowerCase(),
                ),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(170, 93, 180, 100),
              errorStyle: TextStyle(height: 0.6)),
          onChanged: (value) {
            filterList();
          },
          onSaved: (value) {
            widget.controller.setValue(value!);
          },
        ),
        Expanded(
          child: ListView.builder(
            itemCount: listOfWords.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: const Icon(Icons.star),
                  title: Text("${listOfWords[index]}"));
            },
          ),
        ),
      ],
    );
  }
}
