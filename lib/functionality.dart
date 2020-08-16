import 'package:flutter/material.dart';
import 'dart:math';

Random random = Random();

class Functionality {
  int _c = 10;
  int randomGen() {
    int x = random.nextInt(6) + 1;
    _c -= 1;
    return x;
  }

  bool isTen() {
    if (_c <= 0) {
      return false;
    } else {
      return true;
    }
  }

  void reset() {
    _c = 10;
  }
}
