import 'package:flutter/material.dart';
import 'package:my_links/constants/button_bar.dart';
import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/constants.dart';
import 'package:my_links/constants/custom_text_formfield.dart';
import 'package:my_links/constants/text_style.dart';
import 'package:sizer/sizer.dart';

class LinkAddFloating extends StatelessWidget {
  LinkAddFloating({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController linkController,
  })  : _formKey = formKey,
        _linkController = linkController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _linkController;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: appColors!.primaryColor,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              backgroundColor: appColors!.todoColor,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp)),
              title: Text("Yeni Ürün Ekle",
                  style: appTextStyles!
                      .sp14(context, appColors!.primaryColor, FontWeight.bold)),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Form(
                      key: _formKey,
                      child: Wrap(
                        runSpacing: 2.h,
                        children: [
                          CustomTextFormField(
                            hintTex: "Ürün Linki ( https:// )",
                            controller: _linkController,
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return "Lütfen link giriniz";
                              } else if (!isLink(p0)) {
                                // could be !p0.contains("https://")
                                return "Lütfen geçerli bir link giriniz";
                              }
                              return null;
                            },
                          ),
                          CustomTextFormField(
                            controller: _nameController,
                            hintTex: "Ürün Adı",
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return "Lütfen ürün adı giriniz";
                              }
                              return null;
                            },
                          ),
                          CustomTextFormField(
                            controller: _priceController,
                            hintTex: "Ürün Fiyatı",
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return "Lütfen ürün fiyatı giriniz";
                              }
                              return null;
                            },
                          ),
                          CustomTextFormField(
                            hintTex: "Önem Seviyesi",
                            validator: (p0) {
                              if (p0!.isEmpty) {
                                return "Lütfen ürün fiyatı giriniz";
                              }
                              return null;
                            },
                          ),
                          CustomTextFormField(
                            controller: _detailController,
                            hintTex: "Ürün Detayı",
                            maxLines: 3,
                            // validator: (p0) {
                            //   if (p0!.isEmpty) {
                            //     return "Lütfen  giriniz";
                            //   }
                            //   return null;
                            // },
                          ),
                        ],
                      )),
                ),
                CutomButtonBar(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //must add fonction
                      print("ürün ekleniyor...");
                    }
                  },
                  text0: "Vazgeç",
                  text1: "EKLE",
                )
              ],
            );
          },
        );
      },
      tooltip: "Link Ekle",
      child: Icon(
        Icons.add,
        size: 35.sp,
      ),
    );
  }
}
