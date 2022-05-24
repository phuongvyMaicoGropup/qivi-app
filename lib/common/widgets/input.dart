import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  InputWidget(
      {required this.controller,
      required this.label,
      required this.validator,
      required this.errorMessage,
      required this.width,
      required this.minLines,
      required this.maxLines,
      required this.inputType,
      Key? key})
      : super(key: key);

  TextEditingController controller;
  String label;
  String validator;
  String errorMessage;
  double width;
  int maxLines;
  int minLines;
  TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextFormField(
          maxLines: maxLines,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
          keyboardType: inputType,
          minLines: minLines,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.circular(4.0),
              ),
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.black)),
              labelText: label,
              focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.red)),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.red)),
              errorStyle: const TextStyle(fontSize: 10, color: Colors.red),
              // focusColor: Colors.,
              contentPadding: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                right: 10.0,
              )),
          validator: (value) {
            if (!RegExp(validator).hasMatch(controller.text)) {
              return errorMessage;
            }
            return null;
          },
        )
      ]),
    );
  }
}
