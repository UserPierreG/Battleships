// ignore_for_file: file_names

import 'package:testproject/battleshipsv5/Board.dart';
import 'package:testproject/battleshipsv5/Fleet.dart';
import 'dart:io';

class BoardFactory {
  Board getBigBoard() {
    Fleet fleet = Fleet(1, 2, 3, 4, 1);
    Board board = Board(15, 15);
    while (true) {
      try {
        board.setup(fleet);
        return board;
      } catch (e) {
        stderr.writeln("FailedToPlaceShipException");
      }
    }
  }

  List<Board> getBigBoards() {
    return [getBigBoard(), getBigBoard()];
  }

  Board getSmallBoard() {
    Fleet fleet = Fleet(1, 1, 0, 1, 1);
    Board board = Board(10, 10);
    while (true) {
      try {
        board.setup(fleet);
        return board;
      } catch (e) {
        stderr.writeln("FailedToPlaceShipException");
      }
    }
  }

  List<Board> getSmallBoards() {
    return [getSmallBoard(), getSmallBoard()];
  }

  Board getTinyBoard() {
    Fleet fleet = Fleet(0, 0, 0, 1, 0);
    Board board = Board(5, 5);
    while (true) {
      try {
        board.setup(fleet);
        return board;
      } catch (e) {
        stderr.writeln("FailedToPlaceShipException");
      }
    }
  }

  List<Board> getTinyBoards() {
    return [getTinyBoard(), getTinyBoard()];
  }
}
