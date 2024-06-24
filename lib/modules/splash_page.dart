import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/assets/app_colors.dart';
import 'package:restaurant_app/core/constants/assets/app_fontfamily.dart';
import 'package:restaurant_app/core/constants/assets/app_fontweight.dart';
import 'package:restaurant_app/core/constants/assets/app_images.dart';
import 'package:restaurant_app/core/constants/assets/app_sizes.dart';
import 'package:restaurant_app/core/lang/keys.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String routeName = 'bottom_nav_bar'; // 'login'

  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 3))
    //     .then((value) => Navigator.pushNamed(context, routeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.splash),
          Text(appName,
              style: TextStyle(
                  fontSize: AppSizes.size_48,
                  fontWeight: AppFontWeight.w_700,
                  fontFamily: AppfontFamily.inter,
                  color: splashTextColor))
        ],
      ),
    );
  }
}
