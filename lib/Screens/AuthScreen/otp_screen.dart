import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magix_partner/Bottom_Bar/bottom_bar_screen.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';
import 'package:magix_partner/Constants/image_path.dart';
import 'package:magix_partner/Screens/CommonWidgets/common_login_veri_button.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.code});
  final code;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 430.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(ImagePath.bg),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 73.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child:
                      const Icon(Icons.arrow_back_ios, color: Colors.white70),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    ImagePath.logo,
                    height: 90.h,
                    width: 210.45.w,
                  ),
                ],
              ),
              SizedBox(
                height: 89.h,
              ),
              Image.asset(
                ImagePath.phoneLogo,
                height: 148.h,
                width: 148.w,
              ),
              SizedBox(
                height: 69.h,
              ),
              Container(
                height: 433.h,
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
                    SizedBox(height: 24.h),
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
                        Text('Verification',
                            style: FontTextStyle.logBlue30W600),
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
                      'We have sent you a 4 digit',
                      style: FontTextStyle.logDipGrey18normal,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "verification code on",
                          style: FontTextStyle.logDipGrey18normal,
                          children: [
                            TextSpan(
                              text: "+91 ${widget.code}",
                              style: FontTextStyle.lveBlack18normal,
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                      child: Pinput(
                        length: 4,
                        showCursor: true,
                        defaultPinTheme: PinTheme(
                          width: 70.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            border:
                                Border.all(color: AppColor.lightPurpleColor),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 36.h),
                    CommonLoginVeriButton(
                      title: 'Verify',
                      onTap: () {
                        Get.to(const BottomBarScreen());
                      },
                    ),
                    SizedBox(height: 37.h),
                    Text(
                      '0:16',
                      style: FontTextStyle.lveGreen18bold,
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "didn't receive code. ",
                              style: FontTextStyle.logDipGrey18normal,
                              children: [
                                TextSpan(
                                  text: "Resend Code",
                                  style: FontTextStyle.lveBlue16bold,
                                ),
                              ]),
                        ),
                        SizedBox(width: 10.w),
                        Image.asset(
                          ImagePath.refresh,
                          height: 21.h,
                        ),
                      ],
                    ),
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
