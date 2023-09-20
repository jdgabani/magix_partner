import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magix_partner/Api/Model/Response_Model/user_profile_details_response_model.dart';
import 'package:magix_partner/Api/View_Model/more_page_view_model.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';
import 'package:magix_partner/Constants/image_path.dart';
import 'package:magix_partner/Screens/HomeScreen/My_Profile_Screens/profile_indicator.dart';
import 'package:magix_partner/Screens/HomeScreen/earnings_screen.dart';
import 'package:magix_partner/Screens/HomeScreen/magix_partner_card_screen.dart';
import 'package:magix_partner/Screens/HomeScreen/promote_business.dart';
import '../Controller/profile_controller.dart';
import '../Screens/HomeScreen/more_faqs_screen.dart';
import '../Screens/HomeScreen/more_product_policies_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => MoreScreenState();
}

class MoreScreenState extends State<MoreScreen> {
  ProfileController profileController = Get.put(
    ProfileController(),
  );

  MorePageViewModel morePageViewModel = Get.put(MorePageViewModel());

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     userProfileDetailsViewModel.userProfileDetailsViewModel();
  //   });
  //   super.initState();
  // }

  Future gData() async {
    await morePageViewModel.userProfileDetailsViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
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
                    leading: CircleAvatar(
                      backgroundColor: AppColor.white,
                      radius: 30.r,
                      child: Image.asset(
                        ImagePath.moreIcon,
                        height: 30.h,
                      ),
                    ),
                    title: Text(
                      "More",
                      style: FontTextStyle.htlWhite20bold,
                    ),
                    trailing: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Icon(
                          Icons.notifications_none_outlined,
                          size: 30.h,
                          color: AppColor.lightWhite,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1.5.h, right: 1.w),
                          child: Container(
                            height: 12.h,
                            width: 12.h,
                            decoration: const BoxDecoration(
                              color: AppColor.notGreen,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    horizontalTitleGap: 20.w,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 132.h),
                  child: Container(
                    height: 100.h,
                    width: 394.w,
                    decoration: BoxDecoration(
                      color: AppColor.emiContainerColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.r),
                        bottomRight: Radius.circular(30.r),
                        topLeft: Radius.circular(30.r),
                        bottomLeft: Radius.circular(10.r),
                      ),
                      border: Border.all(
                        color: AppColor.lightPurpleColor,
                        width: 2.w,
                      ),
                    ),
                    child: GetBuilder<MorePageViewModel>(builder: (controller) {
                      UserProfileDetailsResponseModel UserprofileResponse =
                          controller.userDetailsResponse.data;
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              ImagePath.homeMenPics,
                              height: 60.h,
                              width: 60.h,
                            ),
                            SizedBox(width: 17.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${UserprofileResponse.name}",
                                  style: FontTextStyle.moreNameBlack18BlackBold,
                                ),
                                Text(
                                  "${UserprofileResponse.email}",
                                  style: FontTextStyle
                                      .moreEmailDarkBlue18BlackNormal,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                SizedBox(
                                  height: 5.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(const ProfileIndicator());
                                  },
                                  child: Image.asset(
                                    ImagePath.editIcon,
                                    height: 18.h,
                                    width: 18.w,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          GestureDetector(
            onTap: () {
              Get.to(const EarningsScreen());
            },
            child: ListTile(
              leading: Container(
                height: 62.h,
                width: 62.h,
                decoration: BoxDecoration(
                  color: AppColor.emiContainerColor,
                  border: Border.all(
                    width: 2,
                    color: AppColor.lightPurpleColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.r),
                  ),
                ),
                child: const Icon(
                  Icons.wallet,
                  color: AppColor.lightPurple,
                ),
              ),
              title: Text(
                'Earnings',
                style: FontTextStyle.listTDarkBlue18BlackBold,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20.h,
                color: AppColor.lightGreyColor,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            thickness: 2.h,
            color: AppColor.lightPurpleColor,
            endIndent: 20.w,
            indent: 20.w,
          ),

          ///
          SizedBox(
            height: 14.h,
          ),
          GestureDetector(
            onTap: () {
              Get.to(const PromoteBusiness());
            },
            child: ListTile(
              leading: Container(
                height: 62.h,
                width: 62.h,
                decoration: BoxDecoration(
                  color: AppColor.emiContainerColor,
                  border: Border.all(
                    width: 2,
                    color: AppColor.lightPurpleColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.r),
                  ),
                ),
                child: const Icon(
                  Icons.share,
                  color: AppColor.lightPurple,
                ),
              ),
              title: Text(
                'Promote Your Business',
                style: FontTextStyle.listTDarkBlue18BlackBold,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
                color: AppColor.lightGreyColor,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            thickness: 2.h,
            color: AppColor.lightPurpleColor,
            endIndent: 20.w,
            indent: 20.w,
          ),

          ///
          SizedBox(
            height: 14.h,
          ),
          GestureDetector(
            onTap: () {
              Get.to(const MagixPartnerCardScreen());
            },
            child: ListTile(
              leading: Container(
                height: 62.h,
                width: 62.h,
                decoration: BoxDecoration(
                  color: AppColor.emiContainerColor,
                  border: Border.all(
                    width: 2,
                    color: AppColor.lightPurpleColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.r),
                  ),
                ),
                child: const Icon(
                  Icons.credit_card,
                  color: AppColor.lightPurple,
                ),
              ),
              title: Text(
                'Magix Partner Card',
                style: FontTextStyle.listTDarkBlue18BlackBold,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20.h,
                color: AppColor.lightGreyColor,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),

          Container(
            height: 247.h,
            width: 394.w,
            decoration: BoxDecoration(
              color: AppColor.emiContainerColor,
              borderRadius: BorderRadius.all(
                Radius.circular(16.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "About Us",
                    style: FontTextStyle.listTDarkBlue18BlackBold,
                  ),
                  Text(
                    "How it Works",
                    style: FontTextStyle.listTDarkBlue18BlackBold,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const MoreProductPoliciesScreen());
                    },
                    child: Text(
                      "Products, Policies and Rates",
                      style: FontTextStyle.listTDarkBlue18BlackBold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(const MoreFaqScreen());
                    },
                    child: Text(
                      "FAQ's",
                      style: FontTextStyle.listTDarkBlue18BlackBold,
                    ),
                  ),
                  Text(
                    "Settings",
                    style: FontTextStyle.listTDarkBlue18BlackBold,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
