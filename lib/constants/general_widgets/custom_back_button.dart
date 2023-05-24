import 'package:flutter/material.dart';
import 'package:my_links/constants/colors.dart';
import 'package:sizer/sizer.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Container(
        height: 30.sp,
        width: 30.sp,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: appColors!.blackColor,
                blurRadius: 2.sp,
                offset: Offset(0, 1.sp))
          ],
          shape: BoxShape.circle,
          color: appColors!.primaryColor,
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios,
            size: 15.sp,
            color: appColors!.whiteColor,
          ),
        ),
      ),
    );
  }
}
