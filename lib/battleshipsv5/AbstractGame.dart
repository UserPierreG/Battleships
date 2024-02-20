// ignore_for_file: file_names, prefer_interpolation_to_compose_strings

import 'package:testproject/battleshipsv5/AbstractPlayer.dart';
import 'dart:math';
import 'package:testproject/battleshipsv5/Outcome.dart';

abstract class AbstractGame {
  AbstractPlayer player1;
  AbstractPlayer player2;

  AbstractPlayer? playerToGoFirst;
  AbstractPlayer? currentPlayer;
  bool gameOver = false;

  AbstractGame(this.player1, this.player2) {
    player1.setOpponent(player2);
    player2.setOpponent(player1);
    if (Random().nextDouble() >= 0.5) {
      currentPlayer = player2;
      playerToGoFirst = player1;
    } else {
      currentPlayer = player1;
      playerToGoFirst = player2;
    }
  }
  getPlayer1() {
    return player1;
  }

  getPlayer2() {
    return player2;
  }

  void startGame();

  void nextTurn() {
    if (currentPlayer == player1) {
      currentPlayer = player2;
    } else {
      currentPlayer = player1;
    }
    currentPlayer!.promptToTakeTurn(this);
  }

  void takeTurn(int x, int y) {
    Outcome result = currentPlayer!.getOpponent()!.getBoard().dropBomb(x, y);
    currentPlayer!.displayResult(result);
    if (result.gameWon!) {
      gameOver = true;
    }
  }

  void quitGame() {
    currentPlayer!.quitGame();
    gameOver = true;
  }
}
