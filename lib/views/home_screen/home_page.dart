// ignore_for_file: use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, unused_import, await_only_futures, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:tap_vpn_details/repositories/vpn_repositiries/vpn_repository.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'package:tap_vpn_details/utils/custom_string.dart';
import 'package:tap_vpn_details/utils/custom_text_style.dart';
import 'package:tap_vpn_details/utils/dimensions.dart';
import 'package:tap_vpn_details/views/authentication_screens/login_page.dart';
import 'package:tap_vpn_details/views/drawer_page.dart';
import 'package:tap_vpn_details/views/location_select_page.dart';
import 'package:tap_vpn_details/views/premium_subscription_page/payment_page.dart';
import 'package:tap_vpn_details/widgets/custom_button.dart';
import '../../providers/authentication_provider.dart';
import '../../providers/premium_subscription_provider.dart';
import '../../providers/vpn_provider.dart';
import '../connected_home_page.dart';
import '../setting_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  static const routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
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
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SettingPage();
            }));
          },
          child: Image.asset(CustomString.what),
        ),
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
      backgroundColor: CustomColor.bgColor,
      appBar: _appbar,
      body: Column(
        children: [
          Container(
            height: _height * 0.42,
            width: _width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 180.w,
                      height: 180.h,
                      decoration: BoxDecoration(
                        color: CustomColor.circle2,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 120.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                          color: CustomColor.circle1,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: CustomColor.circle4,
                            width: 5.w,
                          )),
                      child: Image.asset(CustomString.appLogo),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: _height * 0.33,
            width: _width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return ConnectedHomePage();
                  })),
                  child: CustomButon(
                    width: _width - 100,
                    title: CustomString.HCButton,
                    titleSize: Dimensions.extraLargeTextSize,
                    isSufixcon: true,
                    sufixIconImage: CustomString.lock,
                  ),
                ),
                SizedBox(height: Dimensions.heightSize8 * 3.h),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (contxt) {
                      return LocationSelectPage();
                    }));
                  },
                  child: CustomButon(
                    width: _width - 100,
                    title: CustomString.HSLButton,
                    titleSize: Dimensions.extraLargeTextSize,
                    isSufixcon: true,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize),
            child: Container(
              padding: EdgeInsets.only(bottom: 15.r),
              alignment: Alignment.bottomCenter,
              height: _height * 0.25,
              width: _width,
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
  //                         style: CustomTextStyle.Black400),
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
  //                         style: CustomTextStyle.Black400),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: Dimensions.heightSize8 * 4),
  //             InkWell(
  //               onTap: () {
  //                 makePayment();
  //               },
  //               child: CustomButon(title: CustomString.Pbtn),
  //             ),
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

  // Future<void> makePayment() async {
  //   try {
  //     paymentIntentData =
  //         await createPaymentIntent('20', 'USD'); //json.decode(response.body);
  //     // print('Response body==>${response.body.toString()}');
  //     print('Fuk');
  //     print(paymentIntentData!['client_secret']);
  //     await Stripe.instance
  //         .initPaymentSheet(
  //             paymentSheetParameters: SetupPaymentSheetParameters(
  //                 paymentIntentClientSecret:
  //                     paymentIntentData!['client_secret'],
  //                 style: ThemeMode.dark,
  //                 merchantDisplayName: 'ANNIE'))
  //         .then((value) {
  //       print('Fuk');
  //     });

  //     ///now finally display payment sheeet
  //     displayPaymentSheet();
  //   } catch (e, s) {
  //     print('exception:$e$s');
  //   }
  // }

  // displayPaymentSheet() async {
  //   try {
  //     await Stripe.instance
  //         .presentPaymentSheet(
  //             parameters: PresentPaymentSheetParameters(
  //       clientSecret: paymentIntentData!['client_secret'],
  //       confirmPayment: true,
  //     ))
  //         .then((newValue) {
  //       print('payment intent' + paymentIntentData!['id'].toString());
  //       print(
  //           'payment intent' + paymentIntentData!['client_secret'].toString());
  //       print('payment intent' + paymentIntentData!['amount'].toString());
  //       print('payment intent' + paymentIntentData.toString());
  //       //orderPlaceApi(paymentIntentData!['id'].toString());
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text("paid successfully")));

  //       paymentIntentData = null;
  //     }).onError((error, stackTrace) {
  //       print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
  //     });
  //   } on StripeException catch (e) {
  //     print('Exception/DISPLAYPAYMENTSHEET==> $e');
  //     showDialog(
  //         context: context,
  //         builder: (_) => AlertDialog(
  //               content: Text("Cancelled "),
  //             ));
  //   } catch (e) {
  //     print('$e');
  //   }
  // }

  // //  Future<Map<String, dynamic>>
  // createPaymentIntent(String amount, String currency) async {
  //   try {
  //     Map<String, dynamic> body = {
  //       'amount': calculateAmount('20'),
  //       'currency': currency,
  //       'payment_method_types[]': 'card'
  //     };
  //     print(body);
  //     var response = await http.post(
  //         Uri.parse('https://api.stripe.com/v1/payment_intents'),
  //         body: body,
  //         headers: {
  //           'Authorization': 'Bearer sk_test_26PHem9AhJZvU623DfE1x4sd',
  //           'Content-Type': 'application/x-www-form-urlencoded'
  //         });
  //     print('Create Intent reponse ===> ${response.body.toString()}');
  //     return jsonDecode(response.body);
  //   } catch (err) {
  //     print('err charging user: ${err.toString()}');
  //   }
  // }

  // calculateAmount(String amount) {
  //   final a = (int.parse(amount)) * 100;
  //   return a.toString();
  // }
}
