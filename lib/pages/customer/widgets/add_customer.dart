import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qiviapp/common/widgets/input.dart';
import 'package:qiviapp/domain/controller/controllers.dart';

import '../../../config/config.dart';
import '../../../domain/graphql/customer/mutations.dart';

class AddCustomer extends HookWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    var controller = Get.put(AddCustomerController());
    return Center(
      child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: CustomBoxs.mainPadding,
          width: size.width * 0.9,
          decoration: CustomBoxs.mainDecoration,
          child: Form(
            key: controller.addCustomerFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Thêm khách hàng mới",
                    style: CustomTexts.textHeadingBlack),
                const SizedBox(
                  height: 15,
                ),
                InputWidget(
                  controller: controller.nameController,
                  label: "Tên khách hàng ",
                  validator: r".",
                  errorMessage: "Vui lòng không để trống",
                  width: Get.width * 0.9,
                  minLines: 1,
                  maxLines: 1,
                  inputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                InputWidget(
                  controller: controller.phoneNumberController,
                  label: "Số điện thoại",
                  validator: r".",
                  errorMessage: "Vui lòng không để trống",
                  width: Get.width * 0.9,
                  minLines: 1,
                  maxLines: 1,
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                InputWidget(
                  controller: controller.addressController,
                  label: "Địa chỉ",
                  validator: r".",
                  errorMessage: "Vui lòng không để trống",
                  width: Get.width * 0.9,
                  minLines: 2,
                  maxLines: 2,
                  inputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                CustomColors.appCyan)),
                        onPressed: () {
                          controller.addCustomerMutation.runMutation({
                            'name': controller.nameController.text,
                            'address': controller.addressController.text,
                            'phoneNumber': controller.phoneNumberController.text
                          });
                          controller.resetValue();
                          Get.back();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.35,
                          child: const Text("Thêm",
                              style: CustomTexts.textMediumCyan),
                        )),
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                CustomColors.appPink)),
                        onPressed: () {
                          Get.back();
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: Get.width * 0.35,
                            child: const Text("Thoát",
                                style: TextStyle(color: Colors.red)))),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
