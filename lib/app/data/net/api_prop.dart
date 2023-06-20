import 'package:dio/dio.dart';
import 'package:flower/app/data/net/url.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/utils/mmkv.dart';

import 'dio.dart';

class ApiProp {
  static Future<bool?> allProps(int currentPage, int pageSize) async {
    var response = await DioUtil().get(Url.prop,
        map: {
          "currentPage": currentPage,
          "pageSize": pageSize,
        },
        options:
            Options(headers: {"token": MMKVUtil.getString(AppString.TOKEN)}));
    if (response?.data["code"] == 1) {
      return null;
    }
    return null;
  }

  static Future<bool?> exchangeProp(int propsId, int cnt) async {
    var response = await DioUtil().put(Url.prop,
        map: {
          "propsId": propsId,
          "cnt": cnt,
        },
        options:
            Options(headers: {"token": MMKVUtil.getString(AppString.TOKEN)}));
    if (response?.data["code"] == 1) {
      return null;
    }
    return null;
  }

  static Future<bool?> getUserProps() async {
    var response = await DioUtil().get(Url.userProps,
        options:
            Options(headers: {"token": MMKVUtil.getString(AppString.TOKEN)}));
    if (response?.data["code"] == 1) {
      return null;
    }
    return null;
  }
}
