import 'dart:convert';

import 'package:flower/app/component/my_header/header_view.dart';
import 'package:flower/app/component/mytopbar.dart';
import 'package:flower/app/theme/app_colors.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/theme/app_text_theme.dart';
import 'package:flower/app/utils/keyboard.dart';
import 'package:flower/app/utils/mmkv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/net/url.dart';
import 'change_info_logic.dart';

class ChangeInfoPage extends StatefulWidget {
  const ChangeInfoPage({super.key});

  @override
  State<ChangeInfoPage> createState() => _ChangeInfoPageState();
}

class _ChangeInfoPageState extends State<ChangeInfoPage> {
  final logic = Get.find<ChangeInfoLogic>();
  final state = Get.find<ChangeInfoLogic>().state;
  String url = "";

  @override
  void initState() {
    super.initState();
    try {
      url = jsonDecode(MMKVUtil.getString(AppString.USER_DATA))["avatar"];
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyTopBar(
        backgroundImage: const AssetImage("assets/images/topbar.png"),
        middle: Text(
          AppString.changeInfo,
          style: AppTS.fontSize24,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          HeaderComponent(
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/icon.png",
                image: Url.avatar + url,
                fit: BoxFit.fill,
              ),
              showAdd: true),
          ChangeInfoTextField(
            state.nicknameCtrl,
            hintText: "请输入新昵称",
            prefixText: "昵称",
            onClear: () => state.nicknameCtrl.clear(),
          ),
          ChangeInfoTextField(
            state.passwordCtrl,
            hintText: "请输入新密码",
            prefixText: "密码",
            onClear: () => state.passwordCtrl.clear(),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 50.h,
        child: ElevatedButton(
          onPressed: () {
            logic.changeInfo();
          },
          child: const Text("确认修改"),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<ChangeInfoLogic>();
    super.dispose();
  }
}

class ChangeInfoTextField extends StatelessWidget {
  final TextEditingController ctrl;
  final String hintText;
  final String prefixText;
  final Function() onClear;
  final Rx<bool> clearVisible = false.obs;
  final FocusNode focusNode = FocusNode();
  late final Rx<bool> focus = false.obs;

  ChangeInfoTextField(
    this.ctrl, {
    super.key,
    required this.hintText,
    required this.prefixText,
    required this.onClear,
  }) {
    focusNode.addListener(() {
      focus.value = focusNode.hasFocus;
      clearVisible.value = ctrl.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
              style: AppTS.fontSize18,
              controller: ctrl,
              focusNode: focusNode,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTS.fontSize16,
                prefixIcon: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    prefixText,
                    style: AppTS.fontSize16,
                  ),
                ),
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 60, maxWidth: 60),
                alignLabelWithHint: true,
                suffix: Visibility(
                  visible: focus.value && clearVisible.value,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    onTap: onClear,
                    child: const Icon(Icons.clear, size: 15),
                  ),
                ),
              ),
              strutStyle: const StrutStyle(
                forceStrutHeight: true,
              ),
              textInputAction: TextInputAction.next,
              onChanged: (str) => {clearVisible.value = str.isNotEmpty},
              onSubmitted: (_) => KeyboardUtils.hideKeyboard(context)),
        ));
  }
}
