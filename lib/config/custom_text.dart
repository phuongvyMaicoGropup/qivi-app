import 'package:flutter/material.dart';
import 'package:qiviapp/config/config.dart';

class CustomTexts {
  CustomTexts._(); // this basically makes it so you can't instantiate this class

  static const TextStyle textMediumBlack =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black);
  static const TextStyle textSmallBlack =
      TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: Colors.black);
  static const TextStyle textSmallCyan = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w300,
      color: CustomColors.appCyanText);
  static const TextStyle textHeadingBlack =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black);
  static const TextStyle textMediumWhite =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white);
  static const TextStyle textSmallWhite =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white);
  static const TextStyle textMediumCyan = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: CustomColors.appCyanText);
}
