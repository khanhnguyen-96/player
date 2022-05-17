import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> grey = const <int, Color>{
    800: const Color(0xFF303030),
    900: const Color(0xFF252525)
  };

  static const black = const Color(0xFF181818);
  static const black2 = const Color(0xFF020B16);
  static const white = const Color(0xFFFFFFFF);
  static const blue = const Color(0xFF0191F7);
  static const maroon = const Color(0xFFBF2043);
  static const green = const Color(0xFF56A052);
  static const red = const Color(0xFFC34848);
  static const orange = const Color(0xFFFF7D2E);
  static const yellow = const Color(0xFFE3AA27);
  static const brightYellow = const Color(0xFFFFC84B);
  static const dullWhite = const Color(0xFFDADADA);
  static const gray = const Color(0xFFB3B3B3);

  static const primaryText = Color.fromRGBO(255, 255, 255, .9);
  static const primaryBgr = AppColors.black;
  static const highlight = AppColors.orange;
}
