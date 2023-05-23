// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:my_links/screens/home/widgets/delete_icon.dart';
import 'package:sizer/sizer.dart';

import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/slide_page_route.dart';
import 'package:my_links/constants/text_style.dart';
import 'package:my_links/screens/product/product_detail_screen.dart';

class CustomToDoBox extends StatefulWidget {
  CustomToDoBox({
    Key? key,
    required this.name,
    required this.import,
    required this.date,
    required this.tick,
    required this.link,
    required this.detail,
    this.price,
  }) : super(key: key);
  bool tick = false;
  final String name;
  final String import;
  final String date;
  final String link;
  final int? price;
  final String detail;

  @override
  State<CustomToDoBox> createState() => _CustomToDoBoxState();
}

class _CustomToDoBoxState extends State<CustomToDoBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("tıklandı");
        Navigator.push(
            context,
            SlidePageRoute(
                page: ProductDetailScreen(
              price: widget.price,
              date: widget.date,
              import: widget.import,
              name: widget.name,
              link: widget.link,
              detail: widget.detail,
            )));
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
              padding: EdgeInsets.all(10.0.sp),
              child: const DeleteIcon(),
            )
          ],
        ),
      ),
    );
  }
}
