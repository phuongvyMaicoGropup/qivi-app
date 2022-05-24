import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qiviapp/common/function/functions.dart';
import 'package:qiviapp/common/models/bill.dart';
import 'package:qiviapp/domain/controller/controllers.dart';
import 'package:qiviapp/domain/controller/update_bill.dart';

import '../../../common/widgets/widgets.dart';
import '../../../config/config.dart';
import '../../../domain/graphql/bill/mutations.dart';
import '../../../domain/graphql/customer/queries.dart';

class UpdateBillPage extends HookWidget {
  Bill bill;
  XFile? imageFile;
  Set<String> customersName = {""};
  List customers = [];
  void selectCustomer() {
    print(" was selected");
  }

  final controller = Get.put(UpdateBillController());
  final selectedCustomerController = Get.put(SelectFormController());

  UpdateBillPage(this.bill, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final updateBill = useMutation(
      MutationOptions(
          document: gql(updateBillMutation),
          onCompleted: (dynamic resultData) {
            // print(resultData);
            Get.snackbar("Thông báo", "Cập nhập đơn hàng thành công",
                backgroundColor: CustomColors.appGreen);
          },
          onError: (error) {
            Get.snackbar(
                "Thông báo", "Cập nhập đơn hàng thất bại. Vui lòng thử lại ",
                backgroundColor: CustomColors.appPink);
          }),
    );
    controller.getData(bill);
    return Scaffold(
      appBar: AppBar(title: const Text('Chỉnh sửa hoá đơn')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.updateBillFormKey,
            child: Column(
              children: [
                Query(
                  options: QueryOptions(
                    document: gql(
                        customerSelectQuery), // this is the query string you just created
                  ),
                  builder: (QueryResult result,
                      {VoidCallback? refetch, FetchMore? fetchMore}) {
                    customers.forEach((c) {
                      if (c["id"] == bill.userInfo!.id) {
                        selectedCustomerController.selected.value = c["name"];
                      }
                    });
                    if (result.hasException) {
                      return Text(result.exception.toString());
                    }

                    if (result.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    customers = result.data?['users'];

                    if (customers == null) {
                      return SelectFormWidget(
                          customersName.toList(), selectCustomer, "Khách hàng");
                    }

                    customers.forEach(
                        (a) => {customersName.add(a['name'] as String)});

                    return SelectFormWidget(
                        customersName.toList(), selectCustomer, "Khách hàng");
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                InputWidget(
                  controller: controller.totalController,
                  label: "Tổng tiền",
                  validator: r".",
                  errorMessage: "Vui lòng không để trống",
                  width: Get.width * 0.9,
                  minLines: 1,
                  maxLines: 1,
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 15,
                ),
                InputWidget(
                  controller: controller.amountOwedtController,
                  label: "Tiền nợ",
                  validator: r".",
                  errorMessage: "Vui lòng không để trống",
                  width: Get.width * 0.9,
                  minLines: 1,
                  maxLines: 1,
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 15,
                ),
                InputWidget(
                  controller: controller.noteController,
                  label: "Ghi chú",
                  validator: r".",
                  errorMessage: "Vui lòng không để trống",
                  width: Get.width * 0.9,
                  minLines: 5,
                  maxLines: 10,
                  inputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return GestureDetector(
                      onTap: () {
                        // controller.takePicture();
                        _settingModalBottomSheet(context);
                      },
                      child: Container(
                          width: Get.width * 0.9,
                          height: Get.height * 0.3,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.black26),
                              borderRadius: BorderRadius.circular(5)),
                          child: Image.network(controller.imageFile.value)));
                }),
                const SizedBox(
                  height: 15,
                ),
                ButtonWidget("Cập nhập", () async {
                  if (controller.updateBillFormKey.currentState!.validate()) {
                    try {
                      // print(selectedCustomerController.selected.value);
                      String link =
                          await storageImage(File(controller.imageFile.value));

                      String id = "";
                      customers.forEach((c) {
                        if (c["name"] ==
                            selectedCustomerController.selected.value) {
                          id = c["id"];
                        }
                      });
                      updateBill.runMutation({
                        "customerId": id,
                        "id": bill.id,
                        "invoice": link,
                        "isSuccess": true,
                        "note": controller.noteController.text,
                        "lastUpdated":
                            "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
                        "created": bill.created,
                        "total": double.parse(controller.totalController.text),
                        "amountOwed":
                            double.parse(controller.amountOwedtController.text)
                      });

                      controller.resetValue();
                      Get.back();
                    } catch (e) {
                      print(e);
                      String id = "";
                      customers.forEach((c) {
                        if (c["name"] ==
                            selectedCustomerController.selected.value) {
                          id = c["id"];
                        }
                      });
                      updateBill.runMutation({
                        "customerId": id,
                        "id": bill.id,
                        "invoice": bill.invoice,
                        "isSuccess": true,
                        "note": controller.noteController.text,
                        "lastUpdated":
                            "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
                        "created": bill.created,
                        "total": double.parse(controller.totalController.text),
                        "amountOwed":
                            double.parse(controller.amountOwedtController.text)
                      });

                      controller.resetValue();
                      Get.back();
                    }
                  } else {
                    Get.snackbar(
                        "Thông báo", "Thông tin không hợp lệ vui lòng thử lại",
                        backgroundColor: CustomColors.appPink);
                  }
                }, Get.width * 0.9)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Image picker
  Future imageSelector(BuildContext context, String pickerType) async {
    switch (pickerType) {
      case "gallery":

        /// GALLERY IMAGE PICKER
        imageFile = await ImagePicker()
            .pickImage(source: ImageSource.gallery, imageQuality: 90);
        break;

      case "camera": // CAMERA CAPTURE CODE
        imageFile = await ImagePicker()
            .pickImage(source: ImageSource.camera, imageQuality: 90);
        break;
    }

    if (imageFile != null) {
      controller.updateImage(imageFile!.path);
      print("You selected  image : " + controller.imageFile.value);
    } else {
      print("You have not taken image");
    }
  }

  // Image picker
  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: [
                ListTile(
                    title: const Text('Gallery'),
                    onTap: () => {
                          imageSelector(context, "gallery"),
                          Navigator.pop(context),
                        }),
                ListTile(
                  title: const Text('Camera'),
                  onTap: () => {
                    imageSelector(context, "camera"),
                    Navigator.pop(context)
                  },
                ),
              ],
            ),
          );
        });
  }
}
