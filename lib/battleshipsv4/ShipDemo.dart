// ignore_for_file: file_names

import 'package:testproject/battleshipsv4/Ship.dart';
import 'package:testproject/battleshipsv4/ships/Aeroplane.dart';
import 'package:testproject/battleshipsv4/ships/AircraftCarrier.dart';
import 'package:testproject/battleshipsv4/ships/Destroyer.dart';
import 'package:testproject/battleshipsv4/ships/SimpleShip.dart';
import 'package:testproject/battleshipsv4/ships/TemplateShip.dart';

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
