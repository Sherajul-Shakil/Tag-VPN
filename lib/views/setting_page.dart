// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'package:tap_vpn_details/utils/custom_string.dart';
import 'package:tap_vpn_details/utils/dimensions.dart';
import 'package:tap_vpn_details/widgets/custom_setting_item.dart';
import '../utils/custom_text_style.dart';
import 'auto_protect_page.dart';

class SettingPage extends StatelessWidget {
  static const routeName = 'setting';

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
      title: Text(CustomString.SettingAppBar),
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
              Text(CustomString.SettingTitle1,
                  style: CustomTextStyle.subTitleStyle),
              SizedBox(height: Dimensions.heightSize8 * 3),
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AutoProtectPage(),
                )),
                child: CustomSettingItem(
                  image: CustomString.autoProtect,
                  title: CustomString.S1Title,
                  subTitle: CustomString.S1SubTitle,
                  newitem: true,
                ),
              ),
              CustomSettingItem(
                image: CustomString.privacy,
                title: CustomString.S2Title,
                subTitle: CustomString.S2SubTitle,
              ),
              CustomSettingItem(
                image: CustomString.alwaysOn,
                title: CustomString.S3Title,
                subTitle: CustomString.S3SubTitle,
              ),
              CustomSettingItem(
                image: CustomString.killSwitch,
                title: CustomString.S4Title,
                subTitle: CustomString.S4SubTitle,
              ),
              SizedBox(height: Dimensions.heightSize8 * 3),
              Divider(
                color: Color(0xff129374).withOpacity(0.20),
              ),
              SizedBox(height: Dimensions.heightSize8 * 3),
              Text(CustomString.SettingTitle2,
                  style: CustomTextStyle.subTitleStyle),
              SizedBox(height: Dimensions.heightSize8 * 3),
              InkWell(
                onTap: () {
                  Share.share(Uri.parse(
                          'https://play.google.com/store/apps/details?id=com.rakibvpnnet.tagvpn&pli=1')
                      .toString());
                },
                child: CustomSettingItem(
                  image: CustomString.share,
                  title: CustomString.S5Title,
                  subTitle: CustomString.S5SubTitle,
                ),
              ),
              CustomSettingItem(
                image: CustomString.rate,
                title: CustomString.S6Title,
                subTitle: CustomString.S6SubTitle,
                newitem: true,
              ),
              SizedBox(height: Dimensions.heightSize8 * 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(CustomString.settingVpnLogo),
                  SizedBox(width: 8.w),
                  Text(CustomString.appName, style: CustomTextStyle.titleStyle),
                ],
              ),
              SizedBox(height: Dimensions.heightSize8),
              Align(
                alignment: Alignment.center,
                child: Text(CustomString.SettingVersion,
                    style: CustomTextStyle.subTitleStyleBlack400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
