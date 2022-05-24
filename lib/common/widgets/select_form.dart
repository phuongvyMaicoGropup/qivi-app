import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectFormController extends GetxController {
  RxString selected = "".obs;
  void updateValue(String newValue) => selected.value = newValue;
}

class SelectFormWidget extends StatelessWidget {
  const SelectFormWidget(this.items, this.callback, this.title, {Key? key})
      : super(key: key);
  final List<String> items;
  final VoidCallback callback; // Notice the variable type
  final String title; // Notice the variable type

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SelectFormController());
    return Obx((() {
      return Stack(clipBehavior: Clip.none, children: [
        Positioned(
            top: -8,
            left: 10,
            child: Container(
              // padding : EdgeInsets.all(5)
              decoration: const BoxDecoration(
                  color: Colors.white, backgroundBlendMode: BlendMode.dstOver),
              child: Text(title,
                  style: TextStyle(color: Colors.black54, fontSize: 12)),
            )),
        Container(
          width: Get.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: Colors.black26),
          ),
          child: DropdownButton<String>(
              isExpanded: true,
              value: controller.selected.value,
              icon: const Icon(Icons.keyboard_arrow_down),
              underline: Container(),
              items: items.map((String item) {
                return DropdownMenuItem(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(item),
                    ));
              }).toList(),
              onChanged: (value) {
                controller.updateValue(value!);
                callback;
              }),
        ),
      ]);
    }));
  }
}
