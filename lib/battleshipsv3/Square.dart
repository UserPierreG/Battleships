// ignore_for_file: file_names

import 'package:testproject/battleshipsv3/Ship.dart';

class Square {
  Ship? ship;
  bool? tried = false;

  Ship? getShip() {
    return ship;
  }

  void setShip(Ship ship) {
    this.ship = ship;
  }

  bool? isTried() {
    return tried;
  }

  void setTried(bool tried) {
    this.tried = tried;
    if (ship != null) {
      ship!.incrementHitCount();
    }
  }

  bool isHit() {
    return tried! && ship != null;
  }

  bool isMiss() {
    return tried! && ship == null;
  }

  String? getCodeCharacter(bool showShips) {
    if (tried! && ship != null) {
      if (ship!.isSunk()) {
        return 'X';
      }
    }
    if (tried!) {
      if (isHit()) {
        return '*';
      } else if (isMiss()) {
        return '\'';
      }
    } else {
      if (showShips && ship != null) {
        return ship?.getCode();
      }
    }
    return '~';
  }
}
