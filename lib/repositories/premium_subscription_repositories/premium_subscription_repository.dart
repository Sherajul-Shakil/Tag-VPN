import 'package:dio/dio.dart';
import 'package:tap_vpn_details/utils/custom_string.dart';

class PremiumSubscriptionRepository {
  // premium subscription list
  Future<Response> premiumSubscriptionListFetch(String token) async {
    Response response = await Dio()
        .get("${CustomString.baseApi}/premium-subscription/list",
            options: Options(headers: <String, dynamic>{
              "access-token": token,
            }))
        .timeout(Duration(seconds: 5));
    return response;
  }

  //premium subscription buy
  Future<Response> premiumSubscriptionBuy(String id, String token) async {
    Response response = await Dio()
        .get("${CustomString.baseApi}/premium-subscription/buy/$id",
            options: Options(headers: <String, dynamic>{
              "access-token": token,
            }))
        .timeout(Duration(seconds: 5));
    return response;
  }
}
