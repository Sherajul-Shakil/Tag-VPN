import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tap_vpn_details/providers/authentication_provider.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'package:tap_vpn_details/utils/custom_string.dart';
import 'package:tap_vpn_details/utils/dimensions.dart';
import 'package:tap_vpn_details/views/home_screen/home_page.dart';
import 'package:tap_vpn_details/widgets/custom_design/custom_shape.dart';
import 'package:tap_vpn_details/widgets/login_signup_button.dart';
import 'package:tap_vpn_details/widgets/my_text_field.dart';
import 'package:tap_vpn_details/widgets/toast/custom_toast.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 80.h),
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
                                    fontWeight: FontWeight.w400,
                                    fontSize: 22.sp,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height / 6),
                          child: Text(
                            CustomString.changePass,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ])
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.defaultPaddingSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Dimensions.heightSize8 * 8),
                    MyTextField(
                      controller: newPasswordController,
                      title: CustomString.newPass,
                    ),
                    SizedBox(height: Dimensions.heightSize8 * 3),
                    MyTextField(
                      controller: confirmPasswordController,
                      title: CustomString.confirmPass,
                    ),
                    SizedBox(height: Dimensions.heightSize8 * 5),
                    InkWell(
                      onTap: () async {
                        await authProvider.resetPassword(
                            authProvider.emailForForgetPassword,
                            newPasswordController.text,
                            confirmPasswordController.text);

                        if (authProvider.completeChangePassword == true) {
                          CustomToast.toastShower(
                              authProvider.formalStatus.message!, Colors.green);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomePage()),
                              (Route<dynamic> route) => false);
                        } else {
                          CustomToast.toastShower(
                              "The confirm password and new password must match",
                              Colors.red);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: width / 35,
                        ),
                        child: LoginSignUpButton(
                          width: width,
                          height: height,
                          buttonName: "Save",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
