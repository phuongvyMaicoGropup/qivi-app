import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qiviapp/config/config.dart';
import 'package:qiviapp/domain/controller/bill_controller.dart';
import 'package:qiviapp/pages/bill/widgets/widgets.dart';

enum BillFilter { cost, notDone, all }

class BillPage extends GetView<BillController> {
  BillPage({Key? key}) : super(key: key);

  void _navigateToAddBill() {
    Get.toNamed("/add-bill");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: const Text("Trang hoá đơn")),
        ),
        floatingActionButton: CircleAvatar(
          // backgroundColor: Colors.red,
          child: Center(
            child: GestureDetector(
                onTap: _navigateToAddBill,
                child: Container(child: const FaIcon(FontAwesomeIcons.plus))),
          ),
        ),
        body: Container(
          // height: Get.height,
          margin: const EdgeInsets.only(top: 15),
          child: Column(children: [
            Container(
              height: 30,
              margin: const EdgeInsets.only(
                bottom: 16,
              ),
              width: Get.width * 0.9,
              child: ListView(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding: CustomBoxs.smallPadding,
                          decoration: CustomBoxs.blueDecoration,
                          child: Text("Chưa giao",
                              style: CustomTexts.textSmallWhite)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding: CustomBoxs.smallPadding,
                          decoration: CustomBoxs.orangeDecoration,
                          child: Text("Còn nợ",
                              style: CustomTexts.textSmallWhite)),
                    ),
                  ]),
            ),
            Expanded(child: Bills()),
          ]),
        ));
  }
}
