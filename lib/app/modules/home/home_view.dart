import 'dart:convert';

import 'package:flower/app/component/my_header/header_view.dart';
import 'package:flower/app/data/net/url.dart';
import 'package:flower/app/routes/app_pages.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/utils/mmkv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_text_theme.dart';
import 'home_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;
  String url = "";
  String nickname = "";

  @override
  void initState() {
    super.initState();
    var json = jsonDecode(MMKVUtil.getString(AppString.USER_DATA));
    nickname = json["nickname"];
    try {
      url = json["avatar"];
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_home.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        left: 95,
                        child: Container(
                          width: 160.w,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50)),
                              color: AppColors.homeButton),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              nickname,
                              style: AppTS.fontSize20,
                            ),
                          ),
                        )),
                    HeaderComponent(
                      child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/icon.png",
                        image: Url.avatar + url,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 75,
                  width: 75,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/btn_rain_value.png")),
                  ),
                  child: RawMaterialButton(
                    onPressed: () => {
                      precacheImage(
                          const AssetImage("assets/images/rain.png"), context),
                      Get.toNamed(Routes.rain)
                    },
                    shape: const CircleBorder(),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            top: 15,
                            right: 15,
                            child: Text(
                              "50",
                              style: AppTS.fontSize20Bold,
                            )),
                        Positioned(
                            bottom: 12,
                            child: Text("雨露值", style: AppTS.fontSize16))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  @override
  void dispose() {
    Get.delete<HomeLogic>();
    super.dispose();
  }
}
// Column
// (
//   children: [
//     ElevatedButton(
//       onPressed: () {
//         Get.toNamed(Routes.mine);
//       },
//       child: Text("我的"),
//     ),
//     ElevatedButton(
//       onPressed: () {
//         showDialog(
//             context: context,
//             builder: (context) => MyDialog(title: "知识果", children: [
//                   Container(
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.rectangle,
//                       borderRadius:
//                           BorderRadius.all(Radius.circular(13)),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Column(children: [
//                         Text("asdfasdf"),
//                         Text("asdfasdf"),
//                         Text("asdfasdf"),
//                         Text("asdfasdf"),
//                         Text("asdfasdf")
//                       ]),
//                     ),
//                   ),
//                 ]));
//       },
//       child: Text("弹窗"),
//     ),
//   ],
// ),
