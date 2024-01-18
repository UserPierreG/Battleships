// ignore_for_file: file_names

import 'package:testproject/battleshipsv2/Ship.dart';

import 'package:testproject/battleshipsv2/Square.dart';

class Board {
  int? row;
  int? col;
  List<List<Square>>? board;

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

  void setup() {
    Ship s1 = Ship('Battleship', 'B', 5);
    Ship s2 = Ship('Battleship', 'B', 5);
    for (var i = 0; i < 5; i++) {
      getSquare(i + 1, 1).setShip(s1);
      getSquare(4, i + 3).setShip(s2);
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

  bool dropBomb(int x, int y) {
    Square? square = getSquare(x, y);
    if (square.isTried() == false) {
      square.setTried(true);
      return square.isHit();
    }
    return false;
  }
}
