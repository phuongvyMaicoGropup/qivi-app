import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qiviapp/common/function/functions.dart';
import 'package:qiviapp/config/config.dart';

import '../graphql/bill/mutations.dart';

class AddBillController extends GetxController {
  final addBillFormKey = GlobalKey<FormState>();
  final noteController = TextEditingController();
  final prepaymentController = TextEditingController(); // Tien tra truoc
  final totalController = TextEditingController();
  RxString imageFile = "".obs;
  void updateImage(String newValue) => imageFile.value = newValue;
  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage
    prepaymentController.text = "0";
    super.onInit();
  }

  @override
  void onClose() {
    noteController.dispose();
    prepaymentController.dispose();
    totalController.dispose();
    super.onClose();
  }

  String? validator(String? value) {
    if (value == "") {
      return 'Vui lòng không được để trống';
    }
    return null;
  }

  void addBill() async {
    // if (addBillFormKey.currentState!.validate()) {
    //   try {
    //     String link = await storageImage(File(imageFile.value));
    //     addBillToServer.runMutation({
    //       "note": noteController.text,
    //       "total": double.parse(totalController.text),
    //       "amountOwed": double.parse(totalController.text) -
    //           double.parse(prepaymentController.text),
    //       "customerId": "",
    //       "invoice": link,
    //     });
    //   } catch (e) {
    //     Get.snackbar("Thông báo", "Đã xảy ra lỗi . Vui lòng thử lại",
    //         backgroundColor: CustomColors.appPink);
    //   }
    // } else {
    //   Get.snackbar("Thông báo", "Thông tin không hợp lệ vui lòng thử lại",
    //       backgroundColor: CustomColors.appPink);
    // }
  }

  void resetValue() {
    noteController.clear();
    prepaymentController.clear();
    totalController.clear();
  }
}
