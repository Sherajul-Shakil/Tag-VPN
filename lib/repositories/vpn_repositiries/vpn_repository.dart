import 'package:dio/dio.dart';
import '../../utils/custom_string.dart';

class VpnRepository {
  // country list ************************************************************************
  static Future<Response> countryList(String token) async {
    final response = await Dio().get(CustomString.serverApi,
        options: Options(headers: <String, dynamic>{
          "access-token": token,
        }));
    return response;
  }
}
