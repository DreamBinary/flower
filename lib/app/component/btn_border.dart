import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const BorderButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/btn_border_bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: RawMaterialButton(
        onPressed: onPressed,
        constraints: BoxConstraints.tightFor(width: 120.w, height: 50.h),
        child: FittedBox(
          alignment: Alignment.center,
          fit: BoxFit.fill,
          child: child,
        ),
      ),
    );
    // return Ink.image(
    //   height: 50,
    //   width: 120,
    //   image: const AssetImage("assets/images/btn_border_bg.png"),
    //   fit: BoxFit.fill,
    //   child: InkWell(
    //     onTap: onPressed,
    //     child: Align(
    //       alignment: Alignment.center,
    //       child: child,
    //     ),
    //   ),
    // );
  }
}
