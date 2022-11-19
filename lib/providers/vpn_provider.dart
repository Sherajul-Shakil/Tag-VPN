// ignore_for_file: unused_local_variable, avoid_print, unused_field, prefer_final_fields

import 'package:flutter/widgets.dart';
import 'package:tap_vpn_details/models/country/country_list.dart';
import '../repositories/vpn_repositiries/vpn_repository.dart';

class VpnProvider extends ChangeNotifier {
  CountryListModel _countryListModel = CountryListModel();

  Future<void> getCountryList(String token) async {
    try {
      var response = await VpnRepository.countryList(token);
      print(response.data);
      if (response.statusCode == 200) {
        countryList = CountryListModel.fromJson(response.data);
        notifyListeners();
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // getter and setter
  CountryListModel get countryList => _countryListModel;

  set countryList(CountryListModel value) {
    _countryListModel = value;
    notifyListeners();
  }
}
