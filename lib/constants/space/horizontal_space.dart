import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.sp,
    );
  }
}
