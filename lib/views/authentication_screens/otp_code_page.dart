import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:tap_vpn_details/providers/authentication_provider.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'package:tap_vpn_details/views/authentication_screens/change_password_page.dart';
import 'package:tap_vpn_details/widgets/toast/custom_toast.dart';
import '../../widgets/pinput_design/dark_rounded_pin_put.dart';

class OTPCodePage extends StatefulWidget {
  const OTPCodePage({Key? key}) : super(key: key);

  @override
  State<OTPCodePage> createState() => _OTPCodePageState();
}

class _OTPCodePageState extends State<OTPCodePage> {



  TextEditingController otpPinController = TextEditingController();
  final focusNode = FocusNode();
  final DarkRoundedPinPut _darkRoundedPinPut = DarkRoundedPinPut();





  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Consumer<AuthenticationProvider>(
      builder: (_,authProvider,___) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: const Icon(Icons.arrow_back),
            centerTitle: true,
            title: Text(
              "Forget Password",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.normal),
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
                    padding:  EdgeInsets.only(
                      left: width/20,
                      right: width/20,
                    ),
                    child: Divider(
                      height: height/50,
                      thickness: 2.5,
                      color: CustomColor.greenMainColor,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                        left: width/2,
                        right: width/20
                    ),
                    child: Divider(
                      height: height/50,
                      thickness: 2.5,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              Padding(
                padding:  EdgeInsets.only(
                    left: width/20,
                    top: height/50
                ),
                child: Text(
                  "Forget Password",
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Padding(
                padding:  EdgeInsets.only(
                    left: width/20,
                    top: height/30,
                    right: width/20
                ),
                child: Text(
                  "Check Your mail and submitted your code.",
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal
                  ),
                ),
              ),
              // Padding(
              //   padding:  EdgeInsets.only(
              //       left: width/20,
              //       top: height/30,
              //       right: width/20
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       _textFieldOTP(first: true, last: false),
              //       _textFieldOTP(first: false, last: false),
              //       _textFieldOTP(first: false, last: false),
              //       _textFieldOTP(first: false, last: false),
              //       _textFieldOTP(first: false, last: true),
              //     ],
              //   ),
              // ),

              Padding(
                padding: EdgeInsets.only(
                    left: width / 20, top: height / 30, right: width / 20),
                child: Pinput(
                  focusNode: focusNode,
                  defaultPinTheme: _darkRoundedPinPut.defaultPinTheme,
                  focusedPinTheme: _darkRoundedPinPut.focusedPinTheme(),
                  followingPinTheme: _darkRoundedPinPut.followingPinTheme(),
                  submittedPinTheme: _darkRoundedPinPut.submittedPinTheme(),
                  showCursor: false,
                  length: 5,
                  controller: otpPinController,
                  onCompleted: (String pin) {
                    authProvider.otpPin = pin;
                  },
                ),
              ),
              SizedBox(height: height/30),
              Padding(
                padding:  EdgeInsets.only(left:width/5),
                child: InkWell(
                  onTap: ()async{
                    await authProvider.sendOtp(authProvider.emailForForgetPassword);
                  },
                  child: const Text(
                    "Didn't get the OTP? Resent OTP", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              ),
              SizedBox(height: height/30),
              GestureDetector(
                onTap: ()async{
                  await authProvider.verifyOtp(authProvider.emailForForgetPassword, authProvider.otpPin);
                  bool status = authProvider.formalStatus.success!;
                  if(status == true){
                    CustomToast.toastShower(authProvider.formalStatus.message!, Colors.green);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => ChangePasswordPage()),
                            (Route<dynamic> route) => false);
                  }
                  else{
                    CustomToast.toastShower(authProvider.formalStatus.message!, Colors.red);
                  }


                  // Navigator.push(context, MaterialPageRoute(builder: (context){
                  //   return OTPCodePage();
                  // }));
                },
                child: Padding(
                  padding:  EdgeInsets.only(
                      left: width/20,
                      right: width/20
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: CustomColor.greenMainColor,
                        border: Border.all(
                            color: CustomColor.greenMainColor
                        ),
                        borderRadius: BorderRadius.circular(
                          width/40,
                        )
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(
                        top: height/100,
                        bottom: height/100,
                        left:width/2.8,
                        right: width/2.7,

                      ),
                      child: Text(
                        "Confirm", style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white
                      ),
                      ),
                    ),
                  ),
                ),
              ),



            ],
          ),
        );
      }
    );
  }
}

