// ignore_for_file: file_names

import 'dart:math';

import 'package:testproject/battleshipsv5/IllegalStateException.dart';
import 'package:testproject/battleshipsv5/FailedToPlaceShipException.dart';
import 'package:testproject/battleshipsv5/Fleet.dart';
import 'package:testproject/battleshipsv5/Outcome.dart';
import 'package:testproject/battleshipsv5/Ship.dart';
import 'package:testproject/battleshipsv5/Square.dart';

class Board {
  int? row;
  int? col;
  List<List<Square>>? board;
  List<Ship>? ships;

  Board(this.row, this.col)
      : board = List.generate(
          // Creates an empty 2d array.
          row!,
          (i) => List.generate(
            col!,
            (j) => Square(),
          ),
        ) {
    for (int i = 0; i < col!; i++) {
      for (int j = 0; j < row!; j++) {
        board![i][j] = Square();
      }
    }
    ships = <Ship>[];
  }

  int? getWidth() {
    return col;
  }

  int? getHeight() {
    return row;
  }

  bool inBounds(int x, int y) {
    return x >= 0 && y >= 0 && x < col! && y < row!;
  }

  Square getSquare(int x, int y) {
    return board![y][x];
  }

  void setup(Fleet fleet) {
    List<Ship>? ships = fleet.getShips();

    if (ships != null) {
      for (Ship s in ships) {
        placeShip(s);
      }
    } else {
      // Handle the case where getShips() returns null
      print('No ships in the fleet.');
      // You might want to throw an exception, log an error, or handle it in another way.
    }
  }

  void placeShip(Ship ship) {
    final int breakThreshold = 100000;
    Random random = Random();
    for (var i = 0; i < random.nextInt(4); i++) {
      ship.rotate();
    }

    int breakCount = 0;

    bool collision = true;

    while (collision == true) {
      if (breakCount > breakThreshold) {
        throw FailedToPlaceShipException();
      }

      ship.rotate();

      int x = random.nextInt(col! - ship.getWidth());
      int y = random.nextInt(row! - ship.getHeight());
      ship.setLocation(x, y);

      collision = false;

      for (var s in ships!) {
        if (s.overlap(ship)) {
          collision = true;
          break;
        }
      }

      if (collision == false) {
        ship.addToBoard(this);
        ships!.add(ship);
      }
      breakCount++;
    }
  }

  List<String> toStringArray(bool showShips) {
    List<String> array = List<String>.filled(row!, "");

    for (int y = 0; y < row!; y++) {
      StringBuffer builder = StringBuffer();
      builder.write("${String.fromCharCode('A'.codeUnitAt(0) + y)} ");
      for (int x = 0; x < col!; x++) {
        Square square = getSquare(x, y);
        builder.write("${square.getCodeCharacter(showShips)} ");
      }
      array[y] = builder.toString();
    }

    return array;
  }

  @override
  String toString() {
    List<String> array = toStringArray(true);
    StringBuffer builder = StringBuffer();

    for (int y = 0; y < row!; y++) {
      builder.write(array[y]);
      builder.write("\n");
    }

    builder.write(" ");

    for (var i = 1; i <= col!; i++) {
      if (i <= 10) {
        builder.write(" ");
      }
      builder.write(i);
    }
    builder.write("\n");

    return builder.toString();
  }

  Outcome dropBomb(int x, int y) {
    Square square = getSquare(x, y);
    if (square.isTried() == false) {
      square.setTried(true);
      Ship? sunkShip;
      bool gameWon = false;
      if (square.isHit()) {
        if (square.getShip()!.isSunk()) {
          sunkShip = square.getShip();
          gameWon = true;
          for (var ship in ships!) {
            if (ship.isSunk() == false) {
              gameWon = false;
              break;
            }
          }
        }
      }
      return Outcome(x, y, square.isHit(), sunkShip, gameWon);
    } else {
      throw IllegalStateException("Square already played!");
    }
  }
}
