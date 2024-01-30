// ignore_for_file: file_names

import 'dart:math';

import 'package:testproject/battleshipsv4/Board.dart';

abstract class Ship {
  String? name;
  String? code;
  int? shipSize;
  int? x;
  int? y;
  int? hits = 0;

  Ship(String this.name, String this.code, int this.shipSize);

  String? getCode() {
    return code;
  }

  String? getName() {
    return name;
  }

  int? getX() {
    return x;
  }

  int? getY() {
    return y;
  }

  void setLocation(int x, int y) {
    this.x = x;
    this.y = y;
  }

  bool incrementHitCount() {
    if (hits != null && shipSize != null) {
      if (hits! < shipSize!) {
        hits = hits! + 1;
      }
      return hits == shipSize;
    }
    return false; // Handle the case where hits or shipSize is null
  }

  void rotate();

  void addToBoard(Board board);

  int getHeight();

  int getWidth();

  bool overlap(Ship other) {
    Rectangle rectThis = Rectangle(x!, y!, getWidth(), getHeight());
    Rectangle rectOther = Rectangle(other.getX() as num, other.getY() as num,
        other.getWidth(), other.getHeight());
    Rectangle? intersection = rectThis.intersection(rectOther);

    if (intersection != null) {
      return (intersection.width >= 0) && (intersection.height >= 0);
    }

    return false;
  }

  bool isSunk() {
    return hits == shipSize;
  }
}
