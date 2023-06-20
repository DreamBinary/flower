import 'package:get/get.dart';

import 'village_detail_logic.dart';

class VillageDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VillageDetailLogic());
  }
}
