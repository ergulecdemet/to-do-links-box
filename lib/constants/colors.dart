import 'package:flutter/services.dart';

AppColors? get appColors => AppColors.instance;

class AppColors {
  static AppColors? _instance;
  static AppColors? get instance {
    _instance ??= AppColors._init();
    return _instance;
  }

  //-----------------------------------------------------------------------------
  final Brightness brightnessLight = Brightness.light;
  AppColors._init();
  final SystemUiOverlayStyle systemUiOverlayLight = SystemUiOverlayStyle.light;
  final Color whiteColor = const Color(0xFFFFFFFF);
  final Color blackColor = const Color(0xFF000000);
  final Color transparentColor = const Color(0x00101828);
  final Color primaryColor = const Color(0xFF1AB8DB);
  final Color backgrouncColor = const Color(0xDCDCE4E6);
  final Color todoColor = const Color(0xFFEEEEEE);
  final Color tickColor = const Color(0xFF00C938);
  final Color redColor = const Color(0xFFFF0404);
  final Color yellowColor = const Color(0xFFE1FF00);

  final Color orangeAccentColor = const Color(0xFFFFAB40);

  final Color greyTextColor = const Color(0xFF222222);
}
