import 'dart:io';
import 'dart:typed_data';

import 'package:flower/app/data/net/api_user.dart';
import 'package:flower/app/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'header_state.dart';

class HeaderLogic extends GetxController {
  final HeaderState state = HeaderState();

  Future<Image?> getCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      return Image.file(File(image.path));
    } else {
      ToastUtil.showToast("无照片");
      return null;
    }
  }

  Future<Image?> getGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      return Image.file(File(image.path));
    } else {
      ToastUtil.showToast("无照片");
      return null;
    }
  }

  // Future<Image> crop(XFile xFile) async {
  //   Uint8List bytes =
  //       await Get.to(() => CropHeader(FileImage(File(xFile.path))));
  //   getPath(bytes);
  //   return Image.memory(bytes);
  // }

  Future<void> getPath(Uint8List bytes) async {
    var tempDir = await getTemporaryDirectory();
    var file = await File(
            '${tempDir.path}/image_${DateTime.now().millisecondsSinceEpoch}.png')
        .create();
    file.writeAsBytesSync(bytes);
    state.path = file.path;
    ApiUser.changeInfo(avatarPath: file.path);
  }
}
