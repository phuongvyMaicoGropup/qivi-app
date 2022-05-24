import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qiviapp/common/function/functions.dart';
import 'package:qiviapp/common/models/bill.dart';
import 'package:qiviapp/config/config.dart';

class BillItem extends GetWidget {
  BillItem({required this.bill, Key? key}) : super(key: key);
  Bill bill;
  @override
  Widget build(BuildContext context) {
    var created = DateTime.parse(bill.created!);
    var lastUpdated = DateTime.parse(bill.lastUpdated!);
    return Center(
        child: Container(
            width: Get.width * 0.9,
            padding: CustomBoxs.mediumPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.black),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(bill.userInfo!.name,
                        style: CustomTexts.textMediumCyan),
                    Container(
                        padding: CustomBoxs.mainPadding,
                        decoration: bill.isSuccess
                            ? CustomBoxs.greenDecoration
                            : CustomBoxs.redDecoration,
                        child: Text(bill.isSuccess ? "Đã giao" : "Chưa giao",
                            style: CustomTexts.textSmallWhite.copyWith()))
                  ],
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Tổng đơn ',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: convertMoney(bill.total!),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Ngày tạo  "),
                          Text(
                              "${created.day}-${created.month}-${created.year}"),
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Cập nhập"),
                          Text(
                              "${lastUpdated.day}-${lastUpdated.month}-${lastUpdated.year}"),
                        ]),
                  ],
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Thanh toán ',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: bill.amountOwed == 0
                              ? "Đã thanh toán"
                              : "Còn nợ " + convertMoney(bill.amountOwed),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: bill.amountOwed == 0
                                  ? Colors.green
                                  : Colors.red)),
                    ],
                  ),
                ),
              ],
            )));
  }
}
