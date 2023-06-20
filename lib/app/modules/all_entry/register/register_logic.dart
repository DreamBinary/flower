import 'package:flower/app/component/my_header/header_logic.dart';
import 'package:flower/app/component/my_header/header_state.dart';
import 'package:flower/app/data/net/api_user.dart';
import 'package:flower/app/modules/all_entry/login/login_logic.dart';
import 'package:flower/app/modules/all_entry/login/login_state.dart';
import 'package:flower/app/routes/app_pages.dart';
import 'package:flower/app/utils/toast.dart';
import 'package:get/get.dart';

import 'register_state.dart';

class RegisterLogic extends GetxController {
  final RegisterState state = RegisterState();
  final LoginState stateLogin = Get.find<LoginLogic>().state;
  final HeaderState stateHeader = Get.find<HeaderLogic>().state;

  register() async {
    String username = stateLogin.usernameCtrl.text.trim();
    String password = stateLogin.passwordCtrl.text.trim();
    String verify = state.verifyCtrl.text.trim();
    String verifyPassword = state.verifyPasswordCtrl.text.trim();
    String path = stateHeader.path;

    if (password.isEmpty) {
      ToastUtil.showToast("密码不能为空");
      return;
    }
    if (verifyPassword != password) {
      ToastUtil.showToast("两次密码不一致");
      return;
    }
    bool isSuccess = await ApiUser.signUp(username, password, verify, path);
    if (isSuccess) {
      Get.offNamed(Routes.login);
    }
  }
}
