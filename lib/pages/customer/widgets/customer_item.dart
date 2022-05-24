import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qiviapp/common/models/customer.dart';
import 'package:qiviapp/config/config.dart';

class CustomerItem extends GetWidget {
  CustomerItem({required this.customer, Key? key}) : super(key: key);
  Customer customer;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: Get.width * 0.9,
            padding: CustomBoxs.mediumPadding,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              // border: Border.all(width: 1, color: Colors.black),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(customer.name, style: CustomTexts.textMediumBlack),
                    // Container(
                    //     padding: CustomBoxs.smallPadding,
                    //     decoration: CustomBoxs.redDecoration,
                    //     child: const Text("Nợ 1tr 2k",
                    //         style: CustomTexts.textMediumWhite))
                  ],
                ),
                Text("Sdt: " + customer.phoneNumber,
                    style: CustomTexts.textSmallBlack),
              ],
            )));
  }
}
