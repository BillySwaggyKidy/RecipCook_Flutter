class FieldFormController {
  String fieldName;
  String value = "";

  FieldFormController(this.fieldName);

  MapEntry<String, String> getFieldData() {
    return MapEntry(fieldName.toLowerCase(), value);
  }

  String get text => value;

  void setValue(String newValue) {
    value = newValue;
  }
}
