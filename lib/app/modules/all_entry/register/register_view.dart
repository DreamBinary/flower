import 'dart:io';

import 'package:flower/app/component/my_header/header_view.dart';
import 'package:flower/app/component/mytextfield.dart';
import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flower/app/utils/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../login/login_logic.dart';
import 'register_logic.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final logic = Get.find<RegisterLogic>();
  final state = Get.find<RegisterLogic>().state;
  final logicLogin = Get.find<LoginLogic>();
  final stateLogin = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyTopBar(),
        body: Padding(
          padding: EdgeInsets.only(left: 40.w, right: 40.w),
          child: Column(children: [
            const HeaderComponent(showAdd: true),
            SizedBox(height: 30.h),
            ...getWidgets(),
            SizedBox(height: 30.h),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(AppColors.grey),
                fixedSize:
                    MaterialStatePropertyAll(Size.fromWidth(double.maxFinite)),
              ),
              onPressed: () {
                logic.register();
                KeyboardUtils.hideKeyboard(context);
              },
              child: Text(AppString.register, style: AppTS.fontSize22),
            )
          ]),
        ));
  }

  List<Widget> getWidgets() {
    return Platform.isIOS
        ? [
            UsernameTextFieldIOS(stateLogin.usernameCtrl),
            SizedBox(height: 10.h),
            VerifyTextFieldIOS(state.verifyCtrl,
                onSend: () => {logicLogin.sendSms()},
                onSubmitted: (_) => logicLogin.sendSms()),
            SizedBox(height: 10.h),
            PasswordTextFieldIOS(
              stateLogin.passwordCtrl,
              // label: S.password,
              hint: AppString.passwordInput,
              prefixIcon: Icons.privacy_tip_outlined,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 10.h),
            PasswordTextFieldIOS(state.verifyPasswordCtrl,
                // label: S.verifyPassword,
                hint: AppString.verifyPasswordInput,
                prefixIcon: Icons.password,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => {
                      logic.register(),
                      KeyboardUtils.hideKeyboard(context),
                    })
          ]
        : [
            UsernameTextField(stateLogin.usernameCtrl,
                onClear: () => stateLogin.usernameCtrl.clear()),
            VerifyTextField(state.verifyCtrl,
                onSend: () => {logicLogin.sendSms()},
                onSubmitted: (_) => logicLogin.sendSms()),
            PasswordTextField(
              stateLogin.passwordCtrl,
              // label: S.password,
              hint: AppString.passwordInput,
              prefixIcon: Icons.privacy_tip_outlined,
              onClear: () => stateLogin.passwordCtrl.clear(),
              textInputAction: TextInputAction.next,
            ),
            PasswordTextField(state.verifyPasswordCtrl,
                // label: S.verifyPassword,
                hint: AppString.verifyPasswordInput,
                prefixIcon: Icons.password,
                onClear: () => state.verifyPasswordCtrl.clear(),
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => {
                      logic.register(),
                      KeyboardUtils.hideKeyboard(context),
                    })
          ];
  }

  @override
  void dispose() {
    Get.delete<RegisterLogic>();
    super.dispose();
  }
}
