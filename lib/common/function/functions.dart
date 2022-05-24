import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

String convertMoney(double value) {
  String result = "";
  if (value > 1000000) {
    result += "${(value ~/ 1000000)}tr ";
    value = value % 1000000;
  }
  if (value > 1000) {
    result += "${(value ~/ 1000)}k ";
    value = value % 1000;
  }
  if (value > 0) {
    result += "${value}đ ";
  }
  return result;
}

Future uploadFile(File? _photo) async {
  if (_photo == null) return;
  final fileName = basename(_photo.path);
  final destination = 'files/$fileName';

  try {
    final ref = firebase_storage.FirebaseStorage.instance
        .ref(destination)
        .child('file/');
    await ref.putFile(_photo);
  } catch (e) {
    print('error occured' + e.toString());
  }
}

Future<String> storageImage(
  File file,
) async {
  final storage = firebase_storage.FirebaseStorage.instance;

  var uuid = Uuid();
  String url;
  try {
    String fileName = uuid.v1();
    var uploadTask = await storage.ref('images/$fileName').putFile(file);
    var dowurl = await uploadTask.ref.getDownloadURL();
    url = dowurl.toString();

    return Future<String>.value(url);
  } on firebase_core.FirebaseException catch (e) {
    Get.snackbar("Thông báo", "Up ảnh lỗi . Vui lòng thử lại ");
    return Future<String>.value('');
  }
}

void showMyDialog(BuildContext context, String title, String description,
    VoidCallback callBack) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Thoát'),
          ),
          TextButton(
            onPressed: callBack,
            child: Text('Đồng ý'),
          ),
        ],
      );
    },
  );
}
