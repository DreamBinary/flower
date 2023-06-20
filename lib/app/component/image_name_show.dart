import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class ImageNameItem extends StatelessWidget {
  final double size;
  final String name;
  final ImageProvider image;
  final Color color;

  const ImageNameItem(
      {required this.size,
      required this.name,
      required this.image,
      required this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: image,
          fit: BoxFit.scaleDown,
        ),
        border: Border.all(color: AppColors.darkRed0, width: 2),
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.none,
      child: OverflowBox(
        alignment: Alignment.bottomCenter,
        minHeight: size / 6,
        minWidth: size / 2,
        maxHeight: size / 4.5,
        maxWidth: size / 1.5,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: AppColors.darkRed0, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: Text(
            name,
            style: AppTS.fontSize18.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
