import 'package:flower/app/component/mydialog.dart';
import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/data/entity/TribeInfo.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tribe_logic.dart';

class TribePage extends StatefulWidget {
  const TribePage({super.key});

  @override
  _TribePageState createState() => _TribePageState();
}

class _TribePageState extends State<TribePage> {
  final logic = Get.find<TribeLogic>();
  final state = Get.find<TribeLogic>().state;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyTopBar(
        backgroundImage: const AssetImage("assets/images/topbar.png"),
        middle: Text(AppString.tribePage, style: AppTS.title),
        trailing: Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          child: PopupMenuButton(
            icon: const Icon(Icons.add_circle_outline),
            splashRadius: 24,
            offset: Offset(0, const MyTopBar().preferredSize.height),
            itemBuilder: (itemContext) {
              return [
                PopupMenuItem(
                  child: const Text("创建部落"),
                  onTap: () => {
                    WidgetsBinding.instance.addPostFrameCallback(
                        (_) => createTribe(context, logic.create)),
                  },
                ),
                const PopupMenuItem(child: Text("加入部落")),
                const PopupMenuItem(child: Text("我的部落")),
              ];
            },
          ),
        ),
      ),
      body: FutureBuilder(
        future: logic.getTribeInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return ExistTribe(tribeInfo: snapshot.data!);
            } else {
              return NoTribe(
                onPressed: () {},
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<TribeLogic>();
    super.dispose();
  }
}

void createTribe(BuildContext context, VoidCallback onPressed) {
  showDialog(
    context: context,
    builder: (_) => ScrollDialog(
      title: "创建部落",
      children: [
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.darkYellow, width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "部落名称",
                  style: AppTS.fontSize20.copyWith(
                    color: AppColors.darkRed,
                  ),
                ),
                const SizedBox(height: 5),
                const TribeTextField(hintText: "请输入部落名称"),
                const SizedBox(height: 10),
                Text("部落简介",
                    style: AppTS.fontSize20.copyWith(color: AppColors.darkRed)),
                const SizedBox(height: 5),
                const TribeTextField(hintText: "请输入部落简介", maxLines: 9),
              ],
            ),
          ),
        )
      ],
      bgPath: 'assets/images/bg_dialog0.png',
      onPressed: onPressed,
    ),
  );
}

class NoTribe extends StatelessWidget {
  final VoidCallback onPressed;

  const NoTribe({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => createTribe(context, onPressed),
      child: LayoutBuilder(
        builder: (_, constraints) => Container(
          height: constraints.constrainHeight(),
          width: constraints.constrainWidth(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_tribe0.png"),
              alignment: Alignment.center,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(200),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 100,
                    color: AppColors.darkRed,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: AppColors.primarySwatch[900],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "你还没有创建或加入\n部落哦，快来试试吧~",
                    style: AppTS.fontSize18.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExistTribe extends StatelessWidget {
  final TribeInfo tribeInfo;

  const ExistTribe({required this.tribeInfo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => ScrollDialog(
            title: "部落详情",
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/images/icon.png")),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("部落名称 : 木雕爱好小队",
                          style: AppTS.fontSize16
                              .copyWith(color: AppColors.darkRed)),
                      const SizedBox(height: 5),
                      Text("部落简介 : 探索木雕的小白",
                          maxLines: 1,
                          style: AppTS.fontSize14
                              .copyWith(color: AppColors.darkRed)),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "部落成员",
                    style: AppTS.fontSize16.copyWith(color: AppColors.darkRed),
                  )
                ],
              ),
              Image.asset(
                "assets/images/member.png",
                fit: BoxFit.fill,
              )

              // LayoutBuilder(
              //   builder: (_, constraints) {
              //     var width = constraints.constrainWidth() / 2.1;
              //     var height = width + width / 5;
              //     return Wrap(
              //       children: tribeInfo.members
              //           .map((user) => SizedBox(
              //                 width: width,
              //                 height: height,
              //                 child: ImageNameItem(
              //                     size: constraints.constrainWidth() / 2.1,
              //                     name: user.nickname ?? "",
              //                     image: NetworkImage(user.avatar == null
              //                         ? Url.avatar
              //                         : Url.avatar + user.avatar!),
              //                     color: Colors.grey),
              //               ))
              //           .toList(),
              //     );
              //   },
              // ),
            ],
            bgPath: 'assets/images/bg_dialog2.png',
          ),
        );
      },
      child: Center(child: Image.asset("assets/images/bg_tribe1.png")),
    );
  }
}

class TribeMember extends StatelessWidget {
  const TribeMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TribeTextField extends StatelessWidget {
  final String? hintText;
  final int maxLines;

  const TribeTextField({this.hintText, this.maxLines = 1, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => TextField(
        decoration: InputDecoration(
          constraints: constraints,
          fillColor: AppColors.background,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.darkRed,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          hintText: hintText,
        ),
        maxLines: maxLines,
      ),
    );
  }
}
