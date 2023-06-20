import 'package:get/get.dart';

import 'works_logic.dart';

class WorksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WorksLogic());
  }
}
