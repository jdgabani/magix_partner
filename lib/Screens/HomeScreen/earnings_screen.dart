import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/earning_screen_list.dart';
import 'package:magix_partner/Constants/font_style.dart';
import 'package:magix_partner/Constants/image_path.dart';
import 'package:magix_partner/Screens/CommonWidgets/common_emi_calcu_button.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            ImagePath.curveDeg,
            fit: BoxFit.fill,
            height: 190.h,
            width: double.infinity,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: ListTile(
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColor.lightWhite,
                    size: 27.h,
                  ),
                ),
                title: Text(
                  'Earnings',
                  style: FontTextStyle.htlWhite20bold,
                ),
                horizontalTitleGap: 1.w,
              ),
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 165.h),
                  child: SemicircularIndicator(
                    backgroundColor: AppColor.lightPurpleColor,
                    radius: 129,
                    progress: 0.42,
                    strokeWidth: 12,
                    color: AppColor.semiCircleInBlueColor,
                    bottomPadding: 0,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Image.asset(
                          ImagePath.business,
                          height: 67.h,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'Loan Amount',
                          style: FontTextStyle.loanAmountBlue17normal,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '₹5,000',
                          style: FontTextStyle.textRsBlue44bold,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                        height: 120.h,
                        width: 398.w,
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.lightPurpleColor,
                            width: 2.w,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16.w,
                            top: 17.w,
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lorem ipsum is simply\ndummy text..",
                                    style: FontTextStyle
                                        .earningTextTDarkBlue18bold,
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.wallet,
                                        color: AppColor.lightPurple,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        '02 July 2023',
                                        style: FontTextStyle
                                            .earningTextTDeepGrey14normal,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 21.h,
                                      decoration: BoxDecoration(
                                        color: statusColor[index],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: Center(
                                          child: Text(
                                            statusName[index],
                                            style: FontTextStyle
                                                .earningRsTWhite14BlackNormal,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 35.h,
                                    ),
                                    Text(
                                      "₹5,000",
                                      style: FontTextStyle
                                          .earningRsTBlack20BlackBold,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 857.h, left: 40.w, right: 40.w),
            child: CommonButton(
              text: "Send Withdrawal Request",
              color: AppColor.buttonBlueColor,
              onpressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
