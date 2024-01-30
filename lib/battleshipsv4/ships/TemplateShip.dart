// ignore_for_file: file_names

import 'package:testproject/battleshipsv4/Board.dart';
import 'package:testproject/battleshipsv4/Ship.dart';

class TemplateShip extends Ship {
  List<List<int>> template;

  TemplateShip(String name, String code, this.template)
      : super(name, code, countSquares(template));

  static int countSquares(List<List<int>> template) {
    int count = 0;
    for (List<int> row in template) {
      for (int square in row) {
        if (square == 1) {
          count++;
        }
      }
    }
    return count;
  }

  @override
  void addToBoard(Board board) {
    for (var i = 0; i < getHeight(); i++) {
      for (var j = 0; j < getWidth(); j++) {
        if (template[i][j] == 1) {
          board.getSquare(j + x!, i + y!).setShip(this);
        }
      }
    }
  }

  @override
  int getHeight() {
    return template.length;
  }

  @override
  int getWidth() {
    return template[0].length;
  }

  @override
  void rotate() {
    transpose();
    mirror();
  }

  void transpose() {
    List<List<int>> nextTemplate =
        List.generate(getWidth(), (index) => List<int>.filled(getHeight(), 0));
    for (var i = 0; i < getHeight(); i++) {
      for (var j = 0; j < getWidth(); j++) {
        nextTemplate[j][i] = template[i][j];
      }
    }
    template = nextTemplate;
  }

  void mirror() {
    for (var i = 0; i < getHeight(); i++) {
      List<int> row = [...template[i]];
      for (var j = 0; j < getWidth(); j++) {
        row[j] = template[i][(getWidth() - 1) - j];
      }
      template[i] = row;
    }
  }

  @override
  String toString() {
    StringBuffer builder = StringBuffer();
    for (var i = 0; i < getHeight(); i++) {
      for (var j = 0; j < getWidth(); j++) {
        if (template[i][j] == 0) {
          builder.write('~');
        } else {
          builder.write('O');
        }
      }
      builder.write('\n');
    }
    return builder.toString();
  }
}
