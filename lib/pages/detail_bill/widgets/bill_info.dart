import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qiviapp/pages/detail_bill/widgets/info_item.dart';

import '../../../common/function/functions.dart';
import '../../../common/models/bill.dart';
import '../../../config/config.dart';

class BillInfo extends GetWidget {
  const BillInfo(this.bill, {Key? key}) : super(key: key);
  final Bill bill;
  @override
  Widget build(BuildContext context) {
    var created = DateTime.parse(bill.created!);
    var lastUpdated = DateTime.parse(bill.lastUpdated!);
    var size = Get.size;
    return Center(
      child: Container(
          margin: const EdgeInsets.only(top: 5),
          padding: CustomBoxs.mainPadding,
          width: size.width * 0.9,
          // decoration: CustomBoxs.mainDecoration,
          child: Column(
            children: [
              // const SizedBox(height: 10),
              Text("Thông tin đơn hàng",
                  style: CustomTexts.textHeadingBlack
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              InfoItem("Tên khách hàng", bill.userInfo!.name),
              InfoItem("Số điện thoại", bill.userInfo!.phoneNumber),
              InfoItem("Địa chỉ", bill.userInfo!.address),
              InfoItem("Tổng đơn hàng", convertMoney(bill.total!)),
              InfoItem(
                  "Số tiền còn nợ",
                  convertMoney(bill.amountOwed) == ""
                      ? "Đã thanh toán đủ "
                      : convertMoney(bill.amountOwed)),
              InfoItem("Trạng thái đơn hàng",
                  (bill.isSuccess) ? "Đã giao" : "Chưa giao"),
              InfoItem("Ngày tạo đơn hàng",
                  "${created.day}-${created.month}-${created.year}"),
              InfoItem("Cập nhập gần đây",
                  "${lastUpdated.day}-${lastUpdated.month}-${lastUpdated.year}"),
              InfoItem("Ghi chú",
                  bill.note! == "" ? "Không có ghi chú" : bill.note!),
            ],
          )),
    );
  }
}
