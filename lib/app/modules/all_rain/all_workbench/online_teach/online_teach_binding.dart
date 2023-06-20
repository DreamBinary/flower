import 'package:get/get.dart';

import 'online_teach_logic.dart';

class OnlineTeachBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnlineTeachLogic());
  }
}
