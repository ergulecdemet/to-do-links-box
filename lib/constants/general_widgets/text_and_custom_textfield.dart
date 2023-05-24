import 'package:flutter/material.dart';
import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/general_widgets/custom_text_formfield.dart';
import 'package:my_links/constants/space/vertical_space.dart';
import 'package:my_links/constants/text_style.dart';

class TextAndCustomTextfield extends StatelessWidget {
  const TextAndCustomTextfield({
    Key? key,
    required this.title,
    required this.hintTex,
    required this.initialValue,
    this.maxLines,
  }) : super(key: key);
  final String title;
  final String hintTex;
  final String initialValue;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpace(height: 8),
        Text(
          title,
          style: appTextStyles!
              .sp14(context, appColors!.blackColor, FontWeight.bold),
        ),
        const VerticalSpace(height: 8),
        CustomTextFormField(
          hintTex: hintTex,
          initialValue: initialValue,
        ),
      ],
    );
  }
}
