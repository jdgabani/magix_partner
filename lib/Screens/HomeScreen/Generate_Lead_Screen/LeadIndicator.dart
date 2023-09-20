import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magix_partner/Api/View_Model/home_page_view_model.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';
import 'package:magix_partner/Constants/image_path.dart';
import 'package:magix_partner/Constants/lead_indicator_list.dart';
import 'package:magix_partner/Controller/leadindicator_controller.dart';
import 'package:magix_partner/Screens/CommonWidgets/common_emi_calcu_button.dart';
import 'package:magix_partner/Screens/HomeScreen/Generate_Lead_Screen/loan_details_screen.dart';
import 'package:magix_partner/Screens/HomeScreen/Generate_Lead_Screen/personal_details_screen.dart';
import 'package:magix_partner/Screens/HomeScreen/Generate_Lead_Screen/upload_documents_screen.dart';

import '../../../Api/View_Model/generate_lead_view_model.dart';

class LeadIndicator extends StatefulWidget {
  final loanType;
  final bankId;

  const LeadIndicator({super.key, this.loanType, this.bankId});

  @override
  State<LeadIndicator> createState() => _LeadIndicatorState();
}

class _LeadIndicatorState extends State<LeadIndicator> {
  LeadIndController leadIndController = Get.put(LeadIndController());
  //
  // HomePageViewModel homePageViewModel = Get.put(HomePageViewModel());
  GenerateLeadViewModel generateLeadViewModel =
      Get.put(GenerateLeadViewModel());
  // Future getData() async {
  //
  //   await generateLeadViewModel.
  //   // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //   //   homePageViewModel.productListViewModel();
  //   // });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (LeadIndController leadIndController) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: GetBuilder<GenerateLeadViewModel>(
            builder: (controller) {
              return Column(
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
                              'Generate Lead',
                              style: FontTextStyle.htlWhite20bold,
                            ),
                            horizontalTitleGap: 1.w,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 135.h),
                          child: Container(
                            height: 90.h,
                            width: 390.w,
                            decoration: BoxDecoration(
                              color: AppColor.emiContainerColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.r),
                                topRight: Radius.circular(10.r),
                                bottomRight: Radius.circular(30.r),
                                bottomLeft: Radius.circular(10.r),
                              ),
                              border: Border.all(
                                color: AppColor.lightPurpleColor,
                                width: 2.w,
                              ),
                            ),
                            child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    leadIndController.selected = index;
                                    leadIndController.update();
                                  },
                                  child: Container(
                                    height: 32.h,
                                    width: 129.w,
                                    decoration: BoxDecoration(
                                      color: leadIndController.selected == index
                                          ? AppColor.buttonBlueColor
                                          : Colors.transparent,
                                      borderRadius: leadIndController
                                                  .selected ==
                                              0
                                          ? BorderRadius.only(
                                              topLeft: Radius.circular(30.r),
                                              bottomLeft: Radius.circular(10.r))
                                          : leadIndController.selected == 1
                                              ? BorderRadius.all(
                                                  Radius.circular(10.r))
                                              : BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(30.r),
                                                  topRight:
                                                      Radius.circular(10.r)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        divisionName[index],
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp,
                                          color: leadIndController.selected ==
                                                  index
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
                        ),
                      )
                    ],
                  ),
                  leadIndController.selected == 0
                      ? LoanDetailsScreen(
                          loanType: widget.loanType,
                          bankId: widget.bankId,
                        )
                      : leadIndController.selected == 1
                          ? const PersonalDetailsScreen()
                          : const UploadDocumentsScreen(),
                  leadIndController.selected == 0
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35.w),
                          child: CommonButton(
                            color: AppColor.buttonBlueColor,
                            text: 'Next',
                            onpressed: () {
                              setState(() {
                                controller.values = {
                                  "loanType": controller.loanType.text,
                                  "bankName": widget.bankId,
                                  "customerName": controller.customerName.text,
                                  "contactNo": controller.contactNo.text,
                                  "email": controller.email.text,
                                  "pinCode": controller.pinCode.text,
                                  "district": controller.district.text,
                                  "state": controller.state.text,
                                };
                                log("--loanDetails--${controller.values}");
                              });
                              leadIndController.selected++;
                              leadIndController.update();
                            },
                          ),
                        )
                      : leadIndController.selected == 1
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 35.w),
                              child: CommonButton(
                                color: AppColor.buttonBlueColor,
                                text: 'Next',
                                onpressed: () {
                                  // generateLeadViewModel.controllers
                                  //     .forEach((element) {
                                  //   log("--loanDetails--${element["controllers"].text}");
                                  // });

                                  leadIndController.selected++;
                                  leadIndController.update();
                                },
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(horizontal: 35.w),
                              child: CommonButton(
                                color: AppColor.buttonBlueColor,
                                text: 'Submit ',
                                onpressed: () {},
                              ),
                            ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
