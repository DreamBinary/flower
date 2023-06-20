import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ImagePreview extends StatelessWidget {
  final ImageProvider image;

  const ImagePreview(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "header",
      child: PhotoView(
        imageProvider: image,
        enableRotation: true,
        filterQuality: FilterQuality.high,
        onTapUp: (_, __, ___) {
          Get.back();
        },
      ),
      transitionOnUserGestures: true,
    );
  }
}

