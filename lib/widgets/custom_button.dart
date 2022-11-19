// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/custom_color.dart';
import '../utils/custom_string.dart';

class CustomButon extends StatelessWidget {
  String title;
  Color? titleColor;
  Color? bacgoundColor;
  double? width;
  double? height;
  bool? isPrefixIcon;
  String? prefixIconImage;
  String? sufixIconImage;
  Color? prefixIconColor;
  bool? isSufixcon;
  double? titleSize;
  bool? isSvg;
  double? imageHeight;
  double? imageWidth;

  CustomButon({
    required this.title,
    this.titleColor = Colors.white,
    this.bacgoundColor = CustomColor.greenMainColor,
    this.width = double.infinity,
    this.height = 46,
    this.prefixIconImage,
    this.sufixIconImage = CustomString.arrowRight,
    this.prefixIconColor,
    this.isPrefixIcon = false,
    this.isSufixcon = false,
    this.titleSize = 15,
    this.isSvg = false,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: bacgoundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isPrefixIcon!)
            isSvg!
                ? SvgPicture.asset(
                    prefixIconImage!,
                    color: prefixIconColor,
                  )
                : Image.asset(
                    height: imageHeight,
                    width: imageWidth,
                    prefixIconImage!,
                    color: prefixIconColor,
                  ),
          if (isPrefixIcon!) SizedBox(width: 32.w),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: titleSize!.sp,
              color: titleColor,
            ),
          ),
          if (isSufixcon!) SizedBox(width: 15.w),
          if (isSufixcon!) Image.asset(sufixIconImage!)
        ],
      ),
    );
  }
}
