// ignore_for_file: file_names

import 'package:testproject/battleshipsv1/Board.dart';

void main() {
  Board b1 = Board(10, 10);
  b1.setup();
  print(b1);
  b1.dropBomb(2, 0);
  print(b1);
  b1.dropBomb(2, 1);
  print(b1);
  b1.dropBomb(2, 2);
  print(b1);

  var b = b1.toStringArray(false);
  for (var r in b) {
    print(r);
  }
}
