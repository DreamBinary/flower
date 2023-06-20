import 'package:get/get.dart';

import 'travel_logic.dart';

class TravelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TravelLogic());
  }
}
