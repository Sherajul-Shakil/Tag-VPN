import 'package:flutter/material.dart';
import 'package:tap_vpn_details/models/formalstatus/formal_status.dart';
import 'package:tap_vpn_details/models/premium_subscription/premium_subscription_list.dart';
import 'package:tap_vpn_details/repositories/premium_subscription_repositories/premium_subscription_repository.dart';

class PremiumSubscriptionProvider extends ChangeNotifier{

  PremiumSubscriptionList _premiumSubscriptionList = PremiumSubscriptionList();
  FormalStatus _formalStatus = FormalStatus();




  //getter and setter



  PremiumSubscriptionList get premiumSubscriptionList =>
      _premiumSubscriptionList;

  set premiumSubscriptionList(PremiumSubscriptionList value) {
    _premiumSubscriptionList = value;
    notifyListeners();
  }


  FormalStatus get formalStatus => _formalStatus;
  set formalStatus(FormalStatus value) {
    _formalStatus = value;
    notifyListeners();
  }







  // api access




  // premium subscription list
  Future<void> premiumSubscriptionListFetch(String token)async{
    var response = await PremiumSubscriptionRepository().premiumSubscriptionListFetch(token);
    if(response.statusCode == 200){
      premiumSubscriptionList = PremiumSubscriptionList.fromJson(response.data);
      notifyListeners();
    }
  }



  // premium subscription buy
  Future<void> premiumSubscriptionBuy(String id, String token)async{
    var response = await PremiumSubscriptionRepository().premiumSubscriptionBuy(id, token);
    if(response.statusCode == 200){
      formalStatus = FormalStatus.fromJson(response.data);
      notifyListeners();
    }
  }





}