// ignore_for_file: file_names

import 'package:testproject/battleshipsv4/Board.dart';
import 'package:testproject/battleshipsv4/Fleet.dart';
import 'package:testproject/battleshipsv4/ships/Aeroplane.dart';
import 'package:testproject/battleshipsv4/ships/AircraftCarrier.dart';
import 'package:testproject/battleshipsv4/ships/Battleship.dart';

void main() {
  Board b1 = Board(10, 10);

  // b1.placeShip(Aeroplane());
  // b1.placeShip(AircraftCarrier());
  // b1.placeShip(Battleship());

  Fleet fleet = Fleet(1, 1, 2, 1, 1);
  b1.setup(fleet);

  // b1.placeShip(Battleship());
  // b1.placeShip(Destroyer());
  // b1.placeShip(Submarine());
  // b1.placeShip(Submarine());

  // for (var i = 1; i < 5; i++) {
  //   for (var y = 0; y < 10; y++) {
  //     b1.dropBomb(y, i);
  //   }
  // }

  print(b1);
}
