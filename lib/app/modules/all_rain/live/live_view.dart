import 'package:auto_animated/auto_animated.dart';
import 'package:badges/badges.dart';
import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'live_logic.dart';

class LivePage extends StatefulWidget {
  @override
  _LivePageState createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  final logic = Get.find<LiveLogic>();
  final state = Get.find<LiveLogic>().state;

  var data = [
    {
      "livePath": "assets/images/live0.png",
      "avatarPath": "assets/images/live0_ava.png",
      "title": "年画小课堂，欢迎大家",
      "name": "张师傅",
      "person": "25"
    },
    {
      "livePath": "assets/images/live1.png",
      "avatarPath": "assets/images/live1_ava.png",
      "title": "根雕直播，请大家多多关注",
      "name": "王师傅",
      "person": "11"
    },
    {
      "livePath": "assets/images/live2.png",
      "avatarPath": "assets/images/live2_ava.png",
      "title": "皮影戏直播",
      "name": "张师傅",
      "person": "77"
    },
    {
      "livePath": "assets/images/live3.png",
      "avatarPath": "assets/images/live3_ava.png",
      "title": "福州软木画，欢迎大家",
      "name": "李师傅",
      "person": "50"
    },
    {
      "livePath": "assets/images/live4.jpg",
      "avatarPath": "assets/images/live4_ava.png",
      "title": "在线欣赏闽剧",
      "name": "谢师傅",
      "person": "137"
    },
    {
      "livePath": "assets/images/live5.jpg",
      "avatarPath": "assets/images/live5_ava.jpg",
      "title": "和我一起学习制作软木画",
      "name": "郑师傅",
      "person": "24"
    },
    {
      "livePath": "assets/images/live6.jpg",
      "avatarPath": "assets/images/live6_ava.jpg",
      "title": "木匠的日常生活",
      "name": "高师傅",
      "person": "56"
    },
    {
      "livePath": "assets/images/live7.jpg",
      "avatarPath": "assets/images/live7_ava.jpg",
      "title": "软木画雕刻要点",
      "name": "陈师傅",
      "person": "79"
    },
    {
      "livePath": "assets/images/live8.jpg",
      "avatarPath": "assets/images/live8_ava.jpg",
      "title": "无声的诗，立体的画",
      "name": "林师傅",
      "person": "111"
    },
    {
      "livePath": "assets/images/live9.png",
      "avatarPath": "assets/images/live9_ava.jpg",
      "title": "寿山石雕的制作",
      "name": "王师傅",
      "person": "33"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyTopBar(
        backgroundImage: const AssetImage("assets/images/topbar.png"),
        middle: Text(
          AppString.live,
          style: AppTS.title,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // todo
          await Future.delayed(const Duration(seconds: 2));
        },
        child: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
            child: LiveGrid.options(
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                return LiveItem(
                  livePath: data[index]["livePath"] ?? "",
                  avatarPath: data[index]["avatarPath"] ?? "",
                  title: data[index]["title"] ?? "",
                  name: data[index]["name"] ?? "",
                  person: data[index]["person"] ?? "",
                  animation: animation,
                );
              },
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 170 / 300,
              ),
              itemCount: data.length,
              physics: const BouncingScrollPhysics(),
              options: const LiveOptions(
                showItemInterval: Duration(milliseconds: 100),
                showItemDuration: Duration(milliseconds: 200),
              ),
            ),
            // child: GridView.builder(
            // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //   maxCrossAxisExtent: 200,
            //   mainAxisSpacing: 10,
            //   crossAxisSpacing: 10,
            //   childAspectRatio: 170 / 300,
            // ),
            //   physics: const BouncingScrollPhysics(),
            //   itemCount: data.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     return LiveItem(
            //       livePath: data[index]["livePath"] ?? "",
            //       avatarPath: data[index]["avatarPath"] ?? "",
            //       title: data[index]["title"] ?? "",
            //       name: data[index]["name"] ?? "",
            //       person: data[index]["person"] ?? "",
            //     );
            //   },
            // ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<LiveLogic>();
    super.dispose();
  }
}

class LiveItem extends StatelessWidget {
  final String livePath;
  final String avatarPath;
  final String title;
  final String person;
  final String name;
  final bool isLiving;
  final Animation<double> animation;

  const LiveItem(
      {required this.livePath,
      required this.avatarPath,
      required this.title,
      required this.person,
      required this.name,
      required this.animation,
      this.isLiving = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(animation),
        child: LayoutBuilder(
          builder: (_, constraint) => Badge(
            badgeColor: AppColors.darkYellow,
            shape: BadgeShape.square,
            borderRadius: BorderRadius.circular(20),
            position: BadgePosition.topEnd(top: 10, end: 10),
            badgeContent: Text(
              "直播中",
              style:
                  TextStyle(fontSize: constraint.constrainHeight() * 15 / 300),
            ),
            showBadge: isLiving,
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: AppColors.darkYellow, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      livePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Divider(
                    color: AppColors.darkYellow,
                    height: 0,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: constraint.constrainHeight() * 15 / 300),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 10),
                      Container(
                        width: constraint.constrainHeight() * 20 / 300,
                        height: constraint.constrainHeight() * 20 / 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(avatarPath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(name,
                          style: TextStyle(
                              fontSize:
                                  constraint.constrainHeight() * 12 / 300)),
                      const Expanded(child: SizedBox()),
                      Icon(
                        Icons.remove_red_eye_sharp,
                        color: AppColors.darkYellow,
                        size: constraint.constrainHeight() * 20 / 300,
                      ),
                      const SizedBox(width: 5),
                      Text(person,
                          style: TextStyle(
                              fontSize: constraint.constrainHeight() * 12 / 300,
                              color: AppColors.darkYellow)),
                      const SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: constraint.constrainHeight() * 5 / 300)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
