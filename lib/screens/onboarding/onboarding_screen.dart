// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:my_links/constants/colors.dart';
import 'package:my_links/screens/onboarding/widgets/onboarding_string_item.dart';
import 'package:my_links/screens/onboarding/widgets/onboardinnextpage_row.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();

  int currentPage = 0;
  final List<OnboradingScreenItem> _pages = [
    OnboradingScreenItem(
      imagePath: "assets/images/todo1.png",
      title: "TO-DO Link e Hoşgeldin!",
      subtitle: "ARTIK AKLINDA TUTMANA GEREK YOK :)",
    ),
    OnboradingScreenItem(
      imagePath: "assets/images/tick.png",
      title: "10,000+ Kullanıcı!",
      subtitle: "HAYDİ SENDE KENDİ LİNK KUTUNU OLUŞTUR İHTİYAÇLARI UNUTMA... ",
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColors!.primaryColor.withOpacity(0.4),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _pages.length,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                    print(currentPage.toString());
                    print(_pages.length.toString());
                  });
                },
                itemBuilder: (context, index) {
                  return _pages[index];
                },
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: OnboardingNextPageRow(
                    buildPageIndicator: _buildPageIndicator(),
                    icon: currentPage == (_pages.length - 1)
                        ? Icons.check
                        : Icons.arrow_forward_ios,
                    currentPage: currentPage,
                    pageController: _pageController,
                    pagesLength: _pages.length,
                  ),
                ),
                SizedBox(
                  height: 42.sp,
                )
              ],
            ),
          ],
        ));
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _pages.length; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: 5.sp,
            height: 5.sp,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPage == i
                  ? appColors!.primaryColor
                  : appColors!.blackColor.withOpacity(0.3),
            ),
          ),
        ),
      );
    }
    return list;
  }
}
