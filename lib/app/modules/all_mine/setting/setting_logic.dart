import 'package:flower/app/data/net/api_user.dart';
import 'package:flower/app/routes/app_pages.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/utils/mmkv.dart';
import 'package:flower/app/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'setting_state.dart';

class SettingLogic extends GetxController {
  final SettingState state = SettingState();

  void logout() {
    try {
      ApiUser.logout();
      MMKVUtil.clear();
      MMKVUtil.put(AppString.IS_INTRO, true);
    } catch (e) {
      debugPrint(e.toString());
      return;
    }
    Get.offAllNamed(Routes.login);
    ToastUtil.showToast("退出成功");
  }

  void deleteUser() {
    try {
      ApiUser.deleteUser();
      MMKVUtil.clear();
      // MMKVUtil.put(AppString.IS_INTRO, true);
    } catch (e) {
      debugPrint(e.toString());
      return;
    }
    Get.offAllNamed(Routes.login);
    ToastUtil.showToast("注销成功");
  }
}
