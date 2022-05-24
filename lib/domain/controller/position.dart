import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Position extends GetxController {
  RxBool isBottom = false.obs;
  final scrollController = ScrollController();
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
}
