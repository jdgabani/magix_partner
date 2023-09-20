import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:magix_partner/Api/Model/Response_Model/leads_details_response_model.dart';
import 'package:magix_partner/Api/View_Model/leads_page_view_model.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';
import 'package:magix_partner/Constants/image_path.dart';
import 'package:magix_partner/Constants/lead_detail_screen.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';
import '../../Api/Api_Routes/api_routs.dart';
import '../CommonWidgets/stepper_list.dart';

class LeadDetail extends StatefulWidget {
  final leadId;
  const LeadDetail({super.key, this.leadId});

  @override
  State<LeadDetail> createState() => _LeadDetailState();
}

class _LeadDetailState extends State<LeadDetail> {
  final box = GetStorage();

  LeadsPageViewModel leadsPageViewModel = Get.put(LeadsPageViewModel());

  Future getData() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      leadsPageViewModel.leadsDetailsViewModel();
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LeadsPageViewModel>(builder: (controller) {
        if (controller.loading == true) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.colorLitePurple,
            ),
          );
        } else {
          LeadDetailsResponseModel leadDetails = controller.apiResponse.data;

          List Details = [
            'Test - ${leadDetails.data?.leadDetails?.leadId}',
            leadDetails.data?.loanReferenceNo ?? "0",
            '${leadDetails.data?.leadDetails?.customerName}',
            leadDetails.data?.leadDetails?.address ?? "-",
            '${leadDetails.data?.leadDetails?.loanType}',
            leadDetails.data?.userCommission ?? "0",
          ];
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
                          'Lead Detail',
                          style: FontTextStyle.htlWhite20bold,
                        ),
                        horizontalTitleGap: 1.w,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 170.h),
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
                              height: 65.h,
                              child: leadDetails.data!.product!.icon!
                                          .split('/')
                                          .last
                                          .split('.')
                                          .last ==
                                      'svg'
                                  ? SvgPicture.network(
                                      '${ApiRoutes.imageBaseUrl}${leadDetails.data!.product!.icon}',
                                      height: 60.h,
                                      width: 60.w,
                                    )
                                  : Image.network(
                                      '${ApiRoutes.imageBaseUrl}${leadDetails.data!.product!.icon}',
                                      height: 60.h,
                                      width: 60.w,
                                    ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              'Loan Amount',
                              style: FontTextStyle.loanAmountBlue17normal,
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              '₹${leadDetails.data!.approvedLoanAmount}',
                              style: FontTextStyle.textRsBlue44bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Status',
                            style: FontTextStyle.statusDipGrey14normal,
                          ),
                          AnotherStepper(
                            stepperList: stepperData,
                            stepperDirection: Axis.vertical,
                            iconWidth: 29.w,
                            iconHeight: 29.h,
                            activeBarColor: Colors.green,
                            inActiveBarColor: Colors.grey.withOpacity(0.5),
                            inverted: false,
                            verticalGap: 20.h,
                            activeIndex: 2,
                            barThickness: 1.7,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 400.h,
                      width: 230.w,
                      decoration: BoxDecoration(
                          color: AppColor.emiContainerColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 23.w, top: 13.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: Details.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 19.h,
                                      ),
                                      Text(
                                        titleName[index],
                                        style: FontTextStyle
                                            .leadsDeTextDipGrey14normal,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        Details[index],
                                        style: FontTextStyle
                                            .leadsDeText2DipGrey16bold,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        }
      }),
    );
  }
}
