import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flower/app/data/net/dio.dart';
import 'package:flower/app/data/net/url.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/utils/mmkv.dart';
import 'package:flower/app/utils/toast.dart';

class ApiUser {
  static Future<bool> sendSms(String phone) async {
    var response = await DioUtil().post(Url.sendSms, data: {"phone": phone});
    ToastUtil.showToast(response?.data["msg"]);
    if (response?.data["code"] == 1) {
      return true;
    }
    return false;
  }

  static Future<bool> signUp(
      String phone, String password, String verify, String path) async {
    var response = await DioUtil().postForm(Url.signUp, {
      "avatar": MultipartFile.fromFileSync(path),
      "phone": phone,
      "passwd": password,
      "verifyCode": verify,
    });
    ToastUtil.showToast(response?.data["msg"]);
    if (response?.data["code"] == 1) {
      return true;
    }
    return false;
  }

  static Future<bool> login(String phone, String password) async {
    var response = await DioUtil().post(Url.login,
        data: {"phone": phone, "password": password},
        options: Options(contentType: "application/json"));
    ToastUtil.showToast(response?.data["msg"]);
    if (response?.data["code"] == 1) {
      String token = response?.data["data"]["token"];
      await getInfo(token);
      MMKVUtil.put(AppString.TOKEN, token);
      return true;
    }
    return false;
  }

  static Future<bool> getInfo(String token) async {
    var response = await DioUtil()
        .get(Url.user, options: Options(headers: {"token": token}));
    if (response?.data["code"] == 1) {
      MMKVUtil.put(AppString.USER_DATA, jsonEncode(response?.data["data"]));
      return true;
    }
    return false;
  }

  static Future<bool> changeInfo(
      {String? avatarPath, String? nickname, String? passwd}) async {
    String token = MMKVUtil.getString(AppString.TOKEN);
    if (token == "") {
      return false;
    }
    var response = await DioUtil().putForm(
        Url.user,
        {
          "avatar": avatarPath == null
              ? null
              : MultipartFile.fromFileSync(avatarPath),
          "nickname": nickname,
          "passwd": passwd
        },
        options: Options(
            headers: {"token": token}, contentType: "multipart/form-data"));
    await getInfo(token);
    if (response?.data["code"] == 1) {
      return true;
    }
    return false;
  }

  static logout() async {
    String token = MMKVUtil.getString(AppString.TOKEN);
    if (token == "") {
      return false;
    }
    var response = await DioUtil()
        .post(Url.logout, options: Options(headers: {"token": token}));
    if (response?.data["code"] == 1) {
      MMKVUtil.clear();
      return true;
    }
    return false;
  }

  static deleteUser() async {
    String token = MMKVUtil.getString(AppString.TOKEN);
    if (token == "") {
      return false;
    }
    var response = await DioUtil()
        .delete(Url.user, options: Options(headers: {"token": token}));
    if (response?.data["code"] == 1) {
      MMKVUtil.clear();
      return true;
    }
    return false;
  }
}
