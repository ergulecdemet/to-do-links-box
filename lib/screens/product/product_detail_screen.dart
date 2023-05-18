// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:my_links/constants/custom_drop_down.dart';
import 'package:sizer/sizer.dart';

import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/custom_text_formfield.dart';
import 'package:my_links/constants/space/vertical_space.dart';
import 'package:my_links/constants/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    Key? key,
    required this.name,
    required this.import,
    required this.date,
    required this.link,
  }) : super(key: key);
  final String name;
  final String import;
  final String date;
  final String link;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors!.primaryColor.withOpacity(0.4),
        elevation: 0,
        leading: IconButton(
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
        ),
      ),
      backgroundColor: appColors!.whiteColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: appColors!.primaryColor.withOpacity(0.4),
            ),
            Container(
              decoration: BoxDecoration(
                color: appColors!.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.sp),
                    topRight: Radius.circular(20.sp)),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: SingleChildScrollView(
                child: Form(
                    key: formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          VerticalSpace(height: 5.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Kategori"),
                              //DropdownMenuItem(child: Text("Kategori Seçiniz")),

                              TextAndCustomTextfield(
                                  title: "Ürün Adı",
                                  hintTex: "Ürün adını yazınız",
                                  initialValue: widget.name),

                              const TextAndCustomTextfield(
                                  title: "Ürün Fiyatı",
                                  hintTex: "Ürün fiyat yazınız",
                                  initialValue: "100"),

                              const TextAndCustomTextfield(
                                title: "Ürün Detayı",
                                hintTex: "Ürün detayını yazınız",
                                initialValue: "Çok güzel bir şey ya",
                                maxLines: 3,
                              ),
                              const VerticalSpace(height: 8),

                              Text(
                                "Öncelik Sırası",
                                style: appTextStyles!.sp14(context,
                                    appColors!.blackColor, FontWeight.bold),
                              ),
                              const VerticalSpace(height: 8),

                              CustomDropdownButton(
                                  dropdownItems: const ["1", "2", "3"],
                                  dropdownValue: "1",
                                  onChanged: (value) {},
                                  hintText: "yıldız"),
                            ],
                          ),
                          const Text("data"),
                        ],
                      ),
                    )),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.76,
              left: 10.w,
              right: 10.w,
              child: Container(
                  height: 8.h,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: appColors!.blackColor.withOpacity(0.6),
                          offset: const Offset(0, 3),
                          blurRadius: 6,
                          spreadRadius: 0,
                        )
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue.shade300,
                          Colors.pink.shade200,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(15.sp)),
                  child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: TextButton(
                            onPressed: () {
                              _launchUrl(Uri.parse(widget.link));
                            },
                            child: Text(
                              widget.link,
                              style: appTextStyles!
                                  .sp10(context, appColors!.whiteColor),
                            ))),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

class TextAndCustomTextfield extends StatelessWidget {
  const TextAndCustomTextfield({
    Key? key,
    required this.title,
    required this.hintTex,
    required this.initialValue,
    this.maxLines,
  }) : super(key: key);
  final String title;
  final String hintTex;
  final String initialValue;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpace(height: 8),
        Text(
          title,
          style: appTextStyles!
              .sp14(context, appColors!.blackColor, FontWeight.bold),
        ),
        const VerticalSpace(height: 8),
        CustomTextFormField(
          hintTex: hintTex,
          initialValue: initialValue,
        ),
      ],
    );
  }
}
