// ignore_for_file: file_names

import 'package:testproject/battleshipsv2/Ship.dart';

void main() {
  Ship s = Ship("Battleship", "B", 5);
  print(s);
  s.rotate();
  print(s);
}
