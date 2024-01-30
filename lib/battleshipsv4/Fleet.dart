import 'package:testproject/battleshipsv4/Ship.dart';
import 'package:testproject/battleshipsv4/ships/Aeroplane.dart';
import 'package:testproject/battleshipsv4/ships/Battleship.dart';
import 'package:testproject/battleshipsv4/ships/Destroyer.dart';
import 'package:testproject/battleshipsv4/ships/Submarine.dart';
import 'package:testproject/battleshipsv4/ships/AircraftCarrier.dart';

class Fleet {
  List<Ship>? ships = [];

  Fleet(int battleships, int destroyers, int submarines, int aeroplanes,
      int aircraftCarriers) {
    for (var i = 0; i < battleships; i++) {
      ships!.add(Battleship());
    }
    for (var i = 0; i < destroyers; i++) {
      ships!.add(Destroyer());
    }
    for (var i = 0; i < submarines; i++) {
      ships!.add(Submarine());
    }
    for (var i = 0; i < aeroplanes; i++) {
      ships!.add(Aeroplane());
    }
    for (var i = 0; i < aircraftCarriers; i++) {
      ships!.add(AircraftCarrier());
    }
  }

  List<Ship>? getShips() {
    return ships;
  }
}
