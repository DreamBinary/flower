import 'package:get/get.dart';

import 'buy_logic.dart';

class BuyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BuyLogic());
  }
}
