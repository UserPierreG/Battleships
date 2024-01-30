// ignore_for_file: file_names

import 'package:testproject/battleshipsv3/Board.dart';
import 'package:testproject/battleshipsv3/Fleet.dart';

void main() {
  Board b1 = Board(10, 10);

  Fleet fleet = Fleet(1, 1, 4);
  b1.setup(fleet);

  // b1.placeShip(Battleship());
  // b1.placeShip(Destroyer());
  // b1.placeShip(Submarine());
  // b1.placeShip(Submarine());

  for (var i = 1; i < 5; i++) {
    for (var y = 0; y < 10; y++) {
      b1.dropBomb(y, i);
    }
  }

  print(b1);
}
