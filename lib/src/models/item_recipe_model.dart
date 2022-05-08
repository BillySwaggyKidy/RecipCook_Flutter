class RecipeItemModel {
  int _offset = 1;
  int _number = 0;
  List<_Result> _results = [];
  int _totalResults = 1;

  RecipeItemModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _offset = parsedJson['offset'];
    _number = parsedJson['number'];
    _totalResults = parsedJson['totalResults'];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      _results.add(result);
    }
  }

  List<_Result> get results => _results;
  int get totalResults => _totalResults;
  int get number => _number;
}

class _Result {
  int _id = 0;
  String _title = "";
  int _calories = 0;
  String _carbs = "";
  String _fat = "";
  String _image = "";
  String _imageType = "";
  String _protein = "";

  _Result(result) {
    _id = result["id"];
    _title = result["title"];
    _calories = result["calories"];
    _carbs = result["carbs"];
    _fat = result["fat"];
    _image = result["image"];
    _imageType = result["imageType"];
    _protein = result["protein"];
  }

  int get id => _id;
  String get title => _title;
  int get calories => _calories;
  String get carbs => _carbs;
  String get fat => _fat;
  String get image => _image;
  String get imageType => _imageType;
  String get protein => _protein;
}
