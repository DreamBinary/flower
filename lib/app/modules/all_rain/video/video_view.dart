import 'dart:ui';

import 'package:chewie/chewie.dart';
import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/component/next_page_row.dart';
import 'package:flower/app/component/round_contain.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'video_logic.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final logic = Get.find<VideoLogic>();
  final state = Get.find<VideoLogic>().state;
  final videoItems = Colors.primaries;
  final _pageCtrl = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyTopBar(
        backgroundImage: const AssetImage("assets/images/topbar.png"),
        middle: Text(AppString.video, style: AppTS.title),
      ),
      body: PageView.builder(
          controller: _pageCtrl,
          itemCount: videoItems.length,
          itemBuilder: (context, index) {
            return const VideoItem(
              // url:
              //     "https://v.api.aa1.cn/api/api-fj/video/00${Random().nextInt(89) + 10}.mp4%E5%AE%98%E7%BD%91api.aa1.cn%E5%85%8D%E8%B4%B9%E8%A7%86%E9%A2%91API.mp4",
              url: "assets/video/video.mp4",
            );
          }),
      bottomNavigationBar: NextPageRow(
        onPressed: () {
          _pageCtrl.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceInOut);
        },
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<VideoLogic>();
    super.dispose();
  }
}

class VideoItem extends StatefulWidget {
  const VideoItem({required this.url, Key? key}) : super(key: key);
  final String url;

  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late final VideoPlayerController _videoCtrl =
      // VideoPlayerController.network(widget.url);
      VideoPlayerController.asset(widget.url);
  late final ChewieController _chewieCtrl = ChewieController(
    videoPlayerController: _videoCtrl,
    // aspectRatio: _videoCtrl.value.aspectRatio,
    // showControls: false,
    zoomAndPan: true,
    autoInitialize: true,
    showOptions: false,
    autoPlay: true,
    looping: true,
  );

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.url);
    return RoundContain(
      color: AppColors.darkYellow.withAlpha(100),
      padding: null,
      child: FutureBuilder(
        future: _videoCtrl.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                IgnorePointer(child: Chewie(controller: _chewieCtrl)),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 50, sigmaY:100),
                  child: Chewie(controller: _chewieCtrl),
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _videoCtrl.dispose();
    _chewieCtrl.dispose();
    super.dispose();
  }
}
