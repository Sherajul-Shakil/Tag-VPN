import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';

class DarkRoundedPinPut{

  final defaultPinTheme = PinTheme(
    margin: EdgeInsets.only(left:8),
    width: 56,
    height: 56,
    textStyle: TextStyle(color: Colors.white,
        fontSize: 20.0,
        height: 1),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
  );


   PinTheme focusedPinTheme() {
     final focusedPinTheme = defaultPinTheme.copyDecorationWith(
       color: Colors.grey,
       borderRadius: BorderRadius.circular(15.0),
     );
     return focusedPinTheme;
   }

   PinTheme followingPinTheme() {
      final followingPinTheme = defaultPinTheme.copyDecorationWith(
       color: Colors.grey,
       borderRadius: BorderRadius.circular(15.0),
     );
      return followingPinTheme;
   }

   PinTheme submittedPinTheme(){
     final submittedPinTheme = defaultPinTheme.copyWith(
       decoration: defaultPinTheme.decoration?.copyWith(
         color: CustomColor.greenMainColor,
         borderRadius: BorderRadius.circular(15.0),
       ),
     );
     return submittedPinTheme;
   }


}