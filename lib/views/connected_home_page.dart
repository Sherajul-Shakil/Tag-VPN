// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, no_leading_underscores_for_local_identifiers, unused_local_variable, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'package:tap_vpn_details/utils/custom_string.dart';
import 'package:tap_vpn_details/utils/custom_text_style.dart';
import 'package:tap_vpn_details/utils/dimensions.dart';
import 'package:tap_vpn_details/views/drawer_page.dart';
import 'package:tap_vpn_details/views/premium_subscription_page/payment_page.dart';
import '../providers/authentication_provider.dart';
import '../widgets/custom_button.dart';
import 'authentication_screens/login_page.dart';
import 'setting_page.dart';

class ConnectedHomePage extends StatefulWidget {
  const ConnectedHomePage({Key? key}) : super(key: key);

  @override
  State<ConnectedHomePage> createState() => _ConnectedHomePageState();
}

class _ConnectedHomePageState extends State<ConnectedHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final _appbar = AppBar(
      backgroundColor: CustomColor.bgColor,
      elevation: 0,
      centerTitle: true,
      leading: InkWell(
          onTap: () {
            scaffoldKey.currentState!.openDrawer();
          },
          child: Image.asset(CustomString.drawer)),
      title: InkWell(
        onTap: () {
          // bottomDetailsSheet(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PaymentPage();
          }));
        },
        child: Container(
          height: 32.h,
          width: 134.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius),
            color: CustomColor.circle3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(CustomString.premium),
              SizedBox(width: Dimensions.widthSize),
              Text(
                CustomString.Htitle,
                style: CustomTextStyle.titleStyleBlack600,
              )
            ],
          ),
        ),
      ),
      actions: [
        Image.asset(CustomString.what),
        // Consumer<AuthenticationProvider>(
        //   builder: (context, authProvider, child) => authProvider.user == null
        //       ? Image.asset(CustomString.what)
        //       : Container(
        //           alignment: Alignment.center,
        //           height: 32.h,
        //           width: 32.w,
        //           decoration: BoxDecoration(
        //               shape: BoxShape.circle,
        //               color: CustomColor.greenMainColor),
        //           child: authProvider.user!.photoURL! != null
        //               ? ClipRRect(
        //                   borderRadius: BorderRadius.circular(100),
        //                   child: Image.network(
        //                     authProvider.user!.photoURL!,
        //                   ),
        //                 )
        //               : Text(authProvider.user!.displayName!.substring(0, 2)),
        //         ),
        // ),
        SizedBox(width: 10),
      ],
    );

    final mediaQuery = MediaQuery.of(context);
    final double _width = mediaQuery.size.width;
    final double _height = (mediaQuery.size.height -
        _appbar.preferredSize.height -
        mediaQuery.padding.top);

    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerPage(),
      appBar: _appbar,
      backgroundColor: CustomColor.bgColor,
      body: Column(
        children: [
          Container(
            height: _height * 0.45,
            width: _width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(CustomString.ConnectedLogo),
                // Stack(
                //   alignment: Alignment.center,
                //   children: [
                //     Container(
                //       width: 240.w,
                //       height: 240.h,
                //       decoration: BoxDecoration(
                //         color: CustomColor.circle3,
                //         shape: BoxShape.circle,
                //       ),
                //     ),
                //     Container(
                //       width: 180.w,
                //       height: 180.h,
                //       decoration: BoxDecoration(
                //         color: CustomColor.circle2,
                //         shape: BoxShape.circle,
                //       ),
                //     ),
                //     Container(
                //       width: 120.w,
                //       height: 120.h,
                //       decoration: BoxDecoration(
                //           color: CustomColor.circle1,
                //           shape: BoxShape.circle,
                //           border: Border.all(
                //             color: CustomColor.circle4,
                //             width: 5.w,
                //           )),
                //       child: Image.asset(CustomString.appLogo),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: _height * 0.40,
            width: _width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("00 : 10 02",
                    style: TextStyle(
                        color: CustomColor.txtColorBlue,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: width / 6,
                    right: width / 6,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColor.greenMainColor,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(width / 35),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: height / 70, bottom: height / 70),
                          child: Text(
                            "Disconnect",
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w600,
                                color: CustomColor.txtColorRedDark),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: width / 6,
                    right: width / 6,
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
                          left: width / 20,
                          top: height / 80,
                          bottom: height / 80,
                          right: width / 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage(CustomString.usaFlag),
                            ),
                          ),
                          SizedBox(
                            width: width / 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "USA",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 15.sp),
                                  ),
                                  SizedBox(
                                    width: width / 7.5,
                                  ),
                                  Text("50 ms",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                              Text("Free & Unlimited Speedfff",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                          SizedBox(
                            width: width / 30,
                          ),
                          SvgPicture.asset(
                            CustomString.wifiMedium,
                            height: height / 50,
                            width: width / 50,
                            color: CustomColor.wifiColor,
                            // color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: _height * 0.15,
            width: _width,
            child: Padding(
              padding: EdgeInsets.only(
                  left: width / 15, right: width / 15, bottom: 20.r),
              child: RichText(
                text: TextSpan(
                  text: CustomString.HSubtitle1,
                  style: CustomTextStyle.subTitleStyle,
                  children: <TextSpan>[
                    TextSpan(
                        text: CustomString.HSubtitle2,
                        style: CustomTextStyle.subTitleStyleGreen),
                    TextSpan(
                        text: CustomString.HSubtitle3,
                        style: CustomTextStyle.subTitleStyle),
                    TextSpan(
                        text: CustomString.HSubtitle4,
                        style: CustomTextStyle.subTitleStyleGreen),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // void bottomDetailsSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     builder: (context) {
  //       return Padding(
  //         padding:
  //             EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             SizedBox(height: Dimensions.heightSize8 * 8),
  //             InkWell(
  //               onTap: () => Navigator.of(context).pop(),
  //               child: Align(
  //                 alignment: Alignment.centerRight,
  //                 child: Image.asset(CustomString.back),
  //               ),
  //             ),
  //             SizedBox(height: Dimensions.heightSize8 + 2.h),
  //             Image.asset(CustomString.caleBox),
  //             SizedBox(height: Dimensions.heightSize8 * 4),
  //             Text(CustomString.PTitle, style: CustomTextStyle.titleStyle),
  //             SizedBox(height: Dimensions.heightSize8 * 3),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Image.asset(CustomString.right),
  //                 SizedBox(width: 10.w),
  //                 Text(CustomString.PremiumSubtitle1,
  //                     style: CustomTextStyle.titleStyleBlack600),
  //               ],
  //             ),
  //             SizedBox(height: Dimensions.heightSize8),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Image.asset(CustomString.right),
  //                 SizedBox(width: 10.w),
  //                 Text(CustomString.PremiumSubtitle1,
  //                     style: CustomTextStyle.titleStyleBlack600),
  //               ],
  //             ),
  //             SizedBox(height: Dimensions.heightSize8),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Image.asset(CustomString.right),
  //                 SizedBox(width: 10.w),
  //                 Text(CustomString.PremiumSubtitle1,
  //                     style: CustomTextStyle.titleStyleBlack600),
  //               ],
  //             ),
  //             SizedBox(height: Dimensions.heightSize8),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Image.asset(CustomString.right),
  //                 SizedBox(width: 10.w),
  //                 Text(CustomString.PremiumSubtitle1,
  //                     style: CustomTextStyle.titleStyleBlack600),
  //               ],
  //             ),
  //             SizedBox(height: Dimensions.heightSize8),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Image.asset(CustomString.right),
  //                 SizedBox(width: 10.w),
  //                 Text(CustomString.PremiumSubtitle1,
  //                     style: CustomTextStyle.titleStyleBlack600),
  //               ],
  //             ),
  //             SizedBox(height: Dimensions.heightSize8 * 6),
  //             Container(
  //               height: 56.h,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(Dimensions.radius),
  //                 border: Border.all(
  //                   color: CustomColor.borderColor.withOpacity(0.80),
  //                   width: 2,
  //                 ),
  //               ),
  //               child: Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: 55.r),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(CustomString.PremiumAnual,
  //                             style: CustomTextStyle.Black600medium),
  //                         Container(
  //                           alignment: Alignment.center,
  //                           height: 16.h,
  //                           width: 56.w,
  //                           decoration: BoxDecoration(
  //                             color: Color(0xff23C350),
  //                             borderRadius: BorderRadius.circular(5),
  //                           ),
  //                           child: Text(
  //                             'Best Value',
  //                             style: TextStyle(
  //                               fontWeight: FontWeight.w700,
  //                               fontSize: 8.sp,
  //                               color: Colors.white,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     SizedBox(height: Dimensions.heightSize8 / 2),
  //                     Text(CustomString.PremiumAnualDesc,
  //                         style: CustomTextStyle.Black400medium),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: Dimensions.heightSize8 * 3),
  //             Container(
  //               height: 56.h,
  //               width: double.infinity,
  //               decoration: BoxDecoration(
  //                 color: CustomColor.buttonNormalBgColor,
  //                 borderRadius: BorderRadius.circular(Dimensions.radius),
  //               ),
  //               child: Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: 55.r),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(CustomString.PremiumMonthly,
  //                         style: CustomTextStyle.Black600medium),
  //                     SizedBox(height: Dimensions.heightSize8 / 2),
  //                     Text(CustomString.PremiumMonthlyDesc,
  //                         style: CustomTextStyle.Black400medium),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: Dimensions.heightSize8 * 4),
  //             CustomButon(title: CustomString.Pbtn),
  //             Spacer(),
  //             Text(CustomString.PSubtitle2,
  //                 style: CustomTextStyle.subTitleStyle,
  //                 textAlign: TextAlign.center),
  //             SizedBox(height: Dimensions.heightSize8),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
