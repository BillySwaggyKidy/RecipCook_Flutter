class Ingredient {
  int _id = 0;
  String? _aisle = "";
  String? _image = "";
  String? _consistency = "";
  String? _name = "";
  String? _original = "";
  late Measure _usMeasure;
  late Measure _metricMeasure;

  Ingredient(ingredient) {
    _id = ingredient["id"];
    _aisle = ingredient["aisle"];
    _image = ingredient["image"];
    _consistency = ingredient["consistency"];
    _name = ingredient["name"];
    _original = ingredient["original"];
    _usMeasure = Measure(ingredient["measures"]["us"]);
    _metricMeasure = Measure(ingredient["measures"]["metric"]);
  }

  int get id => _id;
  String? get aisle => _aisle;
  String? get image => _image;
  String? get consistency => _consistency;
  String? get name => _name;
  String? get original => _original;
  Measure? get usMeasure => _usMeasure;
  Measure? get metricMeasure => _metricMeasure;
}

class Measure {
  double? _amount = 0;
  String? _unitShort = "";
  String? _unitLong = "";

  Measure(measure) {
    _amount = measure["amount"];
    _unitShort = measure["unitShort"];
    _unitLong = measure["unitLong"];
  }

  double? get amount => _amount;
  String? get unitShort => _unitShort;
  String? get unitLong => _unitLong;
}
