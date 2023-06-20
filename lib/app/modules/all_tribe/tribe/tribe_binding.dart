import 'package:get/get.dart';

import 'tribe_logic.dart';

class TribeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TribeLogic());
  }
}
