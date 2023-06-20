import 'package:flower/app/theme/app_colors.dart';

import 'package:flutter/material.dart';

class RainButton extends StatelessWidget {
  final double scale;
  final Widget? child;
  final VoidCallback? onPressed;

  const RainButton(
      {super.key, this.scale = 1, required this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: AppColors.rain,
        constraints:
            BoxConstraints(minHeight: 170 * scale, minWidth: 110 * scale),
        elevation: 10,
        shape: const RainShape(),
        onPressed: onPressed,
        child: child);
  }
}

class RainShape extends OutlinedBorder {
  @override
  final BorderSide side;

  const RainShape({
    this.side = const BorderSide(),
  });

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return RainShape(side: side ?? const BorderSide());
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
    path.lineTo(rect.width / 2, -0.15);
    path.cubicTo(rect.width / 2, -0.15, rect.width, rect.height * 0.25,
        rect.width, rect.height * 0.45);
    path.cubicTo(rect.width, rect.height * 0.67, rect.width * 0.78,
        rect.height * 0.85, rect.width / 2, rect.height * 0.85);
    path.cubicTo(rect.width * 0.22, rect.height * 0.85, 0, rect.height * 0.67,
        0, rect.height * 0.45);
    path.cubicTo(
        0, rect.height * 0.25, rect.width / 2, -0.15, rect.width / 2, -0.15);
    path.cubicTo(
        rect.width / 2, -0.15, rect.width / 2, -0.15, rect.width / 2, -0.15);
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return scale(t);
  }
}
