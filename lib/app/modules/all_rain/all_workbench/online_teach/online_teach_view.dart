import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'online_teach_logic.dart';

class OnlineTeachPage extends StatefulWidget {
  @override
  _OnlineTeachPageState createState() => _OnlineTeachPageState();
}

class _OnlineTeachPageState extends State<OnlineTeachPage> {
  final logic = Get.find<OnlineTeachLogic>();
  final state = Get.find<OnlineTeachLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyTopBar(
        middle: Text("在线指导", style: AppTS.fontSize22),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<OnlineTeachLogic>();
    super.dispose();
  }
}
