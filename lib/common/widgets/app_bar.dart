import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  // 1
  final String text;
  final bool centerTitle;

  AppBarWidget({
    Key? key,
    required this.text,
    this.centerTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2
    return SliverAppBar(
      title: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 25,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),

      centerTitle: centerTitle,
      // 3
      expandedHeight: 30.0,

      // 4
      pinned: false,
      elevation: 0,
      // 5
    );
  }
}
