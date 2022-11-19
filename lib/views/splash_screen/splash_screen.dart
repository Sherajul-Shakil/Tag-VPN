
// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'package:tap_vpn_details/utils/custom_string.dart';
import 'package:tap_vpn_details/utils/shared_preferences/shared_preferences_data.dart';
import 'package:tap_vpn_details/views/home_screen/home_page.dart';
import 'package:tap_vpn_details/views/privacy_screen/privacy_page.dart';



class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }


  void initSharedPreferences() async {

    Timer(const Duration(seconds: 3), () {
      print('Pref Data');
      print(SharedPreferencesData.getLoggedIn());
      try {
        if (SharedPreferencesData.getLoggedIn() == true) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) => HomePage()),
                  (Route<dynamic> route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => PrivacyPage()),
                  (Route<dynamic> route) => false);
        }
      } catch (error) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => PrivacyPage()),
                (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 220.w,
              height: 220.h,
              decoration: BoxDecoration(
                color: CustomColor.circle2,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 140.w,
              height: 140.h,
              decoration: BoxDecoration(
                  color: CustomColor.circle1,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: CustomColor.circle4,
                    width: 5.w,
                  )),
              child: Image.asset(CustomString.appLogo),
            ),
          ],
        ),
      ),
    );
  }
}
