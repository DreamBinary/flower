import 'dart:io';
import 'dart:math';

import 'package:flower/app/component/my_header/header_view.dart';
import 'package:flower/app/component/mytextfield.dart';
import 'package:flower/app/routes/app_pages.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flower/app/utils/keyboard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'login_logic.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final logic = Get.find<LoginLogic>();
  final state = Get.find<LoginLogic>().state;
  late final AnimationController _shakeCtrl = AnimationController(
      duration: const Duration(milliseconds: 500), vsync: this)
    ..addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _shakeCtrl.reset();
        }
      },
    );

  _shake() {
    _shakeCtrl.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RawMaterialButton(
                  onPressed: () {
                    Get.toNamed(Routes.register);
                  },
                  child: const Text(AppString.register))
            ],
          ),
          const HeaderComponent(),
          SizedBox(height: 30.h),
          ...getWidgets(),
          Row(
            children: <Widget>[
              Obx(
                () => Checkbox(
                  activeColor: Colors.transparent,
                  checkColor: AppColors.primarySwatch,
                  value: state.checkUseAndPrivate.value,
                  onChanged: (value) {
                    state.checkUseAndPrivate.value = value!;
                  },
                ),
              ),
              AnimatedBuilder(
                animation: _shakeCtrl,
                builder: (context, child) => Transform.translate(
                  offset: Offset(sin(1000 * 2 * pi * _shakeCtrl.value) * 5, 0),
                  child: child,
                ),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: "我已阅读"),
                      TextSpan(
                        style: const TextStyle(
                          color: AppColors.primarySwatch,
                          decoration: TextDecoration.underline,
                        ),
                        text: "使用条款",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(Routes.useClause),
                      ),
                      const TextSpan(text: "和"),
                      TextSpan(
                        style: const TextStyle(
                          color: AppColors.primarySwatch,
                          decoration: TextDecoration.underline,
                        ),
                        text: "隐私政策",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(Routes.privacy),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(AppColors.grey),
              fixedSize:
                  MaterialStatePropertyAll(Size.fromWidth(double.maxFinite)),
            ),
            onPressed: () {
              logic.login(_shake);
              KeyboardUtils.hideKeyboard(context);
            },
            child: Text(AppString.login, style: AppTS.fontSize22),
          )
        ]),
      ),
    );
  }

  List<Widget> getWidgets() {
    return Platform.isIOS
        ? [
            UsernameTextFieldIOS(state.usernameCtrl),
            SizedBox(height: 10.h),
            PasswordTextFieldIOS(
              state.passwordCtrl,
              hint: AppString.passwordInput,
              prefixIcon: Icons.privacy_tip_outlined,
              onSubmitted: (_) =>
                  {logic.login(_shake), KeyboardUtils.hideKeyboard(context)},
            ),
          ]
        : [
            UsernameTextField(state.usernameCtrl,
                onClear: () => state.usernameCtrl.clear()),
            PasswordTextField(
              state.passwordCtrl,
              hint: AppString.passwordInput,
              onClear: () => state.passwordCtrl.clear(),
              prefixIcon: Icons.privacy_tip_outlined,
              onSubmitted: (_) =>
                  {logic.login(_shake), KeyboardUtils.hideKeyboard(context)},
            ),
          ];
  }

  @override
  void dispose() {
    Get.delete<LoginLogic>();
    super.dispose();
  }
}
