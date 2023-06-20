import 'package:flower/app/component/my_header/header_logic.dart';
import 'package:flower/app/modules/all_cultivate/cultivate/cultivate_logic.dart';
import 'package:flower/app/modules/all_mine/mine/mine_logic.dart';
import 'package:flower/app/modules/all_rain/all_workbench/work_bench/work_bench_logic.dart';
import 'package:flower/app/modules/all_rain/rain/rain_logic.dart';
import 'package:flower/app/modules/all_rain/rain/rain_view.dart';
import 'package:flower/app/modules/all_tribe/tribe/tribe_logic.dart';
import 'package:flower/app/modules/all_village/village/village_logic.dart';

import 'package:flower/app/modules/home/home_logic.dart';
import 'package:get/get.dart';

import 'route_logic.dart';

class RouteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RouteLogic());
    Get.lazyPut(() => HomeLogic(), fenix: true);
    Get.lazyPut(() => CultivateLogic(), fenix: true);
    Get.lazyPut(() => VillageLogic(), fenix: true);
    Get.lazyPut(() => TribeLogic(), fenix: true);
    Get.lazyPut(() => MineLogic(), fenix: true);
    Get.lazyPut(() => HeaderLogic(), fenix: true);
    Get.lazyPut(() => RainLogic(), fenix: true);
  }
}
