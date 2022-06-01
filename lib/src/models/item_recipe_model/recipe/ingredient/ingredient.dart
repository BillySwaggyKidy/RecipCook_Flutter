class Ingredient {
  int _id = 0;
  String _aisle = "";
  String _image = "";
  String _consistency = "";
  String _name = "";
  String _original = "";
  double _amount = 0;
  String _unit = "";
  late Measure _usMeasure;
  late Measure _metricMeasure;

  Ingredient(ingredient) {
    _id = ingredient["id"] ?? "";
    _aisle = ingredient["aisle"] ?? "";
    _image = ingredient["image"] ?? "default.jpg";
    _consistency = ingredient["consistency"] ?? "";
    _name = ingredient["name"] ?? "";
    _original = ingredient["original"] ?? "";
    _amount = ingredient["amount"] ?? "";
    _unit = ingredient["unit"] ?? "";
    _usMeasure = Measure(ingredient["measures"]["us"]);
    _metricMeasure = Measure(ingredient["measures"]["metric"]);
  }

  int get id => _id;
  String get aisle => _aisle;
  String get image => _image;
  String get consistency => _consistency;
  String get name => _name;
  String get original => _original;
  double get amount => _amount;
  String get unit => _unit;
  Measure get usMeasure => _usMeasure;
  Measure get metricMeasure => _metricMeasure;
}

class Measure {
  double _amount = 0.0;
  String _unitShort = "";
  String _unitLong = "";

  Measure(measure) {
    _amount = measure["amount"] ?? 0.0;
    _unitShort = measure["unitShort"] ?? "";
    _unitLong = measure["unitLong"] ?? "";
  }

  double get amount => _amount;
  String get unitShort => _unitShort;
  String get unitLong => _unitLong;
}
