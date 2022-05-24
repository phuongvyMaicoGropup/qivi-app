import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';

class AddBill extends GetWidget {
  const AddBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Center(
      child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: CustomBoxs.mainPadding,
          width: size.width * 0.9,
          decoration: CustomBoxs.mainDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Tạo mới ", style: CustomTexts.textMediumBlack),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  CustomColors.appPink,
                )),
                onPressed: () {},
                child: const Text("Thêm", style: CustomTexts.textMediumBlack),
              )
            ],
          )),
    );
  }
}
