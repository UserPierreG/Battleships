import 'package:testproject/battleshipsv3/Ship.dart';
import 'package:testproject/battleshipsv3/ships/Battleship.dart';
import 'package:testproject/battleshipsv3/ships/Destroyer.dart';
import 'package:testproject/battleshipsv3/ships/Submarine.dart';

class Fleet {
  List<Ship>? ships = [];

  Fleet(int battleships, int destroyers, int submarines) {
    for (var i = 0; i < battleships; i++) {
      ships!.add(Battleship());
    }
    for (var i = 0; i < destroyers; i++) {
      ships!.add(Destroyer());
    }
    for (var i = 0; i < submarines; i++) {
      ships!.add(Submarine());
    }
  }

  List<Ship>? getShips() {
    return ships;
  }
}
