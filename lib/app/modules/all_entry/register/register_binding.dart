import 'package:flower/app/component/my_header/header_logic.dart';
import 'package:flower/app/modules/all_entry/login/login_logic.dart';
import 'package:get/get.dart';

import 'register_logic.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterLogic());
    Get.lazyPut(() => LoginLogic());
    Get.lazyPut(() => HeaderLogic());
  }
}
