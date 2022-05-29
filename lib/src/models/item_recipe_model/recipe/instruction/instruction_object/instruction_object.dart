class InstructionObject {
  int? _id = 0;
  String? _name = "";
  String? _localizedName = "";
  String? _image = "";

  InstructionObject(ingredient) {
    _id = ingredient["id"];
    _name = ingredient["name"];
    _localizedName = ingredient["localizedName"];
    _image = ingredient["image"];
  }

  int? get id => _id;
  String? get name => _name;
  String? get localizedName => _localizedName;
  String? get image => _image;
}
