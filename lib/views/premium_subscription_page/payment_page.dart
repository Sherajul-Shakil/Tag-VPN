import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'package:tap_vpn_details/utils/custom_string.dart';
import 'package:tap_vpn_details/utils/custom_text_style.dart';
import 'package:tap_vpn_details/utils/dimensions.dart';
import 'package:tap_vpn_details/widgets/custom_button.dart';
import 'package:http/http.dart' as http;

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Map<String, dynamic>? paymentIntentData;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: Dimensions.heightSize8 * 8),
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(CustomString.back),
            ),
          ),
          SizedBox(height: Dimensions.heightSize8 + 2.h),
          Image.asset(CustomString.caleBox),
          SizedBox(height: Dimensions.heightSize8 * 4),
          Text(CustomString.PTitle, style: CustomTextStyle.titleStyle),
          SizedBox(height: Dimensions.heightSize8 * 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: Dimensions.widthSize * 5,
              ),
              Image.asset(CustomString.right),
              SizedBox(width: 10.w),
              Text(CustomString.PremiumSubtitle1,
                  style: CustomTextStyle.titleStyleBlack600),
            ],
          ),
          SizedBox(height: Dimensions.heightSize8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: Dimensions.widthSize * 5,
              ),
              Image.asset(CustomString.right),
              SizedBox(width: 10.w),
              Text(CustomString.PremiumSubtitle2,
                  style: CustomTextStyle.titleStyleBlack600),
            ],
          ),
          SizedBox(height: Dimensions.heightSize8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: Dimensions.widthSize * 5,
              ),
              Image.asset(CustomString.right),
              SizedBox(width: 10.w),
              Text(CustomString.PremiumSubtitle3,
                  style: CustomTextStyle.titleStyleBlack600),
            ],
          ),
          SizedBox(height: Dimensions.heightSize8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: Dimensions.widthSize * 5,
              ),
              Image.asset(CustomString.right),
              SizedBox(width: 10.w),
              Text(CustomString.PremiumSubtitle4,
                  style: CustomTextStyle.titleStyleBlack600),
            ],
          ),
          SizedBox(height: Dimensions.heightSize8),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Image.asset(CustomString.right),
          //     SizedBox(width: 10.w),
          //     Text(CustomString.PremiumSubtitle1,
          //         style: CustomTextStyle.titleStyleBlack600),
          //   ],
          // ),
          SizedBox(height: Dimensions.heightSize8 * 6),
          Container(
            height: 56.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              border: Border.all(
                color: CustomColor.borderColor.withOpacity(0.80),
                width: 2,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 55.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(CustomString.PremiumAnual,
                          style: CustomTextStyle.Black600medium),
                      Container(
                        alignment: Alignment.center,
                        height: 16.h,
                        width: 56.w,
                        decoration: BoxDecoration(
                          color: Color(0xff23C350),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'Best Value',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 8.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Dimensions.heightSize8 / 2),
                  Text(CustomString.PremiumAnualDesc,
                      style: CustomTextStyle.Black400),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize8 * 3),
          Container(
            height: 56.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: CustomColor.buttonNormalBgColor,
              borderRadius: BorderRadius.circular(Dimensions.radius),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 55.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(CustomString.PremiumMonthly,
                      style: CustomTextStyle.Black600medium),
                  SizedBox(height: Dimensions.heightSize8 / 2),
                  Text(CustomString.PremiumMonthlyDesc,
                      style: CustomTextStyle.Black400),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize8 * 4),
          InkWell(
            onTap: () {
              makePayment();
            },
            child: CustomButon(title: CustomString.Pbtn),
          ),
          Spacer(),
          Text(CustomString.PSubtitle2,
              style: CustomTextStyle.subTitleStyle,
              textAlign: TextAlign.center),
          SizedBox(height: Dimensions.heightSize),
        ],
      ),
    )));
  }

  Future<void> makePayment() async {
    try {
      paymentIntentData =
          await createPaymentIntent('20', 'USD'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      print('Fuk');
      print(paymentIntentData!['client_secret']);
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  style: ThemeMode.dark,
                  merchantDisplayName: 'ANNIE'))
          .then((value) {
        print('Fuk');
      });

      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet(
              parameters: PresentPaymentSheetParameters(
        clientSecret: paymentIntentData!['client_secret'],
        confirmPayment: true,
      ))
          .then((newValue) {
        print('payment intent' + paymentIntentData!['id'].toString());
        print(
            'payment intent' + paymentIntentData!['client_secret'].toString());
        print('payment intent' + paymentIntentData!['amount'].toString());
        print('payment intent' + paymentIntentData.toString());
        //orderPlaceApi(paymentIntentData!['id'].toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("paid successfully")));

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer sk_test_26PHem9AhJZvU623DfE1x4sd',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
