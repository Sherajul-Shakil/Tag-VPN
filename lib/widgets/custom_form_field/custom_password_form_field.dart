
import 'package:flutter/material.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'package:tap_vpn_details/utils/custom_text_style.dart';
import 'package:tap_vpn_details/widgets/validators/number_validator.dart';

class CustomPasswordFormField extends StatelessWidget {

  final TextEditingController textEditingController;
  bool? isPassword;
  final String validText;

  CustomPasswordFormField({
    required this.textEditingController,
    required this.isPassword,
    required this.validText
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: const InputDecoration(
        errorStyle: TextStyle(fontSize: 11, height: 0.7),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: .5,
            color: Colors.red,
          ),
        ),
      ),
      style: CustomTextStyle.subTitleStyle,
      cursorColor: CustomColor.blackNormal,
      validator: (value){
        if(isPassword == true){
          String password = textEditingController.text;
          bool isPasswordValid = NumberValidator.isNumberFormatNotValid(password);
          if(isPasswordValid == true){
            return validText;
          }else{
            if(password.length>7){
              return null;
            }
            else{
              return validText;
            }
          }
        }
      },
    );
  }
}