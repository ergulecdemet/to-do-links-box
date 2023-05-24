import 'package:flutter/material.dart';
import 'package:my_links/constants/colors.dart';
import 'package:my_links/constants/general_widgets/slide_page_route.dart';
import 'package:my_links/constants/text_style.dart';
import 'package:my_links/screens/home/home_screen.dart';
import 'package:sizer/sizer.dart';

class OnboardingNextPageRow extends StatefulWidget {
  PageController pageController;
  IconData icon;
  int currentPage;
  int pagesLength;
  List<Widget> buildPageIndicator;
  OnboardingNextPageRow({
    Key? key,
    required this.pageController,
    required this.icon,
    required this.currentPage,
    required this.pagesLength,
    required this.buildPageIndicator,
  }) : super(key: key);

  @override
  State<OnboardingNextPageRow> createState() => _OnboardingNextPageRowState();
}

class _OnboardingNextPageRowState extends State<OnboardingNextPageRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(context,
                SlidePageRoute(page: const HomeScreen()), (route) => false);
          },
          child: Text(
            "Geç",
            style: appTextStyles!
                .sp14(context, appColors!.greyTextColor, FontWeight.w500),
          ),
        ),
        Row(
          children: widget.buildPageIndicator,
        ),
        InkWell(
          onTap: () {
            if (widget.currentPage == widget.pagesLength - 1) {
              Navigator.pushAndRemoveUntil(context,
                  SlidePageRoute(page: const HomeScreen()), (route) => false);
            } else {
              widget.pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          },
          child: Container(
            height: 10.h,
            width: 10.w,
            decoration: BoxDecoration(
              color: appColors!.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.icon,
              size: 15.sp,
              color: appColors!.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
