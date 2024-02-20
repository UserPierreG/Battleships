// ignore_for_file: file_names

import 'package:testproject/battleshipsv5/AbstractGame.dart';
import 'package:testproject/battleshipsv5/Board.dart';
import 'package:testproject/battleshipsv5/cli/CLIPlayer.dart';
import 'dart:io';

class CLIHumanPlayer extends CLIPlayer {
  var reader = stdin;

  CLIHumanPlayer(super.name, super.board);

  @override
  bool isHuman() {
    return true;
  }

  @override
  void promptToTakeTurn(AbstractGame game) {
    super.promptToTakeTurn(game);
    try {
      final Board opponentBoard = opponent!.getBoard();
      while (true) {
        final String line = reader.readLineSync()!.trim();
        if (line.toLowerCase() == 'quit') {
          game.quitGame();
          break;
        } else {
          try {
            if (line.length != 2) {
              throw Exception(
                  "Bad input: enter just two characters such as 'ab'.");
            }
            final int y = line.codeUnitAt(0) - 97;
            final int x = line.codeUnitAt(1) - 97;
            if (opponentBoard.inBounds(x, y)) {
              if (opponentBoard.getSquare(x, y).isTried() == false) {
                game.takeTurn(x, y); // calls back to displayResult
              } else {
                throw Exception("You already played '$line'!");
              }
            } else {
              throw Exception("'$line' is not on the board!");
            }
            return;
          } catch (x) {
            print(x.toString());
            print(
                "Enter yx where a <= y <= ${String.fromCharCode(opponentBoard.getHeight()! + 96)} and a <= x <= ${String.fromCharCode(opponentBoard.getWidth()! + 96)} or enter 'quit' to quit.");
          }
        }
      }
    } catch (x) {
      throw Exception(x);
    }
  }
}
