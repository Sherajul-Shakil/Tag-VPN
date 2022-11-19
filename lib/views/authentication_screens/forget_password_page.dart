import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tap_vpn_details/providers/authentication_provider.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'package:tap_vpn_details/utils/custom_string.dart';
import 'package:tap_vpn_details/utils/custom_text_style.dart';
import 'package:tap_vpn_details/views/authentication_screens/otp_code_page.dart';
import 'package:tap_vpn_details/widgets/toast/custom_toast.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer<AuthenticationProvider>(builder: (_, authProvider, ___) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Icon(Icons.arrow_back),
          centerTitle: true,
          title: Text(
            "Forget Password",
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: width / 20,
                    right: width / 20,
                  ),
                  child: Divider(
                    height: height / 50,
                    thickness: 2.5,
                    color: CustomColor.greenMainColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 2, right: width / 20),
                  child: Divider(
                    height: height / 50,
                    thickness: 2.5,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 20, top: height / 50),
              child: Text(
                "Forget Password",
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width / 20, top: 24.h, right: width / 20),
              child: Text(
                "Enter your email address and we will send your code.",
                maxLines: 2,
                style:
                    TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(height: height / 30),
            Padding(
              padding: EdgeInsets.only(left: width / 20, right: width / 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(CustomString.logInTextField1,
                      style: CustomTextStyle.Black400),
                  SizedBox(
                    height: height / 22,
                    child: TextField(
                      controller: emailController,
                      style: CustomTextStyle.subTitleStyle,
                      cursorColor: CustomColor.blackNormal,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height / 30),
            GestureDetector(
              onTap: () async {
                if (authProvider.isForgetPasswordPageButtonPressed == false) {
                  authProvider.isForgetPasswordPageButtonPressed = true;
                  authProvider.emailForForgetPassword = emailController.text;
                  await authProvider
                      .sendOtp(authProvider.emailForForgetPassword);
                  bool status = authProvider.formalStatus.success!;
                  if (status == true) {
                    CustomToast.toastShower(
                        authProvider.formalStatus.message!, Colors.green);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return OTPCodePage();
                    }));
                  } else {
                    authProvider.isForgetPasswordPageButtonPressed = false;
                    CustomToast.toastShower(
                        authProvider.formalStatus.message!, Colors.red);
                  }
                } else {}
              },
              child: Padding(
                padding: EdgeInsets.only(left: width / 20, right: width / 20),
                child: Container(
                  alignment: Alignment.center,
                  height: 46.h,
                  decoration: BoxDecoration(
                      color: authProvider.isForgetPasswordPageButtonPressed ==
                              false
                          ? CustomColor.greenMainColor
                          : Colors.white,
                      border: Border.all(
                        color: authProvider.isForgetPasswordPageButtonPressed ==
                                false
                            ? CustomColor.greenMainColor
                            : Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(
                        width / 40,
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: height / 100,
                      bottom: height / 100,
                      left: width / 3.3,
                      right: width / 3.8,
                    ),
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color:
                              authProvider.isForgetPasswordPageButtonPressed ==
                                      false
                                  ? Colors.white
                                  : Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
