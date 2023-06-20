import 'dart:math';

import 'package:flower/app/component/more_button.dart';
import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/component/next_page_row.dart';
import 'package:flower/app/component/round_contain.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'point_exchange_logic.dart';

class PointExchangePage extends StatefulWidget {
  const PointExchangePage({Key? key}) : super(key: key);

  @override
  _PointExchangePageState createState() => _PointExchangePageState();
}

class _PointExchangePageState extends State<PointExchangePage> {
  final logic = Get.find<PointExchangeLogic>();
  final state = Get.find<PointExchangeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: MyTopBar(
          backgroundImage: const AssetImage("assets/images/topbar.png"),
          middle: Text(
            AppString.pointExchange,
            style: AppTS.title,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            children: const [
              Expanded(
                flex: 1,
                child: PointProductIem(),
              ),
              Expanded(
                flex: 1,
                child: PointPropItem(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const NextPageRow());
  }

  @override
  void dispose() {
    Get.delete<PointExchangeLogic>();
    super.dispose();
  }
}

class PointProductIem extends StatelessWidget {
  const PointProductIem({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundContain(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("文创产品",
                      style: AppTS.fontSize28
                          .copyWith(color: AppColors.darkYellow)),
                  MoreButton(
                    color: AppColors.darkYellow.withAlpha(120),
                    size: 22,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("产品名称：\n微型晶体软木画台灯", style: AppTS.fontSize20),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(AppColors.darkRed0),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              fixedSize: MaterialStatePropertyAll(
                                  Size.fromWidth(double.maxFinite)),
                            ),
                            onPressed: () {},
                            child: Text("兑换",
                                style: AppTS.fontSize20
                                    .copyWith(color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                    const Spacer(flex: 1),
                    Expanded(
                      flex: 6,
                      child: Container(
                        height: constraints.maxHeight * 0.7,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                              image: AssetImage(
                                  "assets/images/content_point0.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class PointPropItem extends StatelessWidget {
  const PointPropItem({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => RoundContain(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          height: constraints.constrainHeight(),
          width: constraints.constrainWidth(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("养花道具",
                      style: AppTS.fontSize28
                          .copyWith(color: AppColors.darkYellow)),
                  MoreButton(
                      color: AppColors.darkYellow.withAlpha(120), size: 22)
                ],
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    // debugPrint(constraints.toString());
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PropItem(
                          size: min(constraints.constrainHeight(),
                              constraints.constrainWidth() / 2),
                          name: "阳光",
                          imagePath: "assets/images/sun.png",
                        ),
                        PropItem(
                          size: min(constraints.constrainHeight(),
                              constraints.constrainWidth() / 2),
                          name: "肥料",
                          imagePath: "assets/images/fertilizer.png",
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}

class PropItem extends StatelessWidget {
  final double size;
  final String imagePath;
  final String name;
  final VoidCallback? onPressed;

  const PropItem(
      {required this.size,
      required this.imagePath,
      required this.name,
      this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RoundContain(
          margin: null,
          height: size * 0.95,
          width: size * 0.95,
          color: AppColors.darkYellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: AppColors.cultivateItemBg, shape: BoxShape.circle),
                child: Image.asset(
                  imagePath,
                  width: size * 0.3,
                  height: size * 0.3,
                ),
              ),
              Text(name, style: AppTS.fontSize16)
            ],
          ),
        ),
        SizedBox(height: size * 0.05),
        ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColors.darkRed0),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          onPressed: onPressed,
          child:
              Text("兑换", style: AppTS.fontSize14.copyWith(color: Colors.white)),
        )
      ],
    );
  }
}
