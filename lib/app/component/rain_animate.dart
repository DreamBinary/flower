import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RainAnimate extends StatefulWidget {
  const RainAnimate({super.key});

  @override
  State<RainAnimate> createState() => _RainAnimateState();
}

class _RainAnimateState extends State<RainAnimate>
    with SingleTickerProviderStateMixin {
  late AnimationController ctrl =
      AnimationController(duration: const Duration(minutes: 1), vsync: this)
        ..repeat();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getImage(),
      builder: (context, async) {
        if (async.connectionState == ConnectionState.done && async.hasData) {
          return CustomPaint(painter: RainPainter(ctrl, async.data!));
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Future<ui.Image> _getImage() async {
    ByteData data = await rootBundle.load("assets/images/rain.png");
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }
}

class RainPainter extends CustomPainter {
  final _paint = Paint()..isAntiAlias = true;
  final ui.Image image;
  late final List<Rain> rainList;

  RainPainter(AnimationController ctrl, this.image) : super(repaint: ctrl) {
    rainList = List.generate(50, (_) => Rain(image.width, image.height));
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (rainList.isNotEmpty) {
      for (var rain in rainList) {
        move(rain);
        ui.Offset offset = ui.Offset(rain.x, rain.y);
        canvas.save();
        canvas.scale(rain.scale);
        _paint.colorFilter = ColorFilter.matrix([
          1,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
          0,
          0,
          0,
          0,
          1,
          0,
          0,
          0,
          0,
          0,
          rain.alpha,
          0
        ]);
        canvas.drawImage(image, offset, _paint);
        canvas.restore();
      }
    }
  }

  void move(Rain rain) {
    rain.x += rain.dx;
    rain.y += rain.dy;
    if (rain.y > ScreenUtil().screenHeight ||
        rain.x > ScreenUtil().screenWidth) {
      rain.reset();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Rain {
  late double x;
  late double y;
  late double dx;
  late double dy;
  late double scale;
  late double alpha;
  final int _rainWidth;
  final int _rainHeight;
  final double screenWidth = ScreenUtil().screenWidth;
  final double screenHeight = ScreenUtil().screenHeight;

  Rain(this._rainWidth, this._rainHeight) {
    reset();
  }

  void reset() {
    double random = 0.5 + Random().nextDouble();
    double speed = 0.2 * random;
    dx = _rainWidth * speed;
    dy = _rainHeight * speed;
    scale = random * 1.5;
    alpha = random * 0.8;
    // 设置初始 xy (-rainWidth, -rainHeight)
    double xy = Random().nextDouble() * screenWidth * 2 - screenWidth;
    x = (xy >= 0 ? xy : 0.0) - _rainWidth;
    y = (xy >= 0 ? 0.0 : Random().nextDouble() * screenHeight) -
        _rainHeight.toDouble();
  }
}
