import 'package:flower/app/component/btn_border.dart';
import 'package:flower/app/component/image_name_show.dart';
import 'package:flower/app/component/mydialog.dart';
import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/component/round_contain.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'cultivate_logic.dart';

class CultivatePage extends StatefulWidget {
  const CultivatePage({super.key});

  @override
  State<CultivatePage> createState() => _CultivatePageState();
}

class _CultivatePageState extends State<CultivatePage> {
  final logic = Get.find<CultivateLogic>();
  final state = Get.find<CultivateLogic>().state;

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/bg_cultivate.png"), context);
    return Scaffold(
      appBar: MyTopBar(
        backgroundImage: const AssetImage("assets/images/topbar.png"),
        middle: Text(AppString.cultivateMan, style: AppTS.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_cultivate.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                color: AppColors.primary,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      CultivateItem(
                        text: AppString.rainWater,
                        imagePath: "assets/images/rain_water.png",
                        onPressed: () => {
                          showDialog(
                            context: context,
                            builder: (context) => MyDialog(
                              title: AppString.cultivateBtn,
                              bgPath: "assets/images/bg_dialog1.png",
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  RainWaterItem(
                                    name: "茉莉花",
                                    progress: "萌芽中",
                                    state: "需要浇水",
                                    imagePath: "assets/images/flower2.png",
                                  ),
                                  RainWaterItem(
                                    name: "石榴花",
                                    progress: "萌芽中",
                                    state: "良好",
                                    imagePath: "assets/images/flower1.png",
                                  ),
                                  RainWaterItem(
                                    name: "桂花",
                                    progress: "已开花",
                                    state: "良好",
                                    imagePath: "assets/images/flower0.png",
                                  ),
                                  // Expanded(child: CultivatingItem()),
                                  // Expanded(child: CultivatingItem()),
                                  // Expanded(child: CultivatingItem()),
                                ],
                              ),
                            ),
                          ),
                        },
                      ),
                      CultivateItem(
                        text: AppString.seedBag,
                        imagePath: "assets/images/seed_bag.png",
                        onPressed: () => {
                          showDialog(
                            context: context,
                            builder: (context) => MyDialog(
                              title: AppString.seedBag,
                              bgPath: "assets/images/bg_dialog1.png",
                              child: LayoutBuilder(
                                builder: (_, constraints) {
                                  var width =
                                      constraints.constrainWidth() / 2.1;
                                  var height = width + width / 5;
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            height: height,
                                            width: width,
                                            child: SeedItem(
                                              size: width,
                                              name: "菊花",
                                              imagePath:
                                                  "assets/images/flower3.png",
                                              color: const Color(0xffEAD26F),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height,
                                            width: width,
                                            child: SeedItem(
                                              size: width,
                                              name: "月季",
                                              imagePath:
                                                  "assets/images/flower4.png",
                                              color: const Color(0xffEAD26F),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            height: height,
                                            width: width,
                                            child: SeedItem(
                                              size: width,
                                              name: "迎春花",
                                              imagePath:
                                                  "assets/images/flower5.png",
                                              color: const Color(0xffEAD26F),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height,
                                            width: width,
                                            child: SeedItem(
                                              size: width,
                                              name: "玫瑰",
                                              imagePath:
                                                  "assets/images/flower6.png",
                                              color: const Color(0xffEAD26F),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        },
                      ),
                      CultivateItem(
                        text: AppString.knowFruit,
                        imagePath: "assets/images/know_fruit.png",
                        onPressed: () => {
                          showDialog(
                            context: context,
                            builder: (context) => MyDialog(
                              title: AppString.knowFruit,
                              bgPath: "assets/images/bg_dialog1.png",
                              child: LayoutBuilder(
                                builder: (_, constraints) {
                                  return RoundContain(
                                    margin: const EdgeInsets.all(10),
                                    height: constraints.constrainHeight(),
                                    child: DefaultTextStyle(
                                      style: AppTS.fontSize18
                                          .copyWith(color: AppColors.darkRed0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("基本资料"),
                                          Text("中文名 : " + "软木画"),
                                          Text("英文名 : " + "cork picture"),
                                          Text("地区 : " + "福建省福州市"),
                                          Text("遗产类型 : " + "传统美术"),
                                          Text("批准时间 : " + "2008年"),
                                          Text("遗产编号 : " + "Ⅶ-90"),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/know_fruit_content.png"),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              clipBehavior: Clip.antiAlias,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        },
                      ),
                      CultivateItem(
                        text: AppString.prop,
                        imagePath: "assets/images/prop.png",
                        onPressed: () => {
                          showDialog(
                            context: context,
                            builder: (context) => MyDialog(
                              title: AppString.prop,
                              bgPath: "assets/images/bg_dialog1.png",
                              child: LayoutBuilder(
                                builder: (_, constraints) {
                                  var height =
                                      constraints.constrainHeight() / 3.25;
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      PropDialogItem(height,
                                          "assets/images/sun.png", "阳光", "10"),
                                      PropDialogItem(
                                          height,
                                          "assets/images/fertilizer.png",
                                          "肥料",
                                          "1"),
                                      PropDialogItem(
                                          height,
                                          "assets/images/herbicide.png",
                                          "除草剂",
                                          "5"),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: BorderButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            backgroundColor: Colors.transparent,
                            child: Container(
                              height: 650.h,
                              width: 400.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.darkYellow, width: 2),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/flower.png"),
                                      fit: BoxFit.fill)),
                              child: const SizedBox(),
                            ),
                          ));
                },
                child: Text(
                  AppString.cultivateBtn,
                  style: AppTS.fontSize22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<CultivateLogic>();
    super.dispose();
  }
}

class SeedItem extends StatelessWidget {
  final double size;
  final String name;
  final String imagePath;
  final Color color;

  const SeedItem(
      {required this.size,
      required this.name,
      required this.imagePath,
      required this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageNameItem(
      size: size,
      name: name,
      image: AssetImage(imagePath),
      color: color,
    );
  }
}

class PropDialogItem extends StatelessWidget {
  final double size;
  final String imagePath;
  final String name;
  final String num;

  const PropDialogItem(this.size, this.imagePath, this.name, this.num);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundContain(
            margin: null,
            height: size,
            width: size,
            color: AppColors.darkYellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: AppColors.cultivateItemBg, shape: BoxShape.circle),
                  child: Image.asset(
                    imagePath,
                    width: size * 0.4,
                    height: size * 0.4,
                  ),
                ),
                const Spacer(),
                Text(name,
                    style: AppTS.fontSize16.copyWith(color: AppColors.darkRed0))
              ],
            ),
          ),
          DefaultTextStyle(
            style: AppTS.fontSize16.copyWith(color: AppColors.darkRed0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("当前拥有数 : " + num),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("立即使用",
                          style: AppTS.fontSize16
                              .copyWith(color: AppColors.darkRed0)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        textStyle: AppTS.fontSize16
                            .copyWith(color: AppColors.darkRed0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("前往购买",
                          style: AppTS.fontSize16
                              .copyWith(color: AppColors.darkRed0)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RainWaterItem extends StatelessWidget {
  final String name;
  final String progress;
  final String state;
  final String imagePath;

  const RainWaterItem(
      {required this.name,
      required this.progress,
      required this.state,
      required this.imagePath,
      super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      debugPrint(constraints.toString());
      return InkWell(
        onTap: () => {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.darkYellow, width: 2),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/bg_dialog4.png"),
                        fit: BoxFit.fill)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30.h, bottom: 15.h),
                      child: Text(
                        "雨露浇灌",
                        style:
                            AppTS.fontSize24.copyWith(color: AppColors.darkRed),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Text(
                        "雨露值-1，浇灌成功，花儿正在努力生长~",
                        style: AppTS.fontSize14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.cultivatingBg,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                elevation: 10,
                shape: const CircleBorder(),
                child: Container(
                  height: constraints.constrainWidth() * 0.3,
                  width: constraints.constrainWidth() * 0.3,
                  decoration: BoxDecoration(
                      color: AppColors.background,
                      image: DecorationImage(
                          image: AssetImage(imagePath), fit: BoxFit.contain),
                      shape: BoxShape.circle),
                ),
              ),
              Expanded(
                child: DefaultTextStyle(
                  style: AppTS.fontSize16.copyWith(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("花名 : " + name, maxLines: 1),
                      Text("生长进度 : " + progress, maxLines: 1),
                      Text("当前状态 : " + state, maxLines: 1),
                    ],
                  ).paddingOnly(left: 8),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class CultivateItem extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback? onPressed;

  const CultivateItem(
      {super.key, required this.text, required this.imagePath, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Column(
        children: [
          Container(
            height: 65,
            width: 65,
            decoration: const BoxDecoration(
                color: AppColors.cultivateItemBg, shape: BoxShape.circle),
            child: RawMaterialButton(
              onPressed: onPressed,
              shape: const CircleBorder(),
              child: Transform.scale(
                  scale: 0.6,
                  child: Image(
                    image: AssetImage(imagePath),
                  )),
            ),
          ),
          Text(text, style: AppTS.fruitItem)
        ],
      ),
    );
  }
}
