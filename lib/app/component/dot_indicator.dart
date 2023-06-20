import 'package:flutter/material.dart';

class DotIndicator extends Decoration {
  final double radius;
  final Color color;
  final double strokeWidth;

  const DotIndicator({
    this.radius = 3,
    this.color = Colors.black,
    this.strokeWidth = 1,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) =>
      _MyBoxPainter(this, onChanged, radius, color, strokeWidth);
}

class _MyBoxPainter extends BoxPainter {
  final DotIndicator decoration;
  final double radius;
  final Color color;
  final double strokeWidth;

  _MyBoxPainter(
    this.decoration,
    VoidCallback? onChanged,
    this.radius,
    this.color,
    this.strokeWidth,
  ) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth;
    double x = offset.dx + configuration.size!.width / 2;
    double y = offset.dy + radius;
    canvas.drawCircle(Offset(x, y), radius, paint);
  }
}
