import 'package:get/get.dart';

import 'teach_logic.dart';

class TeachBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeachLogic());
  }
}
