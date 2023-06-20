import 'package:dio/dio.dart';
import 'package:flower/app/data/net/dio.dart';
import 'package:flower/app/data/net/url.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/utils/mmkv.dart';
import 'package:flower/app/utils/toast.dart';

class ApiTeach {
  static Future<List<Map<String, dynamic>>?> getTeachInfo(
      int currentPage) async {
    var response = await DioUtil().get(Url.teach,
        map: {
          "currentPage": currentPage,
        },
        options:
            Options(headers: {"token": MMKVUtil.getString(AppString.TOKEN)}));
    if (response?.data["code"] == 1) {
      List<Map<String, dynamic>> list = [];
      for (var item in response?.data["data"]["records"]) {
        list.add(Map<String, dynamic>.from(item));
      }
      return list;
    }
    return null;
  }

  static Future<bool> bookTeach(var teachId) async {
    var response = await DioUtil().post(Url.teach,
        query: {
          "teachId": teachId,
        },
        options:
            Options(headers: {"token": MMKVUtil.getString(AppString.TOKEN)}));
    if (response?.data["code"] == 1) {
      return true;
    }
    ToastUtil.showToast(response?.data["msg"]);
    return false;
  }

  // todo 无资料
  static Future<bool> getBookedTeachInfo() async {
    var response = await DioUtil().get(Url.userTeachInfo,
        options:
            Options(headers: {"token": MMKVUtil.getString(AppString.TOKEN)}));
    if (response?.data["code"] == 1) {
      return true;
    }
    ToastUtil.showToast(response?.data["msg"]);
    return false;
  }
}
