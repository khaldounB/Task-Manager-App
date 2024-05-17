// Flutter imports:
import 'package:flutter/material.dart';

class KColors {
  static final KColors _kColors = KColors._internal();

  factory KColors() {
    return _kColors;
  }

  KColors._internal();

  final Color kDarkGray = const Color(0xff50555C);
  final Color kLightGray = const Color(0xff9A9A9A);
  final Color kDarkBlackColor = const Color(0xff262626);
  final Color kScaffoldColor = const Color(0xffF8F8F8);
  final Color kDarkRedColor = const Color(0xffFF0606);
  final Color kDarkGreenColor = const Color(0xff4AA264);
  final Color kLightGreenColor = const Color(0xffD5ECD8);
}
