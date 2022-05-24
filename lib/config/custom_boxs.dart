import 'package:flutter/material.dart';

import 'config.dart';

class CustomBoxs {
  CustomBoxs._(); // this basically makes it so you can't instantiate this class

  static const EdgeInsetsGeometry mainPadding =
      EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5);
  static const EdgeInsetsGeometry smallPadding =
      EdgeInsets.only(right: 8, left: 8, top: 5, bottom: 5);
  static const EdgeInsetsGeometry mediumPadding =
      EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10);
  static Decoration mainDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
  );
  static Decoration redDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.redAccent,
  );
  static Decoration orangeDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.orangeAccent,
  );
  static Decoration blueDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.blueAccent,
  );
  static Decoration greenDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.green,
  );
  static Decoration cyanDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: CustomColors.appCyan,
  );
}
