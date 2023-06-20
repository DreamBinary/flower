import 'package:get/get.dart';

import 'point_exchange_logic.dart';

class PointExchangeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PointExchangeLogic());
  }
}
