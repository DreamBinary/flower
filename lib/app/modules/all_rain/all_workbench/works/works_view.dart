import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'works_logic.dart';

class WorksPage extends StatefulWidget {
  @override
  _WorksPageState createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  final logic = Get.find<WorksLogic>();
  final state = Get.find<WorksLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyTopBar(
        middle: Text("作品集", style: AppTS.fontSize22),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<WorksLogic>();
    super.dispose();
  }
}