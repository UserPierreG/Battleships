// ignore_for_file: file_names

import 'package:testproject/battleshipsv5/AbstractGame.dart';
import 'package:testproject/battleshipsv5/AbstractPlayer.dart';
import 'package:testproject/battleshipsv5/Outcome.dart';
import 'package:testproject/battleshipsv5/Ship.dart';
import 'dart:io';
import 'dart:math';

abstract class CLIPlayer extends AbstractPlayer {
  CLIPlayer(super.name, super.board);

  @override
  void promptToTakeTurn(AbstractGame game) {
    print(" ");
    print(getName() + "'s turn");
    displayBoards(false);
    print(getName() + " enter your target (row-column):");
  }

  @override
  void displayResult(Outcome result) {
    if (result.hit!) {
      print("****** HIT");
      Ship sunk = result.sunk!;
      if (result.isSunk() != null) {
        print(" AND ${sunk.getName()} DESTROYED");
        if (result.gameWon!) {
          print(" AND WON THE GAME!");
        }
      }
      print(" ******");
      if (result.gameWon!) {
        displayBoards(true); // display boards with all ships showing
      }
    } else {
      print("------ MISS ------");
    }
    // short pause to help follow the game!
    sleep(Duration(seconds: 1));
  }

  void displayBoards(bool allShips) {
    bool hideAllShips = opponent!.isHuman();

    final List<String> y = board!.toStringArray(!hideAllShips || allShips);
    final List<String> o = opponent!.getBoard().toStringArray(allShips);
    final int leftColumn = max(y[0].length + 6, getName().length + 4);

    final StringBuffer heading = StringBuffer(getName());
    while (heading.length < leftColumn - 2) {
      heading.write(" ");
    }
    heading.write(opponent!.getName());
    print(heading.toString());

    final StringBuffer letters = StringBuffer("  ");
    for (int i = 0; i < y[0].length; i++) {
      letters.write(String.fromCharCode(i + 97));
    }
    while (letters.length < leftColumn) {
      letters.write(" ");
    }
    for (int i = 0; i < y[0].length; i++) {
      letters.write(String.fromCharCode(i + 97));
    }
    print(letters);

    for (int i = 0; i < y.length; i++) {
      StringBuffer line = StringBuffer();
      line.write(String.fromCharCode(i + 97));
      line.write(" ");
      line.write(y[i]);
      while (line.length < leftColumn) {
        line.write(" ");
      }
      line.write(o[i]);
      print(line.toString());
    }
  }

  @override
  void quitGame() {
    print("QUITTER!");
    displayBoards(true); // display boards with all ships showing
  }
}
