import 'package:flower/app/component/btn_rain.dart';
import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/component/rain_animate.dart';
import 'package:flower/app/routes/app_pages.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'rain_logic.dart';

class RainPage extends StatefulWidget {
  const RainPage({super.key});

  @override
  State<RainPage> createState() => _RainPageState();
}

class _RainPageState extends State<RainPage> {
  final logic = Get.find<RainLogic>();
  final state = Get.find<RainLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyTopBar(
        backgroundImage: const AssetImage("assets/images/topbar.png"),
        middle: Text(AppString.rainPage, style: AppTS.title),
      ),
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg_rain.png"),
                      fit: BoxFit.fill))),
          const RainAnimate(),
          Positioned(
              top: 56.h,
              left: 35.w,
              child: RainButton(
                  scale: 0.8,
                  onPressed: () => {
                        Get.toNamed(Routes.teach),
                      },
                  child: Text(
                    AppString.teach2,
                    style: AppTS.fontSize24,
                  ))),
          Positioned(
              top: 21.h,
              left: 219.w,
              child: RainButton(
                  scale: 0.85,
                  onPressed: () => {
                        Get.toNamed(Routes.travel),
                      },
                  child: Text(
                    AppString.travel2,
                    style: AppTS.fontSize24,
                    textAlign: TextAlign.center,
                  ))),
          Positioned(
              top: 239.h,
              left: 148.w,
              child: RainButton(
                  scale: 1.2,
                  onPressed: () => {Get.toNamed(Routes.pointExchange)},
                  child: Text(
                    AppString.pointExchange2,
                    style: AppTS.fontSize34,
                  ))),
          Positioned(
              top: 350.h,
              left: 42.w,
              child: RainButton(
                  scale: 0.78,
                  onPressed: () => {Get.toNamed(Routes.workBench)},
                  child: Text(
                    AppString.make2,
                    style: AppTS.fontSize24,
                  ))),
          Positioned(
              top: 441.h,
              left: 257.w,
              child: RainButton(
                  scale: 0.76,
                  onPressed: () => {Get.toNamed(Routes.live)},
                  child: Text(
                    AppString.live2,
                    style: AppTS.fontSize24,
                  ))),
          Positioned(
              top: 537.h,
              left: 97.w,
              child: RainButton(
                  scale: 0.72,
                  onPressed: () => {
                        Get.toNamed(Routes.video),
                      },
                  child: Text(
                    AppString.video2,
                    style: AppTS.fontSize24,
                  ))),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<RainLogic>();
    super.dispose();
  }
}
