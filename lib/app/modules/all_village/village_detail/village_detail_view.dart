import 'package:chewie/chewie.dart';
import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'village_detail_logic.dart';

class VillageDetailPage extends StatefulWidget {
  const VillageDetailPage({Key? key}) : super(key: key);

  @override
  _VillageDetailPageState createState() => _VillageDetailPageState();
}

class _VillageDetailPageState extends State<VillageDetailPage> {
  final logic = Get.find<VillageDetailLogic>();
  final state = Get.find<VillageDetailLogic>().state;
  late final VideoPlayerController _videoCtrl =
      VideoPlayerController.asset("assets/video/video.mp4");
  late final ChewieController _chewieCtrl = ChewieController(
    videoPlayerController: _videoCtrl,
    aspectRatio: 3 / 2,
    autoInitialize: true,
    showOptions: false,
    autoPlay: true,
    looping: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyTopBar(
        backgroundImage: const AssetImage("assets/images/topbar.png"),
        middle: Text(Get.arguments.toString(), style: AppTS.title),
      ),
      body: SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.black),
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: _MyDelegate("视频介绍"),
                pinned: true,
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                sliver: SliverToBoxAdapter(
                  child: AspectRatio(
                      aspectRatio: 3 / 2,
                      child: Chewie(controller: _chewieCtrl)),
                ),
              ),
              SliverPersistentHeader(
                delegate: _MyDelegate("图文介绍"),
                pinned: true,
              ),
              workPicIntro()
            ],
          ),
        ),
      ),
    );
  }

  SliverPadding workPicIntro() {
    return SliverPadding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      sliver: SliverList(
        delegate: SliverChildListDelegate(const [
          WordIntro(title: "软木画介绍", contents: """
        软木画，又称软木雕、木画。中国传统民间雕刻工艺品，主要产于福建福州。
        它是一种“雕”、“画”结合的手工艺品。其色调纯朴，刻工精细，形象逼真，善于再现中国古代亭台楼阁、园林景色，使人观后如身临其境。
        软木画运用浮雕、圆雕、透雕等技法，精雕细镂成花草树木亭台楼阁、栈桥船舫和人物。再用通草作成白鹤、孔雀、糜鹿等鸟兽，根据画面设计，粘在衬纸上，配制成立体、半立体的木画，装在玻璃框里，就成了独具一格的艺术品。其中借鉴中国园林“框景”的手法，构图新颖别致，画面层次分明，色彩古朴典雅，有着“东方艺术珍品第一奇画”的美誉。
              """),
          PictureIntro("assets/images/detail0.jpg"),
          WordIntro(title: "软木画发展", contents: """
        软木画产生于公元一九一四年，由民间艺人吴启琪首创。清末民国年间，福建巡按使许世英将自己喜欢的由德国印制的一张柔韧轻巧的木质贺年片交给所内总传习师陈春润希望能予以仿制。这种天然适合雕刻的木头给了福州木雕艺人吴启棋等人很大的启发。经苦苦寻找后他们终于确定，这种木头是来自地中海沿岸的栓皮栎，名贵葡萄酒的瓶塞就出自此种材料。于是陈春润召集福州木雕名师吴启琪、郑立溪等潜心研制，运用福州传统木雕技艺，以刀代笔，雕镂结合，创制出了软木画。吴启琪创制软木画成功后，回乡传艺授徒，木画生产成为西园村的支柱产业。
        上世纪70~80年代， 是软木画百年发展史上的黄金时代。大量涌入的国外订单，让软木画一度成为福州外贸出口的支柱产业，上万人投身这行，很多甚至是农闲时的农民。产品出口六十多个国家和地区，出口产值高达5000万元以上，是上世纪八十年代福建省外贸出口创汇率最高的产品之一。当时，在软木画的发祥地西园村，只要会拿筷子的小孩，就能帮着大人粘贴树叶。用一句话说，便是家家从事木画业，人人运刀雕软木。
              """),
          PictureIntro("assets/images/detail1.jpg"),
          WordIntro(title: "衰落与思考", contents: """
        90年代中期，软木画厂受国企改制的风潮的影响，大师封刀，人员下岗。1999年福州软木画厂宣布倒闭。从事软木画行业的人也从15000人跌至不足百人。如今，在软木画艺人聚集的西园村，坚守着这门手艺的艺人也不超过四十人，且大多年龄都在六七十岁。2008年软木画入选第二批国家级非物质文化遗产名录，销售额有所回升。但由于软木画用的原材料栓皮栎树生长成材需9年，这些年软木画的过量生产使树的原料价格翻了几十倍，市场却缩水了百分之九十等原因，软木画的处境还是十分艰难。
        拯救、复兴、传承、发展软木画不能只是工艺美术界关注的焦点，社会各界都应行动起来，确保非物质文化遗产的持续发展性。
              """),
          PictureIntro("assets/images/detail2.jpg"),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<VillageDetailLogic>();
    super.dispose();
  }
}

class _MyDelegate extends SliverPersistentHeaderDelegate {
  final String title;

  _MyDelegate(this.title);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: AppColors.primary..withAlpha(120),
        height: 45.h,
        child: FittedBox(child: Text(title)));
  }

  @override
  double get maxExtent => 45.h;

  @override
  double get minExtent => 45.h;

  @override
  bool shouldRebuild(covariant _MyDelegate oldDelegate) {
    return oldDelegate.title == title;
  }
}

class PictureIntro extends StatelessWidget {
  final String imagePath;

  const PictureIntro(this.imagePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => Image.asset(
        imagePath,
        height: constraints.constrainWidth() * 2 / 3,
        width: constraints.constrainWidth(),
        fit: BoxFit.cover,
      ),
    );
  }
}

class WordIntro extends StatelessWidget {
  final String title;
  final String contents;

  const WordIntro({required this.title, required this.contents, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: AppTS.fontSize22.copyWith(
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
        Text(
          contents,
          style: AppTS.fontSize18.copyWith(letterSpacing: 0.5),
        ),
      ],
    );
  }
}
