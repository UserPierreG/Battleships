// ignore_for_file: file_names

import 'package:testproject/battleshipsv5/AbstractGame.dart';
import 'package:testproject/battleshipsv5/AbstractPlayer.dart';
import 'package:testproject/battleshipsv5/Board.dart';
import 'package:testproject/battleshipsv5/cli/CLIGame.dart';
import 'package:testproject/battleshipsv5/cli/CLIHumanPlayer.dart';
import 'package:testproject/battleshipsv5/ships/BoardFactory.dart';

void main() {
  List<Board> boards = BoardFactory().getTinyBoards();
  AbstractPlayer player1 = CLIHumanPlayer("Human1", boards[0]);
  AbstractPlayer player2 = CLIHumanPlayer("Human2", boards[1]);
  AbstractGame game = CLIGame(player1, player2);
  game.startGame();
}
