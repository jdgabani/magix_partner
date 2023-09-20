import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';
import 'package:magix_partner/Constants/image_path.dart';
import 'package:magix_partner/Screens/AuthScreen/otp_screen.dart';
import 'package:magix_partner/Screens/CommonWidgets/common_login_veri_button.dart';
import 'package:magix_partner/Screens/CommonWidgets/common_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 932.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(ImagePath.bg),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 73.h,
              ),
              Image.asset(
                ImagePath.logo,
                height: 90.h,
                width: 210.45.w,
              ),
              SizedBox(
                height: 89.h,
              ),
              Image.asset(
                ImagePath.lockLogo,
                height: 148.h,
                width: 148.w,
              ),
              SizedBox(
                height: 111.h,
              ),
              Container(
                height: 421.h,
                width: 430.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                  color: AppColor.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 34.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 2.h,
                          width: 50.w,
                          color: AppColor.lineRedColor,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text('Login', style: FontTextStyle.logBlue30W600),
                        SizedBox(
                          width: 16.w,
                        ),
                        Container(
                          height: 2.h,
                          width: 50.w,
                          color: AppColor.lineRedColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Welcome back, you\'ve been missed!',
                      style: FontTextStyle.logDipGrey18normal,
                    ),
                    SizedBox(
                      height: 69.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: CommonTextFomField(
                        controller: phoneController,
                        labelText: 'Phone Number',
                        hintText: '+31 12345 67890',
                        hintStyle: FontTextStyle.textDarkBlue18normal,
                        prefixIcon: Container(
                          height: 20.h,
                          width: 16.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(ImagePath.phone),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 36.h),
                    CommonLoginVeriButton(
                      title: 'Login',
                      onTap: () {
                        Get.to(
                          OtpScreen(
                            code: phoneController.text,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
