import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DropdownSelectControler extends GetxController {
  RxString selected = "Tất cả".obs;
  RxMap<String, dynamic> filterQuery = RxMap<String, dynamic>();
  change(value) => selected.value = value;
}

class DropdownSelectWidget extends StatelessWidget {
  DropdownSelectWidget(this.dropdownvalue, this.items, this.callback,
      {Key? key})
      : super(key: key);
  String dropdownvalue;
  List<String> items;
  void Function(String? value) callback;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DropdownSelectControler());
    return Wrap(children: [
      DropdownButton(
        // Initial Value
        value: controller.selected.value,

        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),

        // Array list of items
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: callback,
      ),
    ]);
  }
}
