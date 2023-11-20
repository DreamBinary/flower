import 'package:flower/app/component/dot_indicator.dart';
import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'buy_logic.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> with SingleTickerProviderStateMixin {
  final logic = Get.find<BuyLogic>();
  final state = Get.find<BuyLogic>().state;
  late final TabController _tabCtrl = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyTopBar(
        middle: Text(AppString.buyPage, style: AppTS.fontSize22),
      ),
      body: TabBarView(
        controller: _tabCtrl,
        physics: const BouncingScrollPhysics(),
        children: [
          BrowsePage(),
          const Center(
            child: Text("购物车"),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15, top: 5),
        child: TabBar(
          controller: _tabCtrl,
          indicatorColor: AppColors.buyDotIndicator,
          indicator: const DotIndicator(),
          labelColor: Colors.black,
          onTap: (index) => {_tabCtrl.animateTo(index)},
          tabs: [
            Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(AppString.buyBottom0, style: AppTS.fontSize22)),
            Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(AppString.buyBottom1, style: AppTS.fontSize22)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<BuyLogic>();
    super.dispose();
  }
}

class BrowsePage extends StatelessWidget {
  final List titles = [
    AppString.buyTitle1,
    AppString.buyTitle2,
    AppString.buyTitle3,
  ];
  final imagePath = [
    [
      "assets/images/buy0.png",
      "assets/images/buy1.png",
      "assets/images/buy6.jpg",
      "assets/images/buy7.jpg",
      "assets/images/buy8.jpg",
      "assets/images/buy9.jpg"
    ],
    ["assets/images/buy2.png", "assets/images/buy3.png"],
    ["assets/images/buy4.png", "assets/images/buy5.png"],
  ];

  BrowsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        expandedHeight: 200.h,
        toolbarHeight: 0,
        flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
          "assets/images/bg_buy_page.png",
          fit: BoxFit.cover,
        )),
      ),
      SliverList(
        delegate: SliverChildListDelegate(titles
            .asMap()
            .map((key, value) =>
                MapEntry(key, BuyRow(value, imagePath[key], key != 0)))
            .values
            .toList()),
      ),
    ]);
  }
}

class BuyRow extends StatelessWidget {
  final String title;
  final List<String> items;
  final bool hasDivider;

  const BuyRow(this.title, this.items, this.hasDivider, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          hasDivider
              ? const Divider(
                  height: 1,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                )
              : const SizedBox(),
          Padding(
            padding:
                const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
            child: Row(
              children: [
                Text(
                  title,
                  style: AppTS.fontSize20,
                ),
                const Spacer(),
                Text(
                  "更多",
                  style: AppTS.fontSize18,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                )
              ],
            ),
          ),
          SizedBox(
            height: 90.h + 20,
            child: ListView.separated(
              padding: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(color: AppColors.darkYellow, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                clipBehavior: Clip.hardEdge,
                elevation: 10,
                child: SizedBox(
                  height: 90.h,
                  width: 145.w,
                  child: Image.asset(
                    items[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 50),
            ),
          )
        ],
      ),
    );
  }
}
