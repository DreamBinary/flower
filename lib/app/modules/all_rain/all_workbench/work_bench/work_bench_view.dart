import 'package:flower/app/component/btn_border.dart';
import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/routes/app_pages.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flower/app/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../component/mydialog.dart';
import 'work_bench_logic.dart';

class WorkBenchPage extends StatefulWidget {
  const WorkBenchPage({super.key});

  @override
  State<WorkBenchPage> createState() => _WorkBenchPageState();
}

class _WorkBenchPageState extends State<WorkBenchPage> {
  final logic = Get.find<WorkBenchLogic>();
  final state = Get.find<WorkBenchLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyTopBar(
        backgroundImage: const AssetImage("assets/images/topbar.png"),
        middle: Text(AppString.virtual, style: AppTS.title),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: BorderButton(
                    onPressed: () {
                      Get.toNamed(Routes.buy);
                    },
                    child: Text(
                      AppString.buy,
                      style: AppTS.fontSize22,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: BorderButton(
                    onPressed: () {
                      Get.toNamed(Routes.onlineTeach);
                    },
                    child: Text(
                      AppString.onlineTeach,
                      style: AppTS.fontSize22,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: BorderButton(
                    onPressed: () => {
                      showDialog(
                        context: context,
                        builder: (context) => MyDialog(
                          title: AppString.works,
                          bgPath: "assets/images/bg_dialog0.png",
                          child: LayoutBuilder(
                            builder: (_, constraints) {
                              return Image.asset("assets/images/work.png");
                            },
                          ),
                        ),
                      ),
                    },
                    child: Text(
                      AppString.works,
                      style: AppTS.fontSize22,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                ToastUtil.showToast("暂未开放");
              },
              child: Image.asset(
                "assets/images/workbench.png",
              ),
            ),
          ),
          // DraggableFloatingActionButton(onPressed: () {})
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<WorkBenchLogic>();
    super.dispose();
  }
}
