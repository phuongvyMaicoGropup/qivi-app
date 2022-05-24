import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qiviapp/providers/search_controller.dart';

class SearchBar extends GetWidget {
  SearchBar({required this.hintText, Key? key}) : super(key: key);
  String hintText;
  final SearchController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: size.height * 0.01),
        width: size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: TextField(
            onChanged: (value) => onChangeSearchKey(value),
            decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                suffixIconColor: Colors.black26,
                contentPadding: const EdgeInsets.all(10),
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.black26,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ))),
      ),
    );
  }

  void onChangeSearchKey(String value) {
    searchController.change(value);
  }
}
