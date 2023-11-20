import 'package:dio/dio.dart';
import 'package:flower/app/data/net/dio.dart';
import 'package:flower/app/data/net/url.dart';
import 'package:flower/app/theme/app_string.dart';
import 'package:flower/app/utils/mmkv.dart';

class ApiProduct {
  // todo
  static Future<bool?> getAllProduct(int currentPage, int size) async {
    var response = await DioUtil().get(Url.product,
        map: {
          "currentPage": currentPage,
          "size": size,
        },
        options:
            Options(headers: {"token": MMKVUtil.getString(AppString.TOKEN)}));
    if (response?.data["code"] == 1) {
      return null;
    }
    return null;
  }

  // todo
  static Future<bool?> exchangeProduct(String productId, String address) async {
    var response = await DioUtil().put(Url.product,
        map: {
          "productId": productId,
          "address": address,
        },
        options:
            Options(headers: {"token": MMKVUtil.getString(AppString.TOKEN)}));
    if (response?.data["code"] == 1) {
      return null;
    }
    return null;
  }

  // todo
  // 兑换过的
  static Future<bool?> getExchangedProduct() async {
    var response = await DioUtil().get(Url.exchangedProduct,
        options:
            Options(headers: {"token": MMKVUtil.getString(AppString.TOKEN)}));
    if (response?.data["code"] == 1) {
      return null;
    }
    return null;
  }
}
