import 'package:dio/dio.dart';
import 'package:flower/app/data/net/dio.dart';
import 'package:flower/app/data/net/url.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/utils/mmkv.dart';

class ApiCommodity {
  static Future<bool?> allCommodity(int type) async {
    var response = await DioUtil().get(Url.commodity,
        map: {
          "type": type,
        },
        options:
            Options(headers: {"token": MMKVUtil.getString(AppString.TOKEN)}));
    if (response?.data["code"] == 1) {
      return null;
    }
    return null;
  }

  static Future<bool?> addCommodityToOrder(int commodityId, int cnt) async {
    var response = await DioUtil().get(Url.commodity,
        map: {
          "commodityId": commodityId,
          "cnt": cnt,
        },
        options:
            Options(headers: {"token": MMKVUtil.getString(AppString.TOKEN)}));
    if (response?.data["code"] == 1) {
      return null;
    }
    return null;
  }
}
