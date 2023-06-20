import 'package:flower/app/modules/all_cultivate/cultivate/cultivate_view.dart';
import 'package:flower/app/modules/all_mine/mine/mine_view.dart';
import 'package:flower/app/modules/all_tribe/tribe/tribe_view.dart';
import 'package:flower/app/modules/all_village/village/village_view.dart';
import 'package:flower/app/modules/home/home_view.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'route_logic.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage>
    with SingleTickerProviderStateMixin {
  final logic = Get.find<RouteLogic>();
  final state = Get.find<RouteLogic>().state;
  late final TabController _tabCtrl = TabController(length: 5, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: TabBarView(
          controller: _tabCtrl,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomePage(),
            CultivatePage(),
            VillagePage(),
            TribePage(),
            MinePage()
          ]),
      bottomNavigationBar: Material(
        elevation: 100,
        child: Container(
          color: AppColors.primary,
          child: StatefulBuilder(
            builder: (_, setState) {
              return TabBar(
                controller: _tabCtrl,
                // indicatorColor: Colors.black,
                // indicator: const DotIndicator(),
                indicator: const BoxDecoration(),
                labelColor: AppColors.darkRed,
                unselectedLabelColor: Colors.black,
                onTap: (index) => {_tabCtrl.animateTo(index), setState(() {})},
                tabs: [
                  MyTab("assets/images/bottom0.png", AppString.homePage,
                      _tabCtrl.index == 0),
                  MyTab("assets/images/bottom1.png", AppString.cultivatePage,
                      _tabCtrl.index == 1),
                  MyTab("assets/images/bottom2.png", AppString.villagePage,
                      _tabCtrl.index == 2),
                  MyTab("assets/images/bottom3.png", AppString.tribePage,
                      _tabCtrl.index == 3),
                  MyTab("assets/images/bottom4.png", AppString.minePage,
                      _tabCtrl.index == 4),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<RouteLogic>();
    super.dispose();
  }
}

class MyTab extends StatelessWidget {
  final String assetPath;
  final String text;
  final bool isSelected;

  const MyTab(this.assetPath, this.text, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                assetPath,
                color: isSelected ? AppColors.darkRed : Colors.black,
                width: constraints.constrainWidth() * 0.8,
                height: constraints.constrainWidth() * 0.8,
              ),
              const SizedBox(height: 5),
              Text(
                text,
                maxLines: 1,
                style: TextStyle(
                  fontSize: constraints.constrainWidth() * 0.24,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
