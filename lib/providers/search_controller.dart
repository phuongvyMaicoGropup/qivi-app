import 'package:get/get.dart';

class SearchController extends GetxController {
  RxString searchKey = "".obs;
  void change(String newValue) => searchKey.value = newValue;
}
