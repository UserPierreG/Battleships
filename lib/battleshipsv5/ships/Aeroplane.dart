// ignore_for_file: file_names

import 'package:testproject/battleshipsv5/ships/TemplateShip.dart';

class Aeroplane extends TemplateShip {
  List<List<int>>? array;

  Aeroplane() : super("Aeroplane", "P", [[]]) {
    array = [
      [1, 1, 1],
      [0, 1, 0],
    ];
    template = array!;
  }
}
