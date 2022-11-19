// ignore_for_file: unnecessary_null_comparison, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tap_vpn_details/utils/custom_string.dart';
import 'package:tap_vpn_details/utils/custom_text_style.dart';
import 'package:tap_vpn_details/utils/shared_preferences/shared_preferences_data.dart';
import 'package:tap_vpn_details/widgets/slider.dart';
import '../../models/authentication/social_login_model.dart';
import '../../providers/authentication_provider.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../widgets/custom_button.dart';
import '../home_screen/home_page.dart';

class OnBordingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize),
        child: Column(
          children: [
            Container(
              height: size.height * 0.50,
              width: size.width,
              child: MySlider(
                height: size.height * 0.42,
                width: size.width,
              ),
            ),
            SizedBox(
              height: size.height * 0.50,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(CustomString.Otitle, style: CustomTextStyle.titleStyle),
                  SizedBox(height: Dimensions.heightSize8 * 2.h),
                  Text(CustomString.OSubTitle,
                      style: CustomTextStyle.subTitleStyle),
                  SizedBox(height: Dimensions.heightSize8 * 3.h),
                  InkWell(
                    onTap: () async {
                      // final LoginResult result = await FacebookAuth.instance.login(); // by default we request the email and the public profile
                      // if (result.status == LoginStatus.success) {
                      //   final AccessToken accessToken = result.accessToken!;
                      //   print("Token : ${accessToken.token}");
                      //   CustomToast.toastShower("Facebook sign in completed", Colors.green);
                      //   Navigator.push(context, MaterialPageRoute(builder: (context){
                      //     return HomePage();
                      //   }));
                      // } else {
                      //   print(result.status);
                      //   print(result.message);
                      // }
                    },
                    child: CustomButon(
                      title: CustomString.OFbButton,
                      isPrefixIcon: true,
                      prefixIconImage: CustomString.fb,
                    ),
                  ),
                  SizedBox(height: Dimensions.heightSize8 * 2.h),
                  Consumer<AuthenticationProvider>(
                    builder: (context, authProvider, child) => InkWell(
                      onTap: () {
                        authProvider.user != null
                            ? Fluttertoast.showToast(
                                msg: "Already logedIn",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0)
                            : authProvider.signInWithGoogle().then((value) {
                                if (value.user != null) {
                                  final userModel = UserModel(
                                    uId: value.user!.uid,
                                    name: value.user!.displayName ??
                                        'Not Available',
                                    mobile: value.user!.phoneNumber ??
                                        'Not Available',
                                    email: value.user!.email!,
                                    image: value.user!.photoURL,
                                    userCreationTime: Timestamp.fromDate(
                                        value.user!.metadata.creationTime!),
                                  );
                                  authProvider
                                      .addUserGoogleLogIn(userModel)
                                      .then((value) {
                                    SharedPreferencesData.setLoggedIn(
                                        isLoggedIn: true);
                                    print('Pref Data');
                                    print(SharedPreferencesData.getLoggedIn());

                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HomePage();
                                    }));
                                  });
                                }
                              }).catchError((e) {
                                print(e.toString());
                              });
                      },
                      child: CustomButon(
                        title: CustomString.OGoogleButton,
                        isPrefixIcon: true,
                        prefixIconImage: CustomString.google,
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.heightSize8 * 2.h),
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePage();
                    })),
                    child: CustomButon(title: CustomString.OSkipButton),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
