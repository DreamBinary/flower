import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/component/next_page_row.dart';
import 'package:flower/app/component/round_contain.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'travel_logic.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  final logic = Get.find<TravelLogic>();
  final state = Get.find<TravelLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyTopBar(
        backgroundImage: const AssetImage("assets/images/topbar.png"),
        middle: Text(AppString.travel, style: AppTS.title),
      ),
      body: TravelItem(
        title: "三坊七巷",
        place: "福州软木画馆",
        info:
            "20世纪初，软木画这项蜚声海内外的技艺就是发源于此，随着软木画作品《天安门》,《北京万寿山》《颐和园》等在全国摘金夺魁，一大批软木画大师享誉大江南北，软木画走进了那个年代千家万户的生活中。",
        imagePath: "assets/images/btn_border_bg.png",
      ),
      bottomNavigationBar: const NextPageRow(),
    );
  }

  @override
  void dispose() {
    Get.delete<TravelLogic>();
    super.dispose();
  }
}

class TravelItem extends StatelessWidget {
  final String title;
  final String place;
  final String info;
  final String imagePath;
  final VoidCallback? onPressed;

  const TravelItem(
      {required this.title,
      required this.place,
      required this.info,
      required this.imagePath,
      this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => RoundContain(
        height: constraints.constrainHeight(),
        width: constraints.constrainWidth(),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  opacity: 0.8,
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill,
                ),
              ),
              child: Text(title,
                  style: AppTS.fontSize22.copyWith(color: AppColors.darkRed0)),
            ),
            const SizedBox(height: 5),
            Text(
              "相关游地 : " + title,
              style: AppTS.fontSize24.copyWith(color: AppColors.darkRed0),
            ),
            const SizedBox(height: 5),
            Text(
              "简介 : " + info,
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style: AppTS.fontSize24
                  .copyWith(color: AppColors.darkRed0, height: 1.2),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/content_traval.png"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.darkRed, width: 2),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: OutlinedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.darkRed0, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "前往此地",
                  style: AppTS.fontSize22.copyWith(color: AppColors.darkRed0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
