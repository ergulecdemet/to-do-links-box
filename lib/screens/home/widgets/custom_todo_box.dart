// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:my_links/model/product.dart';
import 'package:sizer/sizer.dart';

import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/text_style.dart';
import 'package:my_links/screens/product/product_detail_screen.dart';

import '../../../constants/packg/awesome_dialog/awesome_dialog.dart';

class CustomToDoBox extends StatefulWidget {
  CustomToDoBox({
    Key? key,
    required this.name,
    required this.import,
    required this.date,
    required this.tick,
    required this.link,
    required this.detail,
    required this.btnOkOnPress,
    required this.productId,
    required this.product,
    this.price,
  }) : super(key: key);
  bool tick = false;
  final String name;
  final String import;
  final String date;
  final String link;
  final int? price;
  final String detail;
  final int? productId;
  void Function()? btnOkOnPress;
  Product product;
  @override
  State<CustomToDoBox> createState() => _CustomToDoBoxState();
}

class _CustomToDoBoxState extends State<CustomToDoBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("tıklandı");
        _detailGo(context, widget.product);
      },
      child: Container(
        height: 10.h,
        decoration: (widget.tick == false)
            ? BoxDecoration(
                color: appColors!.todoColor,
                borderRadius: BorderRadius.circular(10.sp))
            : BoxDecoration(
                color: appColors!.todoColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.sp)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.tick = !widget.tick;
                    print(widget.tick.toString());
                  });
                },
                child: Container(
                  height: 5.h,
                  width: 5.h,
                  decoration: BoxDecoration(
                      color: appColors!.whiteColor,
                      borderRadius: BorderRadius.circular(5.sp)),
                  child: (widget.tick == false)
                      ? Icon(
                          Icons.remove,
                          size: 30.sp,
                          color: appColors!.redColor,
                        )
                      : Icon(
                          Icons.check,
                          size: 30.sp,
                          color: appColors!.tickColor,
                        ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.name,
                          maxLines: 1,
                          style: (widget.tick == false)
                              ? appTextStyles!.sp12(context,
                                  appColors!.blackColor, FontWeight.bold)
                              : appTextStyles!
                                  .sp12line(context, appColors!.greyTextColor)),
                      Text(
                        "Fiyat: ${widget.price.toString()} TL",
                        style: (widget.tick == false)
                            ? appTextStyles!
                                .sp10(context, appColors!.greyTextColor)
                            : appTextStyles!
                                .sp10line(context, appColors!.greyTextColor),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Önem Seviyesi: ",
                            style: (widget.tick == false)
                                ? appTextStyles!.sp10(context,
                                    appColors!.primaryColor, FontWeight.bold)
                                : appTextStyles!.sp10line(
                                    context, appColors!.greyTextColor),
                          ),
                          Text(
                            widget.import.toString(),
                            maxLines: 1,
                            style: appTextStyles!.sp10(context,
                                appColors!.primaryColor, FontWeight.w100),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Oluşturulma Tarihi: ",
                            style: (widget.tick == false)
                                ? appTextStyles!.sp6(
                                    context,
                                    appColors!.greyTextColor,
                                  )
                                : appTextStyles!
                                    .sp6line(context, appColors!.greyTextColor),
                          ),
                          Text(
                            widget.date,
                            maxLines: 1,
                            style: (widget.tick == false)
                                ? appTextStyles!.sp6(
                                    context,
                                    appColors!.greyTextColor,
                                  )
                                : appTextStyles!
                                    .sp6line(context, appColors!.greyTextColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0.sp),
              child: GestureDetector(
                onTap: () {
                  print("keekk");
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Çöp Kutusu',
                    desc: 'Silmek istediğinize emin misiniz?',
                    btnCancelOnPress: () {},
                    btnOkOnPress: widget.btnOkOnPress,
                  ).show();
                },
                child: Icon(
                  Icons.delete,
                  size: 25.sp,
                  color: appColors!.redColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _detailGo(BuildContext context, Product product) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
                  product: product,
                  productId: widget.productId,
                  price: widget.price,
                  date: widget.date,
                  import: widget.import,
                  name: widget.name,
                  link: widget.link,
                  detail: widget.detail,
                )));
  }
}
