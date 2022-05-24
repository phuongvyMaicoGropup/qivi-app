import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/models/bill.dart';
import '../../detail_bill/view/detail_bill_page.dart';
import 'bill_item.dart';

class Bills extends StatelessWidget {
  Bills(this.bills, {Key? key}) : super(key: key);
  List<Bill> bills;
  void navigateToDetailBill(String id) {
    Get.to(DetailBillPage(id));
  }

  @override
  Widget build(BuildContext context) {
    return bills != [] && bills != null
        ? Container(
            width: Get.width * 0.8,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: bills.length,
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () => navigateToDetailBill(bills[index].id),
                    child: BillItem(key: UniqueKey(), bill: bills[index]),
                  )),
            ))
        : Container(child: Text("Chưa có đơn hàng nào gần đây"));
  }
}
