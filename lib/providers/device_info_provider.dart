import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tap_vpn_details/models/deviceinfo/android_device_info_from_user.dart';
import 'package:tap_vpn_details/models/deviceinfo/ios_device_info_from_user.dart';

class DeviceInfoProvider extends ChangeNotifier{

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  bool _isAndroid = false;
  AndroidDeviceInfoFromUser _androidDeviceInfoFromUser = AndroidDeviceInfoFromUser();
  IosDeviceInfoFromUser _iosDeviceInfoFromUser = IosDeviceInfoFromUser();




  // getter and setter

  bool get isAndroid => _isAndroid;

  set isAndroid(bool value) {
    _isAndroid = value;
    notifyListeners();
  }


  AndroidDeviceInfoFromUser get androidDeviceInfoFromUser =>
      _androidDeviceInfoFromUser;

  set androidDeviceInfoFromUser(AndroidDeviceInfoFromUser value) {
    _androidDeviceInfoFromUser = value;
    notifyListeners();
  }


  IosDeviceInfoFromUser get iosDeviceInfoFromUser => _iosDeviceInfoFromUser;

  set iosDeviceInfoFromUser(IosDeviceInfoFromUser value) {
    _iosDeviceInfoFromUser = value;
    notifyListeners();
  }







  // functions





  // device info code
  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};
    try {
      if (Platform.isAndroid) {
        isAndroid = true;
        _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        isAndroid = false;
        _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
      notifyListeners();
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    //if (!mounted) return;
  }

  AndroidDeviceInfoFromUser _readAndroidBuildData(AndroidDeviceInfo build) {
    androidDeviceInfoFromUser.brand = build.brand;
    androidDeviceInfoFromUser.device = build.device;
    androidDeviceInfoFromUser.id = build.id;
    return androidDeviceInfoFromUser;
  }


  IosDeviceInfoFromUser _readIosDeviceInfo(IosDeviceInfo build) {
    iosDeviceInfoFromUser.name = build.name;
    iosDeviceInfoFromUser.model = build.model;
    iosDeviceInfoFromUser.id = build.identifierForVendor;
    return iosDeviceInfoFromUser;
  }



}