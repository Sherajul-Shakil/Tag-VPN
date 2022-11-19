import 'package:dio/dio.dart';
import 'package:tap_vpn_details/utils/custom_string.dart';

class AuthenticationRepository{


  // register
  Future<Response> registerNewUser(String name, String email, String password, String confirmPassword)async{
    Response response = await Dio().post(
        "${CustomString.baseApi}/registration",
        queryParameters: <String,dynamic>{
          "name" : name,
          "email" : email,
          "password": password,
          "confirm_password": confirmPassword,
        },
    ).timeout(Duration(seconds:5));
    print(response);
    return response;
  }



  //login
  Future<Response> loginUserInfo(String email, String password, String deviceName, String uid)async{
    Response response = await Dio().post(
      "${CustomString.baseApi}/login",
      queryParameters: <String,dynamic>{
        "email" : email,
        "password": password,
        "device_name": deviceName,
        "uid": uid
      },
    ).timeout(Duration(seconds:5));
    return response;
  }


  // send otp
  Future<Response> sendOtp(String email)async{
    Response response = await Dio().post(
      "${CustomString.baseApi}/forgot-password/send-otp",
      queryParameters: <String,dynamic>{
        "email" : email,
      },
    ).timeout(Duration(seconds:10));
    return response;
  }


  // verify otp
  Future<Response> verifyOtp(String email, String otpPin)async{
    Response response = await Dio().post(
      "${CustomString.baseApi}/forgot-password/verify-otp",
      queryParameters: <String,dynamic>{
        "email" : email,
        "otp" : otpPin,
        "user_type":2,
      },
    ).timeout(Duration(seconds:5));
    return response;
  }




  // reset password
  Future<Response> resetPassword ( String email, String newPassword, String confirmPassword ) async {
    Response response = await Dio().post(
      "${CustomString.baseApi}/forgot-password/reset-password",
      queryParameters: <String,dynamic>{
        "email" : email,
        "new_password" : newPassword,
        "confirm_password": confirmPassword,
      },
    ).timeout(Duration(seconds:5));
    return response;
  }





}