import 'package:flutter/material.dart';
import 'package:recipcook/src/ui/widget/field_form/field_form_controller.dart';
import '../select_field/select_field.dart';
import '../text_search/text_search.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

Future<List<String>> openFile(filepath) async {
  final _rawData = await rootBundle.loadString("csv/ingredients.csv");
  List<String> _listData = const CsvToListConverter()
      .convert(_rawData)
      .map((item) => item[0].toString())
      .toList();
  return _listData;
}

class FieldForm extends StatefulWidget {
  String type = "";
  bool required;
  dynamic data;
  late FieldFormController controller = FieldFormController(data["label"]);

  FieldForm(
      {Key? key,
      required this.type,
      required this.required,
      required this.data})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FieldForm();
  }
}

class _FieldForm extends State<FieldForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.data["label"],
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Container(
              height: 40,
              child: (() {
                Widget field = const Text("No field here");
                String type = widget.type;
                if (type == "select") {
                  field = SelectField(
                    label: widget.data["label"],
                    items: widget.data["items"],
                    required: widget.required,
                    controller: widget.controller,
                  );
                } else if (type == "text") {
                  field = TextFormField(
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(170, 93, 180, 100),
                        errorStyle: TextStyle(height: 0.6)),
                    initialValue: widget.data["value"],
                    validator: (value) {
                      if (widget.required && (value == null || value.isEmpty)) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      widget.controller.setValue(value!);
                    },
                  );
                } else if (type == "text-search") {
                  late Future<List<String>> wordsList;
                  if (widget.data["words"] is String) {
                    wordsList = openFile(widget.data["words"]);
                  } else if (widget.data["words"] is List<String>) {
                    wordsList = widget.data["words"];
                  }
                  field = FutureBuilder<List<String>>(
                    future: wordsList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return TextSearch(
                          controller: widget.controller,
                          words: snapshot.data!,
                          required: widget.required,
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  );
                }
                return field;
              }()))
        ],
      ),
    );
  }
}
