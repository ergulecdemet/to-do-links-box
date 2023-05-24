import 'package:flutter/material.dart';
import 'package:my_links/constants/colors.dart';
import 'package:sizer/sizer.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0.w),
      child: Divider(
        thickness: 1.5,
        color: appColors!.blackColor.withOpacity(0.3),
      ),
    );
  }
}
