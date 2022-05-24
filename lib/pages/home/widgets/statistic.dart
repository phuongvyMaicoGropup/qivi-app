import 'package:flutter/material.dart';

import '../../../config/config.dart';

class Statistic extends StatelessWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text("Bảng thống kê",
            style: CustomTexts.textHeadingBlack
                .copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
      ],
    ));
  }
}
