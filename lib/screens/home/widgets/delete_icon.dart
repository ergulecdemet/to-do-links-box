import 'package:flutter/material.dart';
import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/packg/awesome_dialog/awesome_dialog.dart';
import 'package:sizer/sizer.dart';

class DeleteIcon extends StatelessWidget {
  const DeleteIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("keekk");
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          title: 'Çöp Kutusu',
          desc: 'Silmek istediğinize emin misiniz?',
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            print("Siliniyor....");
          },
        ).show();
      },
      child: Icon(
        Icons.delete,
        size: 25.sp,
        color: appColors!.redColor,
      ),
    );
  }
}
