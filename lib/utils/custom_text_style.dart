// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'dimensions.dart';

class CustomTextStyle {

  static var titleStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: Dimensions.extraLargeTextSize,
    color: CustomColor.txtColorBlack,
  );

  static var subTitleStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.smallTextSize,
    color: CustomColor.txtColorBlack,
  );

  static var subTitleStylegreenNormal = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.smallTextSize,
    color: Color(0xff64748B),
  );

  static var subTitleStyleGreen = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.smallTextSize,
    color: CustomColor.txtColorGreen,
  );

  static var titleStyleBlack600 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: Dimensions.smallTextSize,
    color: CustomColor.txtColorBlack,
  );

  static var subTitleStyleBlack400 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.veryExtraSmallTextSize,
    color: CustomColor.txtColorBlack.withOpacity(0.70),
  );

  static var Black400 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.veryExtraSmallTextSize,
    color: CustomColor.txtColorFullBlack,
  );

  static var Black600medium = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: Dimensions.mediumTextSize,
    color: CustomColor.txtColorBlack,
  );

  static var Black400medium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.mediumTextSize,
    color: CustomColor.txtColorBlack,
  );

  static var subTitleStyleW500 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: Dimensions.smallTextSize,
    color: CustomColor.txtColorBlack.withOpacity(0.80),
  );

  static var subTitleStyleW500Green = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: Dimensions.smallTextSize,
    color: CustomColor.txtColorGreen,
  );
}