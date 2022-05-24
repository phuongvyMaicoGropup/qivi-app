import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qiviapp/pages/detail_customer/widgets/info_item.dart';

import '../../../common/function/functions.dart';
import '../../../common/models/customer.dart';
import '../../../config/config.dart';

class CustomerInfo extends GetWidget {
  const CustomerInfo(this.customer, this.amountOwed, this.total, {Key? key})
      : super(key: key);
  final Customer customer;
  final double amountOwed;
  final double total;
  @override
  Widget build(BuildContext context) {
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
              Text("Thông tin khách hàng",
                  style: CustomTexts.textHeadingBlack
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              InfoItem("Tên khách hàng", customer.name),
              InfoItem("Số điện thoại", customer.phoneNumber),
              InfoItem("Địa chỉ", customer.address),
              InfoItem("Tổng tiền đã mua", total.toString()),
              InfoItem("Tiền còn nợ", amountOwed.toString()),
              // InfoItem("Tổng đơn hàng", convertMoney(customer.total)),
              // InfoItem(
              //     "Số tiền còn nợ",
              //     convertMoney(customer.amountOwed) == ""
              //         ? "Đã thanh toán đủ "
              //         : convertMoney(customer.amountOwed)),
              // InfoItem("Trạng thái đơn hàng",
              //     (customer.isSuccess) ? "Đã giao" : "Chưa giao"),
              // InfoItem("Ngày tạo đơn hàng",
              //     "${created.day}-${created.month}-${created.year}"),
              // InfoItem("Cập nhập gần đây",
              //     "${lastUpdated.day}-${lastUpdated.month}-${lastUpdated.year}"),
              // InfoItem(
              //     "Ghi chú", customer.note == "" ? "Không có ghi chú" : customer.note),
            ],
          )),
    );
  }
}
