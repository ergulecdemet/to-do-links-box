import 'package:flutter/material.dart';
import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/text_style.dart';
import 'package:sizer/sizer.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<String> dropdownItems;
  final String dropdownValue;
  final Function(String?)? onChanged;
  final String hintText;

  const CustomDropdownButton({
    required this.dropdownItems,
    required this.dropdownValue,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.5.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        border: Border.all(
          color: appColors!.primaryColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: DropdownButtonFormField<String>(
          isExpanded: true,
          hint: Text(hintText),
          key: Key(dropdownValue),
          decoration: InputDecoration(
              border: InputBorder.none,
              helperStyle: appTextStyles!.sp12(context, appColors!.blackColor)),
          icon: Container(),
          elevation: 10,
          style: appTextStyles!.sp12(context, appColors!.blackColor),
          onChanged: onChanged,
          items: dropdownItems
              .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(value),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
