import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillController extends GetxController {
  var scrollMessage = "hehe".obs;

  RxInt page = 1.obs;
  var isBottom = false.obs;
  var scrollNotificationMessate = "".obs;
  var isLoading = false.obs;
  late ScrollController scrollController;
  @override
  void onInit() {
    super.onInit();

    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        scrollMessage.value = "Bottom";
        isBottom.value = true;
        print("bottom");
      } else {
        isBottom.value = false;
      }
    });
  }

  void scrollUp() {}
  void scrollDown() {}

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
