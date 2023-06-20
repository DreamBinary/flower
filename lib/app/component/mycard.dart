import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color color;
  final double? height;
  final double? width;
  final GestureTapCallback? onPressed;
  final Widget? child;

  const MyCard(this.color,
      {super.key, this.height, this.width, this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        child: RawMaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: onPressed,
            child: Container(
              height: height,
              width: width,
              alignment: Alignment.center,
              child: child,
            )));
  }
}
