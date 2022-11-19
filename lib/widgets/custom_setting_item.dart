// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/custom_text_style.dart';

class CustomSettingItem extends StatelessWidget {
  String image;
  String title;
  String subTitle;
  bool? newitem;

  CustomSettingItem({
    required this.image,
    required this.title,
    required this.subTitle,
    this.newitem = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      dense: true,
      leading: Image.asset(image),
      title: newitem! ? Row(
        children: [
          Text(title, style: CustomTextStyle.titleStyleBlack600),
          SizedBox(width: 20.w),
          Text('New', style: TextStyle(
            color: Color(0xffF24E1E),
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
          )),
        ],
      ) : Text(title, style: CustomTextStyle.titleStyleBlack600),
      subtitle: Text(subTitle, style: CustomTextStyle.subTitleStyleBlack400),
    );
  }
}