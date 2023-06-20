import 'package:flower/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoadSignButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const RoadSignButton({required this.text, this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 165.w,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/road_sign.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: RawMaterialButton(
          onPressed: onPressed,
          constraints: BoxConstraints(
            minHeight: 40.h,
            minWidth: 160.w,
          ),
          padding: EdgeInsets.only(left: 10.w),
          shape: const RoadSignShape(),
          child: LimitedBox(
            maxHeight: 40.h,
            maxWidth: 160.w,
            child: Text(text, style: const TextStyle(color: AppColors.darkRed)),
          )),
    );
  }
}

class RoadSignShape extends OutlinedBorder {
  @override
  final BorderSide side;

  const RoadSignShape({
    this.side = const BorderSide(),
  });

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return RoadSignShape(side: side ?? const BorderSide());
  }

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(10);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    var path = Path();
    path.lineTo(rect.width * 0.01, rect.height * 0.42);
    path.cubicTo(rect.width * 0.01, rect.height * 0.42, rect.width * 0.15,
        rect.height * 0.02, rect.width * 0.15, rect.height * 0.02);
    path.cubicTo(rect.width * 0.15, rect.height * 0.01, rect.width * 0.16, 0,
        rect.width * 0.17, 0);
    path.cubicTo(
        rect.width * 0.17, 0, rect.width * 0.97, 0, rect.width * 0.97, 0);
    path.cubicTo(rect.width, 0, rect.width, rect.height * 0.05, rect.width,
        rect.height * 0.12);
    path.cubicTo(rect.width, rect.height * 0.12, rect.width, rect.height * 0.88,
        rect.width, rect.height * 0.88);
    path.cubicTo(rect.width, rect.height * 0.95, rect.width, rect.height,
        rect.width * 0.97, rect.height);
    path.cubicTo(rect.width * 0.97, rect.height, rect.width * 0.17, rect.height,
        rect.width * 0.17, rect.height);
    path.cubicTo(rect.width * 0.16, rect.height, rect.width * 0.15, rect.height,
        rect.width * 0.15, rect.height * 0.98);
    path.cubicTo(rect.width * 0.15, rect.height * 0.98, rect.width * 0.02,
        rect.height * 0.61, rect.width * 0.02, rect.height * 0.61);
    path.cubicTo(0, rect.height * 0.56, 0, rect.height * 0.47,
        rect.width * 0.01, rect.height * 0.42);
    path.cubicTo(rect.width * 0.01, rect.height * 0.42, rect.width * 0.01,
        rect.height * 0.42, rect.width * 0.01, rect.height * 0.42);
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return scale(t);
  }
}
