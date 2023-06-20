import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/component/next_page_row.dart';
import 'package:flower/app/component/round_contain.dart';
import 'package:flower/app/data/net/api_teach.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_text_theme.dart';
import 'teach_logic.dart';

class TeachPage extends StatefulWidget {
  const TeachPage({Key? key}) : super(key: key);

  @override
  _TeachPageState createState() => _TeachPageState();
}

class _TeachPageState extends State<TeachPage> {
  final logic = Get.find<TeachLogic>();
  final state = Get.find<TeachLogic>().state;
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyTopBar(
        backgroundImage: const AssetImage("assets/images/topbar.png"),
        middle: Text(AppString.teach, style: AppTS.title),
      ),
      body: FutureBuilder(
        future: ApiTeach.getTeachInfo(currentPage),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                const RoundContain(padding: null),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40, bottom: 50, right: 70, left: 30),
                  child: snapshot.data!.isNotEmpty
                      ? Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TeachInfo(
                                title: snapshot.data![0]['title'],
                                place: snapshot.data![0]['place'],
                                time: "  " +
                                    snapshot.data![0]['beginTime'] +
                                    "\n" +
                                    "       ~~" +
                                    snapshot.data![0]['endTime'],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              flex: 1,
                              child: TeachInfo(
                                title: snapshot.data![1]['title'],
                                place: snapshot.data![1]['place'],
                                time: "  " +
                                    snapshot.data![1]['beginTime'] +
                                    "\n" +
                                    "       ~~" +
                                    snapshot.data![1]['endTime'],
                              ),
                            )
                          ],
                        )
                      : Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("没有更多啦", style: AppTS.fontSize24),
                              MyBackButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      currentPage--;
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: NextPageRow(
        onPressed: () {
          setState(
            () {
              currentPage++;
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<TeachLogic>();
    super.dispose();
  }
}

class TeachInfo extends StatelessWidget {
  final String title;
  final String place;
  final String time;
  final VoidCallback? onPressed;

  const TeachInfo(
      {required this.title,
      required this.place,
      required this.time,
      this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 40,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: LayoutBuilder(
        builder: (_, constraints) => RoundContain(
          height: constraints.constrainHeight(),
          width: constraints.constrainWidth(),
          margin: null,
          color: AppColors.darkYellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                "主题 : " + title,
                style: AppTS.fontSize26.copyWith(color: Colors.white),
              ),
              Text(
                "地点 : " + place,
                style: AppTS.fontSize22.copyWith(color: AppColors.darkRed0),
              ),
              Text(
                "开放时间 : \n" + time,
                style: AppTS.fontSize22.copyWith(color: AppColors.darkRed0),
              ),
              LimitedBox(
                maxHeight: 40,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(AppColors.darkRed0),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                    fixedSize: MaterialStatePropertyAll(
                        Size.fromWidth(double.maxFinite)),
                  ),
                  onPressed: onPressed,
                  child: Text("预约详情",
                      style: AppTS.fontSize20.copyWith(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
