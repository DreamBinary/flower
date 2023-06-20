import 'package:flower/app/routes/app_pages.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/utils/mmkv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  IntroScreenCustomTabState createState() => IntroScreenCustomTabState();
}

class IntroScreenCustomTabState extends State<IntroPage> {
  // List<Slide> slides = [];
  List<String> imagePath = [
    "assets/images/intro0.png",
    "assets/images/intro1.png",
    "assets/images/intro2.png",
    "assets/images/intro3.png",
    "assets/images/intro4.png",
    "assets/images/intro5.png",
  ];

  late Function goToTab;

  @override
  void initState() {
    super.initState();
    // slides.add(
    //   Slide(
    //     pathImage: "assets/images/intro0.png",
    //   ),
    // );
    // slides.add(
    //   Slide(
    //     backgroundImage: "assets/images/intro0.png",
    //   ),
    // );
    // slides.add(
    //   Slide(
    //     backgroundImage: "assets/images/intro0.png",
    //
    //   ),
    // );
  }

  // void onTabChangeCompleted(index) {
  //   log("onTabChangeCompleted, index: $index");
  // }

  void onDonePress() {
    Get.offAllNamed(Routes.login);
    MMKVUtil.put(AppString.IS_INTRO, true);
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0xfff0ece1)),
      overlayColor: MaterialStateProperty.all<Color>(const Color(0xffE8DBBE)),
    );
  }

  List<Widget> renderListCustomTabs() {
    return List.generate(
      imagePath.length,
      (index) => Image.asset(
        imagePath[index],
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return IntroSlider(
      // Slides
      // slides: slides,
      backgroundColorAllSlides: Colors.white,

      // Skip button
      // renderSkipBtn: const Icon(
      //   Icons.skip_next,
      //   color: Color(0xffffcc5c),
      // ),
      // skipButtonStyle: myButtonStyle(),
      // onSkipPress: () => {},
      showSkipBtn: false,
      // Prev button
      renderPrevBtn: const Icon(
        Icons.navigate_before,
        color: Color(0xffffcc5c),
        size: 35.0,
      ),
      prevButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: const Icon(
        Icons.navigate_next,
        color: Color(0xffffcc5c),
        size: 35.0,
      ),
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: const Icon(
        Icons.done,
        color: Color(0xffffcc5c),
        size: 35.0,
      ),
      doneButtonStyle: myButtonStyle(),
      onDonePress: () => onDonePress(),

      // Dots
      colorDot: const Color(0xffffcc5c),
      sizeDot: 13.0,
      typeDotAnimation: DotSliderAnimation.DOT_MOVEMENT,

      // Tabs
      listCustomTabs: renderListCustomTabs(),
      // onTabChangeCompleted: onTabChangeCompleted,
      refFuncGoToTab: (refFunc) {
        goToTab = refFunc;
      },

      // Behavior
      autoScroll: true,
      autoScrollInterval: const Duration(seconds: 5),
      loopAutoScroll: true,
      curveScroll: Curves.easeInOutCirc,
      scrollPhysics: const PageScrollPhysics(),
      hideStatusBar: true,
    );
  }
}
