import 'package:get/get.dart';
import 'package:qiviapp/domain/controller/bill_controller.dart';
import 'package:qiviapp/domain/controller/controllers.dart';

import '../controller/home_controller.dart';

class AddBillBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddBillController());
  }
}

class AddCustomerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCustomerController());
  }
}

class BillBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BillController());
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
