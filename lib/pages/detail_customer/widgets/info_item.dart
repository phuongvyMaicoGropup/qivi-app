import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../../../config/config.dart';

class InfoItem extends StatelessWidget {
  const InfoItem(this.title, this.value, {Key? key}) : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(bottom: 10),
      width: Get.size.width * 0.9,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black38,
            width: 1.0,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: CustomTexts.textMediumBlack
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 16)),
          const SizedBox(height: 5),
          Text(value,
              style: const TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }
}
