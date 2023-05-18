// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/text_style.dart';

class CutomButtonBar extends StatefulWidget {
  const CutomButtonBar({
    Key? key,
    this.onPressed,
    this.text0,
    required this.text1,
  }) : super(key: key);

  final void Function()? onPressed;
  final String? text0;
  final String text1;

  @override
  State<CutomButtonBar> createState() => _CutomButtonBarState();
}

class _CutomButtonBarState extends State<CutomButtonBar> {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        (widget.text0 != null)
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: appColors!.orangeAccentColor),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  widget.text0!,
                  style: appTextStyles!
                      .sp12(context, appColors!.whiteColor, FontWeight.bold),
                ),
              )
            : Container(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: appColors!.primaryColor),
          onPressed: widget.onPressed,
          child: Text(
            widget.text1,
            style: appTextStyles!
                .sp12(context, appColors!.whiteColor, FontWeight.bold),
          ),
        )
      ],
    );
  }
}
