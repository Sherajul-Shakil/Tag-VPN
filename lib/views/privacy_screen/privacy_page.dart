// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'package:tap_vpn_details/utils/custom_string.dart';
import 'package:tap_vpn_details/utils/custom_text_style.dart';
import 'package:tap_vpn_details/utils/dimensions.dart';
import 'package:tap_vpn_details/views/privacy_screen/privacy_details_page.dart';
import '../../widgets/custom_button.dart';
import '../onbording_screen/onBording_page.dart';

class PrivacyPage extends StatelessWidget {
  static const routeName = 'privacy';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.bgColor,
        appBar: AppBar(
          backgroundColor: CustomColor.bgColor,
          elevation: 0,
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(CustomString.Ptitle, style: CustomTextStyle.titleStyle),
              SizedBox(height: Dimensions.heightSize),
              Text(CustomString.PsubTitle1,
                  style: CustomTextStyle.subTitleStyle),
              SizedBox(height: Dimensions.heightSize8),
              Text(CustomString.PsubTitle2,
                  style: CustomTextStyle.subTitleStyle),
              SizedBox(height: Dimensions.heightSize8),
              Text(CustomString.Ptitle2,
                  style: CustomTextStyle.subTitleStyleW500),
              SizedBox(height: Dimensions.heightSize8 / 2.h),
              Padding(
                padding: EdgeInsets.only(left: Dimensions.PaddingSize8),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.r),
                          child: Icon(Icons.circle,
                              color: CustomColor.txtColorBlack, size: 7),
                        ),
                        SizedBox(width: Dimensions.widthSize),
                        Expanded(
                          child: Column(
                            children: [
                              Text(CustomString.Pcollect1,
                                  style: CustomTextStyle.subTitleStyle),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: Dimensions.heightSize8 / 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.r),
                          child: Icon(Icons.circle,
                              color: CustomColor.txtColorBlack, size: 7),
                        ),
                        SizedBox(width: Dimensions.widthSize),
                        Expanded(
                          child: Column(
                            children: [
                              Text(CustomString.Pcollect1,
                                  style: CustomTextStyle.subTitleStyle),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: Dimensions.heightSize8 / 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.r),
                          child: Icon(Icons.circle,
                              color: CustomColor.txtColorBlack, size: 7),
                        ),
                        SizedBox(width: Dimensions.widthSize),
                        Expanded(
                          child: Column(
                            children: [
                              Text(CustomString.Pcollect1,
                                  style: CustomTextStyle.subTitleStyle),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: Dimensions.heightSize8 / 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.r),
                          child: Icon(Icons.circle,
                              color: CustomColor.txtColorBlack, size: 7),
                        ),
                        SizedBox(width: Dimensions.widthSize),
                        Expanded(
                          child: Column(
                            children: [
                              Text(CustomString.Pcollect1,
                                  style: CustomTextStyle.subTitleStyle),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: Dimensions.heightSize8),
                  ],
                ),
              ),
              Text(CustomString.PsubTitle3,
                  style: CustomTextStyle.subTitleStyle),
              SizedBox(height: Dimensions.heightSize8 / 2.h),
              InkWell(
                onTap: () {
                  // bottomDetailsSheet(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PrivacyDetailsPage();
                  }));
                },
                child: Text(CustomString.Ptitle3,
                    style: CustomTextStyle.subTitleStyleW500Green),
              ),
              Spacer(),
              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return OnBordingPage();
                })),
                child: CustomButon(title: CustomString.PbuttonText),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              )
            ],
          ),
        ),
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
  //         child: SingleChildScrollView(
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.max,
  //               children: [
  //                 SizedBox(height: Dimensions.heightSize8 * 8),
  //                 InkWell(
  //                   onTap: () => Navigator.of(context).pop(),
  //                   child: Align(
  //                     alignment: Alignment.centerRight,
  //                     child: Image.asset(CustomString.back),
  //                   ),
  //                 ),
  //                 SizedBox(height: Dimensions.heightSize8 / 2.h),
  //                 SizedBox(height: Dimensions.heightSize8 / 2.h),
  //                 Text(
  //                     'Our Services may be accessed from all around the world, so it is your responsibility to assess whether your use of the Services is in compliance with applicable laws and regulations. You may not be able to access the Services if you are located in any of the countries where using, accessing, or subscribing to the Services would violate of export privacy policy.'
  //                     'Whenever you use the Services, you must comply with these Terms and applicable laws, regulations, and policies.'
  //                     ' TagVPN aims to provide the best service possible to all of our Subscribers. In that sense, we require that you do not misuse our Content or Services. A misuse refers to any use, access, or interference with the Content or Services contrary to the Terms or applicable laws and regulations. '
  //                     '   In order to protect the Services from being misused or used to harm someone, TagVPN reserves the right to take appropriate measures when our Services are being used contrary to these Terms and applicable laws. You agree that TagVPN may restrict access to any part of the Services, terminate your Account, or take any other legal measure provided by law, without providing a refund for Services already paid, if we believe at our absolute discretion that you have misused the Services.',
  //                     textAlign: TextAlign.justify),
  //                 SizedBox(height: Dimensions.heightSize8 / 2.h),
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Padding(
  //                       padding: EdgeInsets.only(top: 5.r),
  //                       child: Icon(Icons.circle,
  //                           color: CustomColor.txtColorBlack, size: 7),
  //                     ),
  //                     SizedBox(width: Dimensions.widthSize),
  //                     Expanded(
  //                       child: Column(
  //                         children: [
  //                           Text(
  //                               'Send or transmit unsolicited advertisements or content (i.e., “spam") over the Services.',
  //                               style: CustomTextStyle.subTitleStyle),
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //                 SizedBox(height: Dimensions.heightSize8 / 2.h),
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Padding(
  //                       padding: EdgeInsets.only(top: 5.r),
  //                       child: Icon(Icons.circle,
  //                           color: CustomColor.txtColorBlack, size: 7),
  //                     ),
  //                     SizedBox(width: Dimensions.widthSize),
  //                     Expanded(
  //                       child: Column(
  //                         children: [
  //                           Text(
  //                               'Send, post, or transmit over the Services any content which is illegal, hateful, threatening, insulting, deceptive or defamatory; infringes TagVPN or third parties’ intellectual property rights; invades privacy; or incites violence or any unlawful behaviour.',
  //                               style: CustomTextStyle.subTitleStyle,
  //                               textAlign: TextAlign.justify),
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //                 SizedBox(height: Dimensions.heightSize8 / 2.h),
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Padding(
  //                       padding: EdgeInsets.only(top: 5.r),
  //                       child: Icon(Icons.circle,
  //                           color: CustomColor.txtColorBlack, size: 7),
  //                     ),
  //                     SizedBox(width: Dimensions.widthSize),
  //                     Expanded(
  //                       child: Column(
  //                         children: [
  //                           Text(
  //                               'Upload, download, post, reproduce, or distribute any content protected by copyright or any other proprietary right without first having obtained permission from the owner / licensor of the proprietary content.',
  //                               style: CustomTextStyle.subTitleStyle,
  //                               textAlign: TextAlign.justify),
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //                 SizedBox(height: Dimensions.heightSize8 / 2.h),
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Padding(
  //                       padding: EdgeInsets.only(top: 5.r),
  //                       child: Icon(Icons.circle,
  //                           color: CustomColor.txtColorBlack, size: 7),
  //                     ),
  //                     SizedBox(width: Dimensions.widthSize),
  //                     Expanded(
  //                       child: Column(
  //                         children: [
  //                           Text(
  //                             'Upload, download, post, reproduce, or distribute any content that includes sexual or explicit depictions of minors, or content that is similarly restricted / prohibited in your country. ',
  //                             style: CustomTextStyle.subTitleStyle,
  //                             textAlign: TextAlign.justify,
  //                           ),
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //                 SizedBox(height: Dimensions.heightSize8 / 2.h),
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Padding(
  //                       padding: EdgeInsets.only(top: 5.r),
  //                       child: Icon(Icons.circle,
  //                           color: CustomColor.txtColorBlack, size: 7),
  //                     ),
  //                     SizedBox(width: Dimensions.widthSize),
  //                     Expanded(
  //                       child: Column(
  //                         children: [
  //                           Text(
  //                               'Engage in any conduct that restricts or inhibits any other Subscriber from using or enjoying the Services.',
  //                               style: CustomTextStyle.subTitleStyle),
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //                 SizedBox(height: Dimensions.heightSize8 / 2.h),
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Padding(
  //                       padding: EdgeInsets.only(top: 5.r),
  //                       child: Icon(Icons.circle,
  //                           color: CustomColor.txtColorBlack, size: 7),
  //                     ),
  //                     SizedBox(width: Dimensions.widthSize),
  //                     Expanded(
  //                       child: Column(
  //                         children: [
  //                           Text(
  //                               'Attempt to access, probe, or connect to computing devices without proper authorization (i.e., any form of “hacking”).',
  //                               style: CustomTextStyle.subTitleStyle),
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //                 SizedBox(height: Dimensions.heightSize8 / 2.h),
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Padding(
  //                       padding: EdgeInsets.only(top: 5.r),
  //                       child: Icon(Icons.circle,
  //                           color: CustomColor.txtColorBlack, size: 7),
  //                     ),
  //                     SizedBox(width: Dimensions.widthSize),
  //                     Expanded(
  //                       child: Column(
  //                         children: [
  //                           Text(
  //                               'Attempt to compile, utilize, or distribute a list of IP addresses operated by TagVPN in conjunction with the Services.',
  //                               style: CustomTextStyle.subTitleStyle),
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //                 SizedBox(height: Dimensions.heightSize8 / 2.h),
  //                 Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Padding(
  //                       padding: EdgeInsets.only(top: 5.r),
  //                       child: Icon(Icons.circle,
  //                           color: CustomColor.txtColorBlack, size: 7),
  //                     ),
  //                     SizedBox(width: Dimensions.widthSize),
  //                     Expanded(
  //                       child: Column(
  //                         children: [
  //                           Text(
  //                               'Use the Services for anything other than lawful purposes.',
  //                               style: CustomTextStyle.subTitleStyle),
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //                 SizedBox(height: Dimensions.heightSize8 / 2.h),
  //                 SizedBox(height: Dimensions.heightSize8),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
