import 'package:flutter/material.dart';
import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/space/vertical_space.dart';
import 'package:my_links/constants/text_style.dart';
import 'package:sizer/sizer.dart';

class OnboradingScreenItem extends StatelessWidget {
  String imagePath;
  String title;
  String subtitle;
  OnboradingScreenItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 30.h,
          width: MediaQuery.of(context).size.width,
        ),
        const VerticalSpace(height: 66),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.5.w),
          child: Text(
            title,
            style: appTextStyles!
                .sp12(context, appColors!.primaryColor, FontWeight.w800),
          ),
        ),
        const VerticalSpace(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: appTextStyles!
                .sp18(context, appColors!.whiteColor, FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
