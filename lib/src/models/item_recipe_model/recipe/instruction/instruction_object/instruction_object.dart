class InstructionObject {
  int _id = 0;
  String _name = "";
  String _localizedName = "";
  String _image = "";

  InstructionObject(object) {
    _id = object["id"] ?? 0;
    _name = object["name"] ?? "";
    _localizedName = object["localizedName"] ?? "";
    _image = object["image"] ?? "default.jpg";
  }

  int get id => _id;
  String get name => _name;
  String get localizedName => _localizedName;
  String get image => _image;
}
