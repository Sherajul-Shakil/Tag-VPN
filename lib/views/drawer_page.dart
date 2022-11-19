// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'package:tap_vpn_details/utils/custom_string.dart';
import 'package:tap_vpn_details/utils/custom_text_style.dart';
import 'package:tap_vpn_details/utils/shared_preferences/shared_preferences_data.dart';
import 'package:tap_vpn_details/views/authentication_screens/login_page.dart';
import 'package:tap_vpn_details/views/premium_subscription_page/premium_subscription_page.dart';

import '../providers/authentication_provider.dart';
import 'setting_page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.highlight_remove,
                size: width / 12,
                color: CustomColor.greenMainColor,
              ),
            ),
            SizedBox(
              height: 29.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Consumer<AuthenticationProvider>(
                //   builder: (context, authProvider, child) =>
                //       authProvider.user == null?
                Container(
                  height: 70.h,
                  width: 70.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: CustomColor.circle4, shape: BoxShape.circle),
                  child: Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                        color: CustomColor.circle1, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: Image.asset(
                      CustomString.appLogo,
                      height: 30,
                      width: 30,
                    ),
                  ),
                )
                // : Container(
                //     alignment: Alignment.center,
                //     height: 60.h,
                //     width: 60.w,
                //     decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         color: CustomColor.greenMainColor),
                //     child: authProvider.user!.photoURL! != null
                //         ? ClipRRect(
                //             borderRadius: BorderRadius.circular(100),
                //             child: Image.network(
                //               authProvider.user!.photoURL!,
                //               fit: BoxFit.cover,
                //             ),
                //           )
                //         : Text(
                //             authProvider.user!.displayName!
                //                 .substring(0, 2),
                //             style: TextStyle(color: Colors.black),
                //           ),
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Consumer<AuthenticationProvider>(
              builder: (context, authProvider, child) => InkWell(
                onTap: () {
                  try {
                    if (SharedPreferencesData.getLoggedIn() == true) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PremiumSubscriptionPage();
                      }));
                    } else {
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Alert",
                        desc: "Need To Log In First",
                        buttons: [
                          DialogButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LogInPage(),
                                )),
                            width: width / 40,
                            child: Text(
                              "OK",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      ).show();
                    }
                  } catch (error) {
                    Alert(
                      context: context,
                      type: AlertType.error,
                      title: "Alert",
                      desc: "Need To Log In First",
                      buttons: [
                        DialogButton(
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ).show();
                    print(error.toString());
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: width / 55,
                    right: width / 40,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomColor.greenMainColor,
                      border: Border.all(
                        color: CustomColor.greenMainColor,
                        width: width / 180,
                      ),
                      borderRadius: BorderRadius.circular(width / 35),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height / 70, bottom: height / 70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            CustomString.diamondShape,
                            width: width / 20,
                            height: width / 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: width / 20,
                          ),
                          Text(
                            "Go Premium".toUpperCase(),
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Consumer<AuthenticationProvider>(
                builder: (context, authProvider, child) =>
                    authProvider.user == null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Need to Sign In?  ',
                                  style: CustomTextStyle.subTitleStyle),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LogInPage(),
                                  ));
                                },
                                child: Text('Sign In',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: CustomColor.txtColorGreen)),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                authProvider.user!.email!,
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //   builder: (context) => LogInPage(),
                                  // ));
                                },
                                child: Text('Sign Out',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: CustomColor.txtColorGreen)),
                              ),
                            ],
                          )),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.only(
                left: width / 55,
                right: width / 40,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CustomColor.greenMainColor,
                    width: width / 180,
                  ),
                  borderRadius: BorderRadius.circular(width / 35),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: height / 70, bottom: height / 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width / 8,
                      ),
                      SvgPicture.asset(
                        CustomString.rotate,
                        width: width / 20,
                        height: width / 20,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: width / 25,
                      ),
                      Text(
                        "Restore Purchase",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 46,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width / 55,
                right: width / 40,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CustomColor.greenMainColor,
                    width: width / 180,
                  ),
                  borderRadius: BorderRadius.circular(width / 35),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: height / 70, bottom: height / 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width / 8,
                      ),
                      Image.asset(
                        CustomString.headPhoneIcon,
                        width: width / 20,
                        height: width / 20,
                      ),
                      SizedBox(
                        width: width / 25,
                      ),
                      Text(
                        "Contact Support",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 46,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width / 55,
                right: width / 40,
              ),
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SettingPage(),
                )),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CustomColor.greenMainColor,
                      width: width / 180,
                    ),
                    borderRadius: BorderRadius.circular(width / 35),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: height / 70, bottom: height / 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width / 8,
                        ),
                        SvgPicture.asset(
                          CustomString.settingsIcon,
                          width: width / 20,
                          height: width / 20,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: width / 25,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 46,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width / 55,
                right: width / 40,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CustomColor.greenMainColor,
                    width: width / 180,
                  ),
                  borderRadius: BorderRadius.circular(width / 35),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: height / 70, bottom: height / 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width / 8,
                      ),
                      SvgPicture.asset(
                        CustomString.questionCircleIcon,
                        width: width / 20,
                        height: width / 20,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: width / 25,
                      ),
                      Text(
                        "FAQ",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
