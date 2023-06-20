import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class RoundContain extends StatelessWidget {
  final Widget? child;
  final Color color;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const RoundContain(
      {this.child,
      this.height,
      this.width,
      this.color = Colors.white,
      this.padding = const EdgeInsets.all(10),
      this.margin = const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.darkYellow, width: 2),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
