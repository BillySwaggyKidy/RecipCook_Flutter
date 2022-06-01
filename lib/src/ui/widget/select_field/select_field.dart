import 'package:flutter/material.dart';
import '../field_form/field_form_controller.dart';

class SelectField extends StatefulWidget {
  String label = "";
  List<dynamic> items = [];
  FieldFormController controller;
  bool required;
  String value;

  SelectField(
      {Key? key,
      required this.label,
      required this.items,
      required this.controller,
      required this.required,
      required this.value})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SelectField(dropdownValue: value);
  }
}

class _SelectField extends State<SelectField> {
  String dropdownValue;

  _SelectField({required this.dropdownValue});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: dropdownValue,
      decoration: const InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(170, 93, 180, 100),
          errorStyle: TextStyle(height: 0.6)),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      onSaved: (value) {
        widget.controller.setValue(value!);
      },
      validator: (value) {
        if (widget.required && (value == null || value.isEmpty)) {
          return 'Please enter some text';
        }
        return null;
      },
      items: widget.items
          .map((item) => DropdownMenuItem<String>(
                child: Text(item["label"]),
                value: item["value"],
              ))
          .toList(),
    );
  }
}
