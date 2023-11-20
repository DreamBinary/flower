import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flower/app/data/entity/user_flower.dart';
import 'package:flower/app/data/net/dio.dart';
import 'package:flower/app/data/net/url.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/utils/mmkv.dart';
import 'package:flower/app/utils/toast.dart';
import 'package:flutter/cupertino.dart';

class ApiFlower {
  static Future<List<UserFlower>> userFlower(int status) async {
    var response = await DioUtil().get(Url.userFlower,
        map: {
          "status": status,
        },
        options:
            Options(headers: {"token": MMKVUtil.getString(AppString.TOKEN)}));
    List<UserFlower> list = [];
    if (response?.data["code"] == 1) {
      for (var item in response?.data["data"]) {
        list.add(UserFlower.fromJson(item));
      }
    }
    return list;
  }

  // todo
  static Future<bool> allFlower() async {
    var response = await DioUtil().get(Url.allFlower);
    if (response?.data["code"] == 1) {
      debugPrint(response?.data["data"].toString());
      return true;
    }
    return false;
  }

  static Future<bool> addFlower(int flowerId, int isPlanted) async {
    var response = await DioUtil().post(Url.addFlower, data: {
      "userId":
          jsonDecode(MMKVUtil.getString(AppString.USER_DATA))["id"].toString(),
      "flowerId": flowerId,
      "isPlanted": isPlanted,
    });
    ToastUtil.showToast(response?.data["msg"]);
    if (response?.data["code"] == 1) {
      return true;
    }
    return false;
  }

  // todo
  static Future<bool> waterFlower(int cost, int flowerId) async {
    String token = MMKVUtil.getString(AppString.TOKEN);
    if (token == "") {
      return false;
    }
    var response = await DioUtil().post(Url.user,
        data: {
          "cost": cost,
          "flowerId": flowerId,
        },
        options: Options(headers: {"token": token}));
    if (response?.data["code"] == 1) {
      return true;
    }
    return false;
  }

  static Future<bool> updateCompleted(int flowerId) async {
    var response = await DioUtil().put(Url.updateCompleted, map: {
      "userId":
          jsonDecode(MMKVUtil.getString(AppString.USER_DATA))["id"].toString(),
      "flowerId": flowerId,
    });
    if (response?.data["code"] == 1) {
      return true;
    }
    return false;
  }
}
