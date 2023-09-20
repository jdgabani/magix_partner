import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magix_partner/Constants/image_path.dart';
import 'package:magix_partner/Screens/AuthScreen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 6), () {
      Get.to(
        const LoginScreen(),
        transition: Transition.zoom,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 932.h,
        width: 430.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImagePath.bg),
          ),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Image.asset(
              ImagePath.spLogo,
              height: 154.h,
              width: 360.w,
            )),
      ),
    );
  }
}
