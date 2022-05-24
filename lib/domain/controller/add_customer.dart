import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../config/config.dart';
import '../graphql/customer/mutations.dart';

class AddCustomerController extends GetxController {
  final addCustomerFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    super.onClose();
  }

  String? validator(String? value) {
    if (value == "") {
      return 'Vui lòng không được để trống';
    }
    return null;
  }

  void resetValue() {
    nameController.clear();
    phoneNumberController.clear();
    addressController.clear();
  }

  final addCustomerMutation = useMutation(
    MutationOptions(
        document: gql(addCustomer),
        onCompleted: (dynamic resultData) {
          // print(resultData);
          Get.snackbar("Thông báo", "Tạo khách hàng mới thành công",
              backgroundColor: CustomColors.appGreen);
        },
        onError: (error) {
          Get.snackbar("Thông báo",
              "Tên khách hàng hoặc sđt của khách hàng đã bị trùng. Vui lòng thử lại ",
              backgroundColor: CustomColors.appPink);
        }),
  );
}
