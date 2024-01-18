// ignore_for_file: file_names

class Ship {
  String? name;
  String? code;
  int? shipSize;
  int? x;
  int? y;
  bool? horizontal = false;

  Ship(String this.name, String this.code, int this.shipSize);

  String? getCode() {
    return code;
  }

  String? getName() {
    return name;
  }

  int? getX() {
    return x;
  }

  int? getY() {
    return y;
  }

  void setLocation(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void rotate() {
    horizontal = !horizontal!;
  }

  int getWidth() {
    if (horizontal == true) {
      return shipSize!;
    } else {
      return 1;
    }
  }

  int getHeight() {
    if (horizontal == false) {
      return shipSize!;
    } else {
      return 1;
    }
  }

  @override
  String toString() {
    StringBuffer builder = StringBuffer();
    if (horizontal == true) {
      for (var i = 0; i < shipSize!; i++) {
        builder.write("O");
      }
      builder.write("\n");
    } else {
      for (var i = 0; i < shipSize!; i++) {
        builder.write("O\n");
      }
    }
    return builder.toString();
  }
}
