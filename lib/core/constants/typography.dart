import 'package:flutter/material.dart';

const String _FONT_FAMILY = 'skie';

class Typogaphy {
  static const TextStyle light =
      TextStyle(fontFamily: _FONT_FAMILY, fontWeight: FontWeight.w200);
  static const TextStyle bold =
      TextStyle(fontFamily: _FONT_FAMILY, fontWeight: FontWeight.w600);

  static const TextStyle semiBold =
      TextStyle(fontFamily: _FONT_FAMILY, fontWeight: FontWeight.w600);

  static const TextStyle medium =
      TextStyle(fontFamily: _FONT_FAMILY, fontWeight: FontWeight.w500);

  static const TextStyle regular =
      TextStyle(fontFamily: _FONT_FAMILY, fontWeight: FontWeight.w400);

  static const TextStyle thin =
      TextStyle(fontFamily: _FONT_FAMILY, fontWeight: FontWeight.w300);

  static const TextStyle extraLight =
      TextStyle(fontFamily: _FONT_FAMILY, fontWeight: FontWeight.w100);
}
