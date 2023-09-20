import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magix_partner/Api/View_Model/more_page_view_model.dart';
import 'package:magix_partner/Api/api_response.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Screens/CommonWidgets/common_textformfield.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  MorePageViewModel morePageViewModel = Get.find<MorePageViewModel>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      morePageViewModel.userProfileDetailsViewModel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: SizedBox(
        height: 550.h,
        child: GetBuilder<MorePageViewModel>(builder: (controller) {
          if (controller.userDetailsResponse.status == Status.COMPLETE) {
            return ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              children: [
                CommonTextFomField(
                  controller: morePageViewModel.fullName,
                  labelText: 'Full Name',
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: AppColor.lightPurple,
                  ),
                ),
                SizedBox(height: 25.h),
                CommonTextFomField(
                  controller: morePageViewModel.emailId,
                  labelText: 'Email ID',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColor.lightPurple,
                  ),
                ),
                SizedBox(height: 25.h),
                CommonTextFomField(
                  controller: morePageViewModel.mobileNumber,
                  labelText: 'Mobile Number',
                  prefixIcon: const Icon(
                    Icons.phone_android_outlined,
                    color: AppColor.lightPurple,
                  ),
                ),
                SizedBox(height: 25.h),
                CommonTextFomField(
                  controller: morePageViewModel.address,
                  labelText: 'Address',
                  prefixIcon: const Icon(
                    Icons.place_outlined,
                    color: AppColor.lightPurple,
                  ),
                ),
                SizedBox(height: 25.h),
                CommonTextFomField(
                  controller: morePageViewModel.panCardNo,
                  labelText: 'Pan Card No',
                  prefixIcon: const Icon(
                    Icons.credit_card,
                    color: AppColor.lightPurple,
                  ),
                ),
                SizedBox(height: 25.h),
                CommonTextFomField(
                  controller: morePageViewModel.aadhaarCardNo,
                  labelText: 'Aadhaar Card No',
                  prefixIcon: const Icon(
                    Icons.credit_card_sharp,
                    color: AppColor.lightPurple,
                  ),
                ),
              ],
            );
          } else if (controller.userDetailsResponse.status == Status.ERROR) {
            return const Center(
              child: Text('ERROR'),
            );
          } else if (controller.userDetailsResponse.status == Status.LOADING) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.colorLitePurple,
              ),
            );
          } else {
            return const Center(
              child: Text("SOMETHING WENT WRONG"),
            );
          }
        }),
      ),
    );
  }
}
