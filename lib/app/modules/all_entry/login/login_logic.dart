import 'package:flower/app/data/net/api_user.dart';
import 'package:flower/app/routes/app_pages.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/utils/mmkv.dart';
import 'package:flower/app/utils/toast.dart';
import 'package:get/get.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  login(Function shake) async {
    String username = state.usernameCtrl.text.trim();
    String password = state.passwordCtrl.text.trim();

    // TODO
    if (username == "admin" && password == "admin") {
      ToastUtil.showToast("登录成功");
      MMKVUtil.put(AppString.USERNAME, username);
      MMKVUtil.put(AppString.IS_LOGIN, true);
      Get.offAllNamed(Routes.routePage);
      return;
    }

    if (username.length != 11) {
      ToastUtil.showToast("请输入正确的手机号");
      return;
    }
    if (password.isEmpty) {
      ToastUtil.showToast("密码不能为空");
      return;
    }
    if (state.checkUseAndPrivate.value == false) {
      shake();
      ToastUtil.showToast("请勾选使用条款和隐私政策");
      return;
    }
    bool isSuccess = await ApiUser.login(username, password);
    if (isSuccess) {
      ToastUtil.showToast("登录成功");
      MMKVUtil.put(AppString.USERNAME, username);
      MMKVUtil.put(AppString.IS_LOGIN, true);
      Get.offAllNamed(Routes.routePage);
    } else {
      ToastUtil.showToast("登录失败");
    }
  }

  sendSms() async {
    var username = state.usernameCtrl.text.trim();
    if (username.length != 11) {
      ToastUtil.showToast("请输入正确的手机号");
      return;
    }
    var isSuccess = await ApiUser.sendSms(username);
    if (!isSuccess) {
      ToastUtil.showToast("请再次发送");
    }
  }
}
