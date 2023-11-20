import 'dart:convert';

import 'package:flower/app/component/my_header/header_view.dart';
import 'package:flower/app/component/mycard.dart';
import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/data/net/url.dart';
import 'package:flower/app/routes/app_pages.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flower/app/utils/mmkv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'mine_logic.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  final logic = Get.find<MineLogic>();
  final state = Get.find<MineLogic>().state;
  String url = "";

  @override
  void initState() {
    super.initState();
    try {
      url = jsonDecode(MMKVUtil.getString(AppString.USER_DATA))["avatar"];
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: MyTopBar(
            trailing: RawMaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () => {Get.toNamed(Routes.settings)},
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppString.setting, style: AppTS.fontSize16),
              ],
            ),
          ),
        )),
        body: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                HeaderComponent(
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/images/icon.png",
                      image: Url.avatar + url,
                      fit: BoxFit.fill,
                    ),
                    showAdd: true),
                Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                  // todo
                  child: Text(
                    "${AppString.nickname}${jsonDecode(MMKVUtil.getString(AppString.USER_DATA))["nickname"]}",
                    style: AppTS.fontSize16,
                  ),
                ),
                MyCard(const Color(0xfff6f1e6),
                    width: 285.w,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              MyCard(
                                Color(0xffBDA67D),
                                height: 48.h,
                                width: 118.w,
                                child: Text(AppString.myInfo,
                                    style: AppTS.fontSize22
                                        .copyWith(color: Color(0xff743C4B))),
                              ),
                            ],
                          ),
                          MyCard(Color(0xffF6F1E6),
                              height: 156.h,
                              width: 240.w,
                              child: const SizedBox(height: 200, width: 200)),
                          Row(
                            children: [
                              Expanded(
                                  child: MyCard(Color(0xffBDA67D),
                                      height: 170, width: 107, onPressed: () {
                                //todo
                              },
                                      child: Text(AppString.myOrder,
                                          style: AppTS.fontSize20))),
                              Column(
                                children: [
                                  MyCard(Color(0xffF6F1E6),
                                      height: 51.h,
                                      width: 120.w, onPressed: () {
                                    //todo
                                  },
                                      child: Text(AppString.myWork,
                                          style: AppTS.fontSize18)),
                                  MyCard(Color(0xffF6F1E6),
                                      height: 51.h,
                                      width: 120.w, onPressed: () {
                                    //todo
                                  },
                                      child: Text(AppString.mySeed,
                                          style: AppTS.fontSize18)),
                                  MyCard(Color(0xffF6F1E6),
                                      height: 51.h,
                                      width: 120.w, onPressed: () {
                                    //todo
                                  },
                                      child: Text(AppString.myPoint,
                                          style: AppTS.fontSize18))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )),
              ]),
            )));
  }

  @override
  void dispose() {
    Get.delete<MineLogic>();
    super.dispose();
  }
}
