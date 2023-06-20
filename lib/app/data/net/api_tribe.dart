import 'package:dio/dio.dart';
import 'package:flower/app/data/entity/TribeInfo.dart';
import 'package:flower/app/data/net/url.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/data/net/dio.dart';
import 'package:flower/app/utils/mmkv.dart';

class ApiTribe {
  static Future<bool> createTribe(String name, String description) async {
    var response = await DioUtil().post(Url.tribe,
        data: {"name": name, "description": description},
        options:
            Options(headers: {"token": MMKVUtil.getString(AppString.TOKEN)}));
    if (response?.data["code"] == 1) {
      return true;
    }
    return false;
  }

  static Future<TribeInfo?> getTribeInfo() async {
    var response = await DioUtil().get(Url.tribe,
        options:
            Options(headers: {"token": MMKVUtil.getString(AppString.TOKEN)}));
    if (response?.data["code"] == 1) {
      return TribeInfo.fromJson(response?.data["data"]);
    }
    return null;
  }

// static Future<bool> joinTribe(String id) async {
//   var response = await DioUtil().post(Url.tribe + "/$id/join",
//       options:
//           Options(headers: {"token": MMKVUtil.getString(AppString.TOKEN)}));
//   if (response?.data["code"] == 1) {
//     return true;
//   }
//   return false;
// }
}
