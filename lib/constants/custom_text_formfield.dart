import 'package:flutter/material.dart';
import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/text_style.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintTex,
    this.initialValue,
    this.maxLines,
    this.controller,
    this.validator,
  }) : super(key: key);
  final String hintTex;
  final String? initialValue;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      style: appTextStyles!.sp12(context, appColors!.blackColor),
      maxLines: (maxLines == null) ? 1 : maxLines,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.sp),
              borderSide:
                  BorderSide(color: appColors!.primaryColor.withOpacity(0.3))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.sp),
              borderSide: BorderSide(color: appColors!.primaryColor)),
          hintText: hintTex,
          hintStyle: appTextStyles!.sp12(context, appColors!.greyTextColor),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(25.sp))),
      validator: validator,
    );
  }
}
