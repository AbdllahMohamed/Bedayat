import 'package:bedayat/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomeTextFormField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintTextStyle;
  final Color? boderColorColor;
  final double? width;
  final TextEditingController? controller;
  final Function(String value)? validator;

  CustomeTextFormField({
    this.controller,
    this.validator,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.hintTextStyle,
    this.boderColorColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    var _deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: width ?? _deviceWidth * 0.86,
      child: TextFormField(
        controller: controller,
        validator: (value) => validator!(value!),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          hintText: hintText,
          hintStyle: hintTextStyle ??
              TextStyle(
                color: AppColors.accentColor,
              ),
          prefixIcon: prefixIcon ?? null,
          suffixIcon: suffixIcon ?? null,
        ),
      ),
    );
  }
}
