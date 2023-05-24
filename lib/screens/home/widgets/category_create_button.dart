import 'package:flutter/material.dart';
import 'package:my_links/constants/general_widgets/button_bar.dart';
import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/general_widgets/custom_text_formfield.dart';
import 'package:my_links/constants/text_style.dart';
import 'package:sizer/sizer.dart';

class CatgeoryCreateButton extends StatefulWidget {
  const CatgeoryCreateButton(
      {Key? key, this.formkey, this.onSaved, this.onPressed})
      : super(key: key);
  @override
  final Key? formkey;
  final void Function()? onPressed;
  final void Function(String?)? onSaved;
  @override
  State<CatgeoryCreateButton> createState() => _CatgeoryCreateButtonState();
}

class _CatgeoryCreateButtonState extends State<CatgeoryCreateButton> {
  @override
  Widget build(BuildContext context) {
    String? newCategoryName;
    return ElevatedButton(
        style:
            ElevatedButton.styleFrom(backgroundColor: appColors!.primaryColor),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                backgroundColor: appColors!.todoColor,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp)),
                title: Text("Yeni Kategori Ekle",
                    style: appTextStyles!.sp14(
                        context, appColors!.primaryColor, FontWeight.bold)),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: Form(
                        key: widget.formkey,
                        child: Wrap(
                          runSpacing: 2.h,
                          children: [
                            CustomTextFormField(
                              onSaved: widget.onSaved,
                              hintTex: "Kategori Adı",
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return "Bir Kategori yazınız";
                                }
                                return null;
                              },
                            ),
                          ],
                        )),
                  ),
                  CustomButtonBar(
                    onPressed: widget.onPressed,
                    text0: "Vazgeç",
                    text1: "EKLE",
                  )
                ],
              );
            },
          );
        },
        child: const Text("Kategorileri Ekle"));
  }
}
