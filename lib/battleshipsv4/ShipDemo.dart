// ignore_for_file: file_names

import 'package:testproject/battleshipsv4/ships/Destroyer.dart';
import 'package:testproject/battleshipsv4/ships/SimpleShip.dart';

void main() {
  SimpleShip s = Destroyer();
  print(s);
  s.rotate();
  print(s);
  s.rotate();
  print(s);
  s.rotate();
  print(s);
}
