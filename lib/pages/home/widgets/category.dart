import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Category extends StatelessWidget {
  Category(
      {required this.route,
      required this.icon,
      required this.description,
      Key? key})
      : super(key: key);

  String route;
  FaIcon icon;
  String description;
  void navigateToNewPage() {
    Get.toNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: navigateToNewPage,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: const Color(0xFF527378),
            // foregroundColor: Colors.black,
            child: icon,
          ),
        ),
        Text(description)
      ],
    );
  }
}
