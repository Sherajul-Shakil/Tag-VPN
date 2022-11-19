// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tap_vpn_details/providers/authentication_provider.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'package:tap_vpn_details/utils/custom_string.dart';
import 'package:tap_vpn_details/utils/custom_text_style.dart';
import 'package:tap_vpn_details/views/authentication_screens/login_page.dart';
import 'package:tap_vpn_details/widgets/custom_button.dart';
import 'package:tap_vpn_details/widgets/custom_design/custom_shape.dart';
import 'package:tap_vpn_details/widgets/custom_form_field/custom_password_form_field.dart';
import 'package:tap_vpn_details/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:tap_vpn_details/widgets/login_signup_button.dart';
import 'package:tap_vpn_details/widgets/toast/custom_toast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final reTypePasswordController = TextEditingController();
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer();
    _tapGestureRecognizer.onTap = loginPageRecognizer;
  }

  void loginPageRecognizer() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LogInPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer<AuthenticationProvider>(builder: (_, authProvider, ___) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                    Column(children: [
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
                        padding: EdgeInsets.only(top: height / 6),
                        child: Text(
                          CustomString.signUp,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ])
                  ],
                ),
                SizedBox(height: height / 100),
                Padding(
                  padding: EdgeInsets.only(
                      left: width / 14, right: width / 14, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(CustomString.name, style: CustomTextStyle.Black400),
                      SizedBox(
                        height: height / 22,
                        child: CustomTextFormField(
                          textEditingController: nameController,
                          isName: true,
                          validText: "Enter Your Name",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 40),
                Padding(
                  padding: EdgeInsets.only(left: width / 14, right: width / 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(CustomString.logInTextField1,
                          style: CustomTextStyle.Black400),
                      SizedBox(
                        height: height / 22,
                        child: CustomTextFormField(
                          textEditingController: emailController,
                          isName: false,
                          validText: "Enter a correct email",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 40),
                Padding(
                  padding: EdgeInsets.only(left: width / 14, right: width / 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(CustomString.logInTextField2,
                          style: CustomTextStyle.Black400),
                      SizedBox(
                        height: height / 22,
                        child: CustomPasswordFormField(
                            textEditingController: passwordController,
                            isPassword: true,
                            validText:
                                "Please give at least 8 numbers for password"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 40),
                Padding(
                  padding: EdgeInsets.only(left: width / 14, right: width / 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(CustomString.reTypePassword,
                          style: CustomTextStyle.Black400),
                      SizedBox(
                        height: height / 22,
                        child: CustomPasswordFormField(
                          textEditingController: reTypePasswordController,
                          isPassword: false,
                          validText: "",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 40,
                ),
                InkWell(
                  onTap: () async {
                    if (passwordController.text ==
                        reTypePasswordController.text) {
                      await authProvider.registerNewUser(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                          reTypePasswordController.text);
                      bool status =
                          authProvider.registrationSuccessful.success!;

                      if (status == true) {
                        CustomToast.toastShower(
                            "${authProvider.registrationSuccessful.message}",
                            Colors.green);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LogInPage();
                        }));
                      } else {
                        CustomToast.toastShower(
                            "Registration Failed", Colors.red);
                      }
                    } else {
                      CustomToast.toastShower(
                          "Passwords are not same", Colors.red);
                    }
                  },
                  child: LoginSignUpButton(
                    width: width,
                    height: height,
                    buttonName: "Sign Up",
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(CustomString.Or,
                      style: CustomTextStyle.subTitleStylegreenNormal),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButon(
                          title: CustomString.google_,
                          isPrefixIcon: true,
                          prefixIconImage: CustomString.Google,
                          bacgoundColor: Color(0xffE1F7F2),
                          titleColor: Color(0xff475569),
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
                ),
                SizedBox(
                  height: 24.h,
                ),
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Login Now",
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
                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
