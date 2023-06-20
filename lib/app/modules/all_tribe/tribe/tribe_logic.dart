import 'package:flower/app/data/entity/TribeInfo.dart';
import 'package:flower/app/data/net/api_tribe.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'tribe_state.dart';

class TribeLogic extends GetxController {
  final TribeState state = TribeState();

  void create() {
    debugPrint("create");
  }

  Future<TribeInfo?> getTribeInfo() {
    return ApiTribe.getTribeInfo();
  }
}
