import 'package:flower/app/component/btn_direction.dart';
import 'package:flower/app/component/btn_road_sign.dart';
import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/routes/app_pages.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flower/app/utils/mmkv.dart';
import 'package:flower/app/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'village_logic.dart';

class VillagePage extends StatefulWidget {
  const VillagePage({super.key});

  @override
  _VillagePageState createState() => _VillagePageState();
}

class _VillagePageState extends State<VillagePage> {
  final logic = Get.find<VillageLogic>();
  final state = Get.find<VillageLogic>().state;
  double dx = 0;
  double dy = 0;
  late StateSetter moveState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyTopBar(
        backgroundImage: const AssetImage("assets/images/topbar.png"),
        middle: Text(AppString.villagePage, style: AppTS.title),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) => Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg_village.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 232.h,
              left: 200.w,
              child: const VillageItem(
                title: "敬请期待",
                isMore: true,
              ),
            ),
            Positioned(
              bottom: 280.h,
              left: 42.w,
              child: const VillageItem(
                title: "软木画项目屋",
              ),
            ),
            Positioned(
              top: 420.h,
              left: 220.w,
              child: const VillageItem(title: "寿山石雕项目屋"),
            ),
            StatefulBuilder(
              builder: (_, StateSetter setState) {
                moveState = setState;
                return Positioned(
                  bottom: -dy,
                  left: 60.w + dx,
                  child: Image.asset(
                    "assets/images/village_people.png",
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/village_bottom.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: DirectionButton((dx, dy) {
                moveState(() {
                  this.dx += dx;
                  this.dy += dy;
                });
              }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<VillageLogic>();
    super.dispose();
  }
}

class VillageItem extends StatelessWidget {
  final String title;
  final bool isMore;

  const VillageItem({required this.title, this.isMore = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoadSignButton(
        text: title,
        onPressed: () => isMore
            ? ToastUtil.showToast("敬请期待啦")
            : (MMKVUtil.getBool("isUnLock" + title)
                ? Get.toNamed(Routes.villageDetail,
                    arguments: title.substring(0, title.length - 3))
                : _showUnlock(context)));
  }

  void _showUnlock(BuildContext context) {
    bool isUnLock = false;
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_dialog3.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: StatefulBuilder(
            builder: (_, setState) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  isUnLock ? "成功解锁" : "点击解锁项目屋",
                  style: AppTS.fontSize20.copyWith(color: AppColors.darkRed),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isUnLock = true;
                    });
                    Future.delayed(
                        const Duration(milliseconds: 600),
                        () => {
                              Navigator.of(context).pop(),
                              Get.toNamed(Routes.villageDetail,
                                  arguments:
                                      title.substring(0, title.length - 3))
                            });
                    MMKVUtil.put("isUnLock" + title, true);
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    switchInCurve: Curves.easeInOutBack,
                    transitionBuilder: (child, animation) => ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                    child: isUnLock
                        ? Image.asset(
                            "assets/images/unlock.png",
                            key: const ValueKey("unlock"),
                            height: 150,
                            width: 150,
                          )
                        : Image.asset(
                            "assets/images/lock.png",
                            key: const ValueKey("lock"),
                            height: 150,
                            width: 150,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
