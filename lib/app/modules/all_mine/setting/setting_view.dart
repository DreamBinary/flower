import 'package:animations/animations.dart';
import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/component/showConfirmDialog.dart';
import 'package:flower/app/modules/all_entry/private.dart';
import 'package:flower/app/modules/all_entry/use.dart';
import 'package:flower/app/modules/all_mine/change_info/change_info_logic.dart';
import 'package:flower/app/modules/all_mine/change_info/change_info_view.dart';
import 'package:flower/app/testPage.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'setting_logic.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final logic = Get.find<SettingLogic>();
  final state = Get.find<SettingLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyTopBar(
        backgroundImage: const AssetImage("assets/images/topbar.png"),
        middle: Text(
          AppString.setting,
          style: AppTS.title,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SettingContain(items: [
            SettingItem(
              title: AppString.logout,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
              onTap: () => showConfirmModal(
                context,
                title: AppString.logout,
                content: AppString.logoutConfirm,
                onConfirmTap: logic.logout,
              ),
            ),
            SettingItem(
              title: AppString.deleteUser,
              onTap: () => showConfirmModal(
                context,
                title: AppString.deleteUser,
                content: AppString.logoutConfirm,
                onConfirmTap: logic.deleteUser,
              ),
            ),
            // SettingItem(
            //   title: AppString.changeInfo,
            //   shape: const RoundedRectangleBorder(
            //     borderRadius: BorderRadius.vertical(
            //       bottom: Radius.circular(15),
            //     ),
            //   ),
            //   onTap: () => Get.toNamed(Routes.changeInfo),
            // ),
            SettingItemOpen(
              title: AppString.changeInfo,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
              openBuilder: (_, __) {
                Get.lazyPut(() => ChangeInfoLogic());
                return const ChangeInfoPage();
              },
            ),
          ]),
          SettingContain(items: [
            // SettingItem(
            //   title: AppString.useClause,
            //   shape: const RoundedRectangleBorder(
            //     borderRadius: BorderRadius.vertical(
            //       top: Radius.circular(15),
            //     ),
            //   ),
            //   onTap: () => Get.toNamed(Routes.useClause),
            // ),
            // SettingItem(
            //   title: AppString.privacy,
            //   onTap: () => Get.toNamed(Routes.privacy),
            //   shape: const RoundedRectangleBorder(
            //     borderRadius: BorderRadius.vertical(
            //       bottom: Radius.circular(15),
            //     ),
            //   ),
            // ),
            SettingItemOpen(
              title: AppString.useClause,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
              openBuilder: (_, __) => const UsePage(),
            ),
            SettingItemOpen(
              title: AppString.privacy,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
              openBuilder: (_, __) => const PrivacyPage(),
            ),
          ]),
          // OpenContainer(
          //     closedBuilder: (_, __) => const SettingItem(
          //           title: "test",
          //         ),
          //     openBuilder: (_, __) => TestPage()),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<SettingLogic>();
    super.dispose();
  }
}

class SettingItem extends StatelessWidget {
  final String title;
  final ShapeBorder? shape;
  final GestureTapCallback? onTap;

  const SettingItem({
    Key? key,
    required this.title,
    this.shape,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: shape,
      title: Text(
        title,
        style: AppTS.fontSize20,
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

class SettingItemOpen extends SettingItem {
  final OpenContainerBuilder openBuilder;

  const SettingItemOpen(
      {super.key,
      required super.title,
      super.shape,
      required this.openBuilder});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedElevation: 0,
        closedShape: super.shape ?? const RoundedRectangleBorder(),
        closedBuilder: (context, action) => super.build(context),
        openBuilder: openBuilder);
  }
}

class SettingContain extends StatelessWidget {
  final List<SettingItem> items;
  final List<Widget> children = [];

  SettingContain({required this.items, Key? key}) : super(key: key) {
    for (int i = 0; i < items.length; i++) {
      children.add(items[i]);
      if (i != items.length - 1) {
        children.add(
          const Divider(
            height: 0,
            indent: 10,
            endIndent: 10,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: children,
      ),
    );
  }
}
