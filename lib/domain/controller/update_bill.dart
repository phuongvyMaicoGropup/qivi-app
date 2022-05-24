import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qiviapp/common/function/functions.dart';
import 'package:qiviapp/common/models/bill.dart';
import 'package:qiviapp/config/config.dart';

import '../graphql/bill/mutations.dart';

class UpdateBillController extends GetxController {
  final updateBillFormKey = GlobalKey<FormState>();
  final noteController = TextEditingController();
  final amountOwedtController = TextEditingController(); // Tien tra truoc
  final totalController = TextEditingController();
  RxString imageFile = "".obs;
  void updateImage(String newValue) => imageFile.value = newValue;
  @override
  void onInit() {
    super.onInit();
  }

  getData(Bill bill) {
    imageFile.value = bill.invoice!;
    noteController.text = bill.note!;
    amountOwedtController.text = bill.amountOwed.toString();
    totalController.text = bill.total.toString();
  }

  @override
  void onClose() {
    noteController.dispose();
    amountOwedtController.dispose();
    totalController.dispose();
    super.onClose();
  }

  String? validator(String? value) {
    if (value == "") {
      return 'Vui lòng không được để trống';
    }
    return null;
  }

  void resetValue() {
    noteController.clear();
    amountOwedtController.clear();
    totalController.clear();
  }
}
