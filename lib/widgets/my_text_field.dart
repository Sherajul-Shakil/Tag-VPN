// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../utils/custom_color.dart';
import '../utils/custom_text_style.dart';

class MyTextField extends StatelessWidget {
  String title;
  TextEditingController controller;

  MyTextField({
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toString(), style: CustomTextStyle.Black400),
          TextField(
            controller: controller,
            style: CustomTextStyle.subTitleStyle,
            cursorColor: CustomColor.blackNormal,
          ),
        ],
      ),
    );
  }
}
