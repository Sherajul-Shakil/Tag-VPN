// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:tap_vpn_details/providers/authentication_provider.dart';
import 'package:tap_vpn_details/providers/device_info_provider.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'package:tap_vpn_details/utils/shared_preferences/shared_preferences_data.dart';
import 'package:tap_vpn_details/views/authentication_screens/forget_password_page.dart';
import 'package:tap_vpn_details/views/authentication_screens/signup_page.dart';
import 'package:tap_vpn_details/views/home_screen/home_page.dart';
import 'package:tap_vpn_details/widgets/custom_button.dart';
import 'package:tap_vpn_details/widgets/custom_design/custom_shape.dart';
import 'package:tap_vpn_details/widgets/login_signup_button.dart';
import 'package:tap_vpn_details/widgets/toast/custom_toast.dart';
import '../../models/authentication/social_login_model.dart';
import '../../utils/custom_string.dart';
import '../../utils/custom_text_style.dart';
import '../../utils/dimensions.dart';
import '../../widgets/my_text_field.dart';

class LogInPage extends StatefulWidget {
  static const routeName = 'login';

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer();
    _tapGestureRecognizer.onTap = signUpPageRecognizer;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    DeviceInfoProvider deviceInfoProvider =
        await Provider.of<DeviceInfoProvider>(context, listen: false);
    await deviceInfoProvider.initPlatformState();
  }

  void signUpPageRecognizer() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SignUpPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer<DeviceInfoProvider>(builder: (_, deviceInfoProvider, ___) {
      return Consumer<AuthenticationProvider>(builder: (_, authProvider, ___) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: CustomShape(),
                      child: Container(
                        height: 350,
                        color: CustomColor.circle3,
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 80.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                CustomString.loginLogo,
                              ),
                              SizedBox(
                                width: width / 35,
                              ),
                              Text(
                                CustomString.appName,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22.sp,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height / 8),
                          child: Text(
                            CustomString.logIn,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.defaultPaddingSize),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.heightSize8 * 2),
                      MyTextField(
                        controller: emailController,
                        title: CustomString.logInTextField1,
                      ),
                      SizedBox(height: Dimensions.heightSize8 * 2),
                      MyTextField(
                        controller: passwordController,
                        title: CustomString.logInTextField2,
                      ),
                      SizedBox(height: Dimensions.heightSize8 * 2),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.r),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ForgetPasswordPage();
                            }));
                          },
                          child: Text(CustomString.forgetPassword,
                              style: CustomTextStyle.subTitleStylegreenNormal),
                        ),
                      ),
                      SizedBox(height: Dimensions.heightSize8 * 2),
                      InkWell(
                        onTap: () async {
                          await authProvider.loginUserInfo(
                              emailController.text,
                              passwordController.text,
                              deviceInfoProvider.isAndroid == true
                                  ? "${deviceInfoProvider.androidDeviceInfoFromUser.brand} ${deviceInfoProvider.androidDeviceInfoFromUser.device}"
                                  : "${deviceInfoProvider.iosDeviceInfoFromUser.name} ${deviceInfoProvider.iosDeviceInfoFromUser.model}",
                              deviceInfoProvider.isAndroid == true
                                  ? "${deviceInfoProvider.androidDeviceInfoFromUser.id}"
                                  : "${deviceInfoProvider.iosDeviceInfoFromUser.id}");

                          var userEmail = authProvider.loginUser.data!.email;
                          bool status = authProvider.loginUser.success!;
                          if (status == true) {
                            SharedPreferencesData.setLoggedIn(isLoggedIn: true);
                            SharedPreferencesData()
                                .setUserEmail(email: userEmail!);
                            //print("${SharedPreferencesData().getUserEmail()}");
                            final res =
                                await SharedPreferencesData().getUserEmail();

                            CustomToast.toastShower(
                                authProvider.loginUser.message!, Colors.green);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
                          } else {
                            CustomToast.toastShower(
                                authProvider.loginUser.message!, Colors.red);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: CustomButon(
                            title: 'Log In',
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.heightSize8 * 3),
                      Align(
                        alignment: Alignment.center,
                        child: Text(CustomString.Or,
                            style: CustomTextStyle.subTitleStylegreenNormal),
                      ),
                      SizedBox(height: Dimensions.heightSize8 * 3),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
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
                                      : authProvider
                                          .signInWithGoogle()
                                          .then((value) {
                                          if (value.user != null) {
                                            final userModel = UserModel(
                                              uId: value.user!.uid,
                                              name: value.user!.displayName ??
                                                  'Not Available',
                                              mobile: value.user!.phoneNumber ??
                                                  'Not Available',
                                              email: value.user!.email!,
                                              image: value.user!.photoURL,
                                              userCreationTime:
                                                  Timestamp.fromDate(value.user!
                                                      .metadata.creationTime!),
                                            );
                                            authProvider
                                                .addUserGoogleLogIn(userModel)
                                                .then((value) {
                                              SharedPreferencesData.setLoggedIn(
                                                  isLoggedIn: true);
                                              CustomToast.toastShower(
                                                  authProvider
                                                          .loginUser.message ??
                                                      'lOGIN SUCCESSFULLY',
                                                  Colors.green);
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return HomePage();
                                              }));
                                            });
                                          }
                                        }).catchError((e) {
                                          print(e.toString());
                                        });
                                },
                                child: CustomButon(
                                  title: CustomString.google_,
                                  isPrefixIcon: true,
                                  prefixIconImage: CustomString.Google,
                                  bacgoundColor: Color(0xffE1F7F2),
                                  titleColor: Color(0xff475569),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Expanded(
                              child: CustomButon(
                                title: CustomString.facebook_,
                                isPrefixIcon: true,
                                prefixIconImage: CustomString.LoginFb,
                                imageHeight: 15,
                                imageWidth: 15,
                                bacgoundColor: Color(0xffE1F7F2),
                                titleColor: Color(0xff475569),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account?  ",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Create now",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: CustomColor.txtColorGreen),
                        recognizer: _tapGestureRecognizer,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      });
    });
  }
}
