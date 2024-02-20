// ignore_for_file: file_names

import 'package:testproject/battleshipsv5/AbstractGame.dart';
import 'package:testproject/battleshipsv5/Board.dart';
import 'package:testproject/battleshipsv5/Outcome.dart';

abstract class AbstractPlayer {
  String? name;
  Board? board;
  AbstractPlayer? opponent;

  AbstractPlayer(this.name, this.board);

  getName() {
    return name;
  }

  getBoard() {
    return board;
  }

  void setOpponent(AbstractPlayer opponent) {
    this.opponent = opponent;
  }

  AbstractPlayer? getOpponent() {
    return opponent;
  }

  bool isHuman();
  void promptToTakeTurn(AbstractGame game);
  void displayResult(Outcome result);
  void quitGame();
}
