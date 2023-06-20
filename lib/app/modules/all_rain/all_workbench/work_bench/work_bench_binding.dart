import 'package:get/get.dart';

import 'work_bench_logic.dart';

class WorkBenchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WorkBenchLogic(), fenix: true);
  }
}
