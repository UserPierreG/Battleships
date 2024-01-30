// ignore_for_file: file_names

import 'package:testproject/battleshipsv4/ships/TemplateShip.dart';

class AircraftCarrier extends TemplateShip {
  List<List<int>>? array;

  AircraftCarrier() : super("AircraftCarrier", "C", [[]]) {
    array = [
      [1, 1, 1, 1, 1],
      [0, 1, 1, 0, 0],
    ];
    template = array!;
  }
}
