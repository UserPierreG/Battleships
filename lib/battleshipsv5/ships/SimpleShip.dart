// ignore_for_file: file_names

import 'package:testproject/battleshipsv5/Board.dart';
import 'package:testproject/battleshipsv5/Ship.dart';

class SimpleShip extends Ship {
  bool? horizontal = true;

  SimpleShip(super.name, super.code, super.shipSize);

  @override
  int getWidth() {
    if (horizontal == true) {
      return shipSize!;
    } else {
      return 1;
    }
  }

  @override
  int getHeight() {
    if (horizontal == false) {
      return shipSize!;
    } else {
      return 1;
    }
  }

  @override
  void rotate() {
    horizontal = !horizontal!;
  }

  @override
  void addToBoard(Board board) {
    if (horizontal == true) {
      for (var i = 0; i < shipSize!; i++) {
        board.getSquare(i + x!, y!).setShip(this);
      }
    } else {
      for (var i = 0; i < shipSize!; i++) {
        board.getSquare(x!, i + y!).setShip(this);
      }
    }
  }

  @override
  String toString() {
    StringBuffer builder = StringBuffer();
    if (horizontal == true) {
      for (var i = 0; i < shipSize!; i++) {
        builder.write("O");
      }
      builder.write("\n");
    } else {
      for (var i = 0; i < shipSize!; i++) {
        builder.write("O\n");
      }
    }
    return builder.toString();
  }
}
