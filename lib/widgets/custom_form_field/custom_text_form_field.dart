import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:tap_vpn_details/utils/custom_text_style.dart';
import 'package:tap_vpn_details/widgets/validators/name_validator.dart';

class CustomTextFormField extends StatelessWidget {

  final TextEditingController textEditingController;
  bool? isName;
  final String validText;

  CustomTextFormField({
    required this.textEditingController,
    required this.isName,
    required this.validText
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: textEditingController,
      style: CustomTextStyle.subTitleStyle,
      validator: (value){
        if (isName = true){
          String name = textEditingController.text;
          bool isNameValid = NameValidator.isNameFormatNotValid(name);
          if(isNameValid == true){
            return validText;
          }
          else{
            return null;
          }
        }else{
          String email = textEditingController.text;
          bool isEmailValid = EmailValidator.validate(email);
          if(isEmailValid == true){
            return null;
          }
          else{
            return validText;
          }
        }
      },
    );
  }
}