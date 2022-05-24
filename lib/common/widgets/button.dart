import 'package:flutter/material.dart';
import 'package:qiviapp/config/config.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget(this.text, this.callback, this.width,
      [this.bgColor = CustomColors.appCyanText,
      this.textColor = CustomColors.appCyan]);
  final String text;
  final VoidCallback callback; // Notice the variable type
  final double width;
  Color bgColor;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: callback,
        child: Container(
          alignment: Alignment.center,
          width: width,
          padding: CustomBoxs.mediumPadding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: bgColor,
          ),
          child: Text(text,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: textColor,
              )),
        ));
  }
}
