import './instruction_object/instruction_object.dart';

class Instruction {
  int? _number = 0;
  String? _step = "";
  List<InstructionObject> _ingredients = [];
  List<InstructionObject> _equipments = [];

  Instruction(instruction) {
    _number = instruction["number"];
    _step = instruction["step"];
    for (int i = 0; i < instruction["ingredients"].length; i++) {
      InstructionObject intructionObject =
          InstructionObject(instruction["ingredients"][i]);
      _ingredients.add(intructionObject);
    }
    for (int i = 0; i < instruction["equipment"].length; i++) {
      InstructionObject intructionObject =
          InstructionObject(instruction["equipment"][i]);
      _equipments.add(intructionObject);
    }
  }

  int? get number => _number;
  String? get step => _step;
  List<InstructionObject> get ingredients => _ingredients;
  List<InstructionObject> get equipment => _equipments;
}
