import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/widgets.dart';
import '../../../config/config.dart';

class Invoice extends StatelessWidget {
  Invoice(this.invoiceLink, {Key? key}) : super(key: key);
  String invoiceLink;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          child: Text("Chi tiết hoá đơn ",
              style: CustomTexts.textHeadingBlack
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () => openPhotoView(context),
          child: Container(
              alignment: Alignment.center,
              width: Get.width * 0.9,
              height: Get.height * 0.4,
              child: Image.network(invoiceLink, fit: BoxFit.cover)),
        )
      ]),
    );
  }

  void openPhotoView(context) {
    Get.to(() => PhotoViewWidget("Chi tiết hoá đơn", invoiceLink));
  }
}
