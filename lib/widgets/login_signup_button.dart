import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';

class LoginSignUpButton extends StatelessWidget {

  final double width;
  final double height;
  final String? buttonName;

  LoginSignUpButton({required this.width, required this.height, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: width/15,
        right: width/15
      ),
      padding: EdgeInsets.only(
        top: width/30,
        bottom: width/30
      ),
      decoration: BoxDecoration(
          color: CustomColor.greenMainColor,
          border: Border.all(
              color: CustomColor.greenMainColor
          ),
          borderRadius: BorderRadius.circular(
            width/50,
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            buttonName!, style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          ),
        ],
      ),
    );
  }
}