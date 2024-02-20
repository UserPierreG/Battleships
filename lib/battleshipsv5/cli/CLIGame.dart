// ignore_for_file: file_names

import 'package:testproject/battleshipsv5/AbstractGame.dart';

class CLIGame extends AbstractGame {
  CLIGame(super.player1, super.player2);

  @override
  void startGame() {
    while (!gameOver) {
      nextTurn();
    }
  }
}
