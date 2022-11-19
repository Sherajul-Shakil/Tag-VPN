// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../models/country/data_model.dart';
import '../utils/custom_color.dart';
import '../utils/custom_string.dart';

class CountryItem extends StatelessWidget {
  DataModel dataM;

  CountryItem({
    required this.dataM,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: CustomColor.greenMainColor,
            width: width / 170,
          ),
          borderRadius: BorderRadius.circular(width / 35),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: width / 20,
              top: height / 80,
              bottom: height / 80,
              right: width / 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(dataM.iconUrl!),
              ),
              SizedBox(
                width: width / 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataM.name!,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  ),
                  Text("Free & Unlimited Speed",
                      style:
                          TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w300))
                ],
              ),
              SizedBox(
                width: width / 10,
              ),
              Text("${dataM.port} ms",
                  style: TextStyle(
                      color: CustomColor.txtColorLightGreen,
                      fontWeight: FontWeight.w300)),
              SizedBox(
                width: width / 20,
              ),
              SvgPicture.asset(
                CustomString.wifiLow,
                height: height / 40,
                width: width / 30,
                color: CustomColor.wifiColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
