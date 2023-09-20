import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magix_partner/Api/View_Model/more_page_view_model.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/image_path.dart';
import 'package:magix_partner/Controller/profile_controller.dart';
import 'package:magix_partner/Screens/CommonWidgets/common_emi_calcu_button.dart';
import 'package:magix_partner/Screens/HomeScreen/My_Profile_Screens/bank_details_screen.dart';
import 'package:magix_partner/Screens/HomeScreen/My_Profile_Screens/personal_screen.dart';

class ProfileIndicator extends StatefulWidget {
  const ProfileIndicator({super.key});

  @override
  State<ProfileIndicator> createState() => _ProfileIndicatorState();
}

class _ProfileIndicatorState extends State<ProfileIndicator> {
  List divisionName = [
    "Personal Details",
    "Bank Details",
  ];

  ProfileController profileController = Get.put(
    ProfileController(),
  );

  MorePageViewModel morePageViewModel = Get.put(MorePageViewModel());

  @override
  void initState() {
    morePageViewModel.userProfileDetailsViewModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (ProfileController profileController) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
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
                    Positioned(
                      top: 55.h,
                      left: 154.w,
                      child: Image.asset(
                        ImagePath.homeMenPics,
                        height: 120.h,
                      ),
                    ),
                    Positioned(
                        top: 148.h,
                        left: 196.w,
                        bottom: 0,
                        child: CircleAvatar(
                          backgroundColor: AppColor.buttonBlueColor,
                          radius: 18.r,
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white70,
                            size: 20,
                          ),
                        )),
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
                          trailing: Image.asset(
                            ImagePath.shareCircle,
                            height: 18.h,
                            width: 19.w,
                          ),
                          horizontalTitleGap: 1.w,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                Container(
                  height: 58.h,
                  width: 405.w,
                  decoration: BoxDecoration(
                    color: AppColor.emiContainerColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ),
                    border: Border.all(
                      color: AppColor.lightPurpleColor,
                      width: 2.w,
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          profileController.selected = index;
                          profileController.update();
                        },
                        child: Container(
                          height: 29.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                            color: profileController.selected == index
                                ? AppColor.buttonBlueColor
                                : Colors.transparent,
                            borderRadius: profileController.selected == 0
                                ? BorderRadius.only(
                                    bottomLeft: Radius.circular(60.r),
                                    topLeft: Radius.circular(60.r))
                                : BorderRadius.only(
                                    bottomRight: Radius.circular(60.r),
                                    topRight: Radius.circular(60.r),
                                  ),
                          ),
                          child: Center(
                            child: Text(
                              divisionName[index],
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                color: profileController.selected == index
                                    ? AppColor.white
                                    : AppColor.textBlueColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 29.h),
                profileController.selected == 0
                    ? const PersonalScreen()
                    : const BankDetailsScreen(),
                profileController.selected == 0
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 35.w, vertical: 5.h),
                        child: CommonButton(
                          color: AppColor.buttonBlueColor,
                          text: 'Update and Save',
                          onpressed: () {},
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 35.w, vertical: 5.h),
                        child: CommonButton(
                          color: AppColor.buttonBlueColor,
                          text: 'Update and Save ',
                          onpressed: () {},
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
