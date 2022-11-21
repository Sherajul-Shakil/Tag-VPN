// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'package:tap_vpn_details/utils/custom_string.dart';
import 'package:tap_vpn_details/utils/dimensions.dart';
import '../utils/custom_text_style.dart';

class AutoProtectPage extends StatefulWidget {
  static const routeName = 'auto-protect';

  @override
  State<AutoProtectPage> createState() => _AutoProtectPageState();
}

class _AutoProtectPageState extends State<AutoProtectPage> {
  String? _selectedConnectOnDevice;
  String? _selectedWifi;
  String? _selectedOff;
  String? _selectedOn;

  @override
  Widget build(BuildContext context) {
    final _appbar = AppBar(
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(Dimensions.radius),
        bottomRight: Radius.circular(Dimensions.radius),
      )),
      backgroundColor: CustomColor.greenMainColor,
      title: Text(CustomString.AutoProtectAppBar),
    );

    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      appBar: _appbar,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Dimensions.heightSize8 * 3),
              Text(CustomString.AutoProtectTitle,
                  style: CustomTextStyle.subTitleStyle),
              SizedBox(height: Dimensions.heightSize8 * 3),
              RadioListTile(
                title: Text(CustomString.AutoProtectTitle1,
                    style: CustomTextStyle.titleStyleBlack600),
                subtitle: Text(CustomString.AutoProtectSubTitle1,
                    style: CustomTextStyle.subTitleStyleBlack400),
                value: "on",
                groupValue: _selectedOn,
                onChanged: (value) {
                  setState(() {
                    _selectedOn = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text(CustomString.AutoProtectTitle2,
                    style: CustomTextStyle.titleStyleBlack600),
                subtitle: Text(CustomString.AutoProtectSubTitle2,
                    style: CustomTextStyle.subTitleStyleBlack400),
                value: "un",
                groupValue: _selectedOn,
                onChanged: (value) {
                  setState(() {
                    _selectedOn = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text(CustomString.AutoProtectTitle3,
                    style: CustomTextStyle.titleStyleBlack600),
                subtitle: Text(CustomString.AutoProtectSubTitle3,
                    style: CustomTextStyle.subTitleStyleBlack400),
                value: "off",
                groupValue: _selectedOn,
                onChanged: (value) {
                  setState(() {
                    _selectedOn = value.toString();
                  });
                },
              ),
              // ListTile(
              //   dense: true,
              //   contentPadding: EdgeInsets.all(0),
              //   title: Text(CustomString.AutoProtectTitle1,
              //       style: CustomTextStyle.titleStyleBlack600),
              //   subtitle: Text(CustomString.AutoProtectSubTitle1,
              //       style: CustomTextStyle.subTitleStyleBlack400),
              //   trailing: Radio<String>(
              //     activeColor: CustomColor.txtColorRed,
              //     value: 'false',
              //     groupValue: _selectedConnectOnDevice,
              //     onChanged: (value) {
              //       setState(() {
              //         _selectedConnectOnDevice = value!;
              //       });
              //     },
              //   ),
              // ),
              // ListTile(
              //   dense: true,
              //   contentPadding: EdgeInsets.all(0),
              // title: Text(CustomString.AutoProtectTitle2,
              //     style: CustomTextStyle.titleStyleBlack600),
              // subtitle: Text(CustomString.AutoProtectSubTitle2,
              //     style: CustomTextStyle.subTitleStyleBlack400),
              //   trailing: Radio<String>(
              //     activeColor: CustomColor.txtColorRed,
              //     value: 'false',
              //     groupValue: _selectedWifi,
              //     onChanged: (value) {
              //       setState(() {
              //         _selectedWifi = value!;
              //       });
              //     },
              //   ),
              // ),
              // ListTile(
              //   dense: true,
              //   contentPadding: EdgeInsets.all(0),
              //   title: Text(CustomString.AutoProtectTitle3,
              //       style: CustomTextStyle.titleStyleBlack600),
              //   subtitle: Text(CustomString.AutoProtectSubTitle3,
              //       style: CustomTextStyle.subTitleStyleBlack400),
              //   trailing: Radio<String>(
              //     activeColor: CustomColor.txtColorRed,
              //     value: 'false',
              //     groupValue: _selectedOff,
              //     onChanged: (value) {
              //       setState(() {
              //         _selectedOff = value!;
              //       });
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
