import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magix_partner/Api/View_Model/more_page_view_model.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';
import 'package:magix_partner/Constants/image_path.dart';
import '../../Api/Model/Response_Model/user_profile_details_response_model.dart';

class MagixPartnerCardScreen extends StatefulWidget {
  const MagixPartnerCardScreen({super.key});

  @override
  State<MagixPartnerCardScreen> createState() => MagixPartnerCardScreenState();
}

class MagixPartnerCardScreenState extends State<MagixPartnerCardScreen> {
  MorePageViewModel morePageViewModel = Get.put(MorePageViewModel());

  Future gData() async {
    await morePageViewModel.userProfileDetailsViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                ImagePath.magiXCardBg,
                height: 932.h,
                width: double.infinity,
              ),
              Positioned(
                left: 49.w,
                top: 406.h,
                child: Container(
                  height: 45.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                      color: AppColor.fulllightPurpleColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                ),
              ),
              Positioned(
                left: 33.w,
                top: 385.h,
                child: Container(
                  height: 56.h,
                  width: 352.w,
                  decoration: BoxDecoration(
                      color: AppColor.lightPurpleColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                ),
              ),
              Image.asset(
                ImagePath.curveDeg,
                fit: BoxFit.fill,
                height: 310.h,
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
                      'Magix Partner Card',
                      style: FontTextStyle.htlWhite20bold,
                    ),
                    horizontalTitleGap: 1.w,
                  ),
                ),
              ),
              Positioned(
                left: 16.w,
                top: 160.h,
                child: GetBuilder<MorePageViewModel>(
                  builder: (controller) {
                    UserProfileDetailsResponseModel UserprofileResponse =
                        controller.userDetailsResponse.data;
                    return Container(
                      height: 270.h,
                      width: 394.w,
                      decoration: BoxDecoration(
                        color: AppColor.emiContainerColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 270.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                  color: AppColor.buttonBlueColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    bottomLeft: Radius.circular(10.r),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 16.h),
                                    Image.asset(
                                      ImagePath.homeMenPics,
                                      height: 63.h,
                                      width: 63.w,
                                    ),
                                    SizedBox(height: 8.h),
                                    Image.asset(
                                      ImagePath.logo,
                                      height: 24.21.h,
                                      width: 56.61.w,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 18.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 13.w),
                                child: Text(
                                  "${UserprofileResponse.name}",
                                  style: FontTextStyle.mCardTBlack18BlackBold,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 13.w),
                                child: Text(
                                  "Business Associate",
                                  style: FontTextStyle.mCardTDarkBlue18w500,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 190.h,
                                    width: 42.w,
                                    decoration: BoxDecoration(
                                      color: AppColor.lineRedColor,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(100.r),
                                        bottomRight: Radius.circular(100.r),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.phone_android_outlined,
                                          color: AppColor.lightWhite,
                                          size: 25.h,
                                        ),
                                        Icon(
                                          Icons.mail_outline,
                                          color: AppColor.lightWhite,
                                          size: 25.h,
                                        ),
                                        Icon(
                                          Icons.place_outlined,
                                          color: AppColor.lightWhite,
                                          size: 25.h,
                                        ),
                                        Icon(
                                          Icons.public,
                                          color: AppColor.lightWhite,
                                          size: 25.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 7.w),
                                  SizedBox(
                                    width: 240.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "+91 ${UserprofileResponse.mobileNo}",
                                          style: FontTextStyle
                                              .mCardTDarkBlue14Bold,
                                        ),
                                        SizedBox(
                                          height: 23.h,
                                        ),
                                        Text(
                                          "${UserprofileResponse.email}",
                                          style: FontTextStyle
                                              .mCardTDarkBlue14Bold,
                                        ),
                                        SizedBox(
                                          height: 11.h,
                                        ),
                                        Text(
                                          "${UserprofileResponse.details!.address}",
                                          maxLines: 3,
                                          style: FontTextStyle
                                              .mCardTDarkBlue14Bold,
                                        ),
                                        SizedBox(
                                          height: 11.h,
                                        ),
                                        Text(
                                          "${UserprofileResponse.website}",
                                          style: FontTextStyle
                                              .mCardTDarkBlue14Bold,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 270.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              color: AppColor.lineRedColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.r),
                                bottomRight: Radius.circular(10.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
