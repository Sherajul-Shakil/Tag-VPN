import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesData{

  static const String IS_LOGGED_IN ="logged_in";


  static SharedPreferences? sharedPreferences;

  static Future<bool> initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    // sharedPreferences!.clear();
    return true;
  }

  static void setLoggedIn({required bool isLoggedIn}){
    sharedPreferences!.setBool(IS_LOGGED_IN, isLoggedIn);
  }


  static bool getLoggedIn(){
    bool value = sharedPreferences?.getBool(IS_LOGGED_IN) ?? false;
    return value!;
  }

}