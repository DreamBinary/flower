import 'dart:io';

import 'package:flower/app/modules/all_entry/login/login_binding.dart';
import 'package:flower/app/routes/app_pages.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/utils/keyboard.dart';
import 'package:flower/app/utils/mmkv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmkv/mmkv.dart';
import 'package:statusbarz/statusbarz.dart';

import 'app/modules/route/route_binding.dart';
import 'app/theme/app_colors.dart';

void main() async {
  final rootDir = await MMKV.initialize();
  // splash
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  } else {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    bool isLogin = MMKVUtil.getBool(AppString.IS_LOGIN);
    bool isIntro = MMKVUtil.getBool(AppString.IS_INTRO);
    Statusbarz.instance.setDefaultDelay = const Duration();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return StatusbarzCapturer(
            child: GetMaterialApp(
          // title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            backgroundColor: AppColors.background,
            primaryColor: AppColors.primary,
            // textfield prefix icon color
            primarySwatch: AppColors.primarySwatch,
            fontFamily: "FZQKBYSJW",
          ),
          navigatorObservers: [Statusbarz.instance.observer],
          initialBinding:
              isIntro ? (isLogin ? RouteBinding() : LoginBinding()) : null,
          initialRoute: isIntro
              ? (isLogin ? Routes.routePage : Routes.login)
              : Routes.intro,
          getPages: AppPages.pages,

          builder: (context, child) {
            return Scaffold(
              body: GestureDetector(
                onTap: () {
                  KeyboardUtils.hideKeyboard(context);
                },
                child: child,
              ),
            );
          },
          home: child,
        ));
      },
    );
  }
}
