import 'package:flutter/material.dart';
import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/packg/awesome_dialog/awesome_dialog.dart';
import 'package:my_links/utils/database_helper.dart';
import 'package:sizer/sizer.dart';

class DeleteIcon extends StatefulWidget {
  DeleteIcon({
    this.btnOkOnPress,
    Key? key,
  }) : super(key: key);
  void Function()? btnOkOnPress;

  @override
  State<DeleteIcon> createState() => _DeleteIconState();
}

class _DeleteIconState extends State<DeleteIcon> {
  DatabaseHelper? databaseHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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

  deleteProduct(int? notID) {
    databaseHelper!.productDelete(notID!).then((silinenID) {
      if (silinenID != 0) {
        //?
        // Scaffold.of(context)
        //     .showSnackBar(SnackBar(content: Text("Not silindi")));
        // setState(() {});
      }
      setState(() {});
    });
  }
}
