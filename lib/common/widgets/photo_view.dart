import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewWidget extends StatelessWidget {
  PhotoViewWidget(this.title, this.url, {Key? key}) : super(key: key);
  String url;
  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: PhotoView(
          imageProvider: NetworkImage(url),
        ));
  }
}
