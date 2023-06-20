import 'package:flower/app/data/net/api_user.dart';
import 'package:flower/app/utils/toast.dart';
import 'package:get/get.dart';

import 'change_info_state.dart';

class ChangeInfoLogic extends GetxController {
  final ChangeInfoState state = ChangeInfoState();

  changeInfo() async {
    bool result = await ApiUser.changeInfo(
        nickname: state.nicknameCtrl.text, passwd: state.passwordCtrl.text);
    if (result) {
      ToastUtil.showToast("修改成功");
    } else {
      ToastUtil.showToast("修改失败");
    }
  }
}
