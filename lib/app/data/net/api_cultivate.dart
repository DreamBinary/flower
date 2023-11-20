import 'package:dio/dio.dart';
import 'package:flower/app/data/net/dio.dart';
import 'package:flower/app/data/net/url.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/utils/mmkv.dart';

class ApiCultivate {
  // todo
  // 知识果
  static Future<bool?> getKnowledge() async {
    var response = await DioUtil().get(Url.knowledge,
        options:
            Options(headers: {"token": MMKVUtil.getString(AppString.TOKEN)}));
    if (response?.data["code"] == 1) {
      return null;
    }
    return null;
  }
}
