// ignore_for_file: file_names

import 'package:testproject/battleshipsv5/Ship.dart';

class Outcome {
  int? x;
  int? y;
  bool? hit;
  Ship? sunk;
  bool? gameWon;

  Outcome(this.x, this.y, this.hit, this.sunk, this.gameWon);

  getX() {
    return x;
  }

  getY() {
    return y;
  }

  isHit() {
    return hit;
  }

  isSunk() {
    return sunk;
  }

  isGameWon() {
    return gameWon;
  }
}
