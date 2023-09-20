import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:magix_partner/Api/Api_Routes/api_routs.dart';
import 'package:magix_partner/Api/View_Model/leads_page_view_model.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';
import 'package:magix_partner/Constants/image_path.dart';
import 'package:magix_partner/Screens/HomeScreen/lead_Detail.dart';

class LeadsScreen extends StatefulWidget {
  const LeadsScreen({super.key});

  @override
  State<LeadsScreen> createState() => LeadsScreenState();
}

class LeadsScreenState extends State<LeadsScreen> {
  final box = GetStorage();

  LeadsPageViewModel leadsPageViewModel = Get.put(LeadsPageViewModel());

  Future lead() async {
    await leadsPageViewModel.leadsListViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LeadsPageViewModel>(builder: (controller) {
        if (controller.loading == true) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.lightPurpleColor,
            ),
          );
        } else {
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
                        leading: Image.asset(
                          ImagePath.leadsClip,
                          height: 60.h,
                          width: 60.w,
                        ),
                        title: Text(
                          "Leads",
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
                  SizedBox(
                    height: 825.h,
                    child: Padding(
                      padding: EdgeInsets.only(top: 131.h),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: controller.leadsList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(LeadDetail(
                                  leadId: box.write("leadId",
                                      "${controller.leadsList[index].id}"),
                                ));
                              },
                              child: Container(
                                height: 154.h,
                                width: 398.w,
                                margin: EdgeInsets.only(top: 14.h),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2.w,
                                    color: AppColor.lightPurpleColor,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.r),
                                    topRight: Radius.circular(10.r),
                                    bottomRight: Radius.circular(10.r),
                                    bottomLeft: Radius.circular(10.r),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 13.w,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        SizedBox(
                                          height: 60.h,
                                          child: controller.leadsList[index]
                                                      .product!.productImage!
                                                      .split('/')
                                                      .last
                                                      .split('.')
                                                      .last ==
                                                  'svg'
                                              ? SvgPicture.network(
                                                  '${ApiRoutes.imageBaseUrl}${controller.leadsList[index].product!.productImage}',
                                                  height: 70.h,
                                                  width: 70.h,
                                                )
                                              : Image.network(
                                                  '${ApiRoutes.imageBaseUrl}${controller.leadsList[index].product!.productImage}',
                                                  height: 70.h,
                                                  width: 70.h,
                                                ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 11.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 29.h),
                                            Text(
                                              '${controller.leadsList[index].leadDetails!.leadId}',
                                              style: FontTextStyle.tBlack20Bold,
                                            ),
                                            SizedBox(height: 19.h),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.place_outlined,
                                                  color: AppColor.lightPurple,
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                Text(
                                                  '${controller.leadsList[index].leadDetails!.pincode}',
                                                  style: FontTextStyle
                                                      .tDeepGrey12Normal,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 7.h),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.wifi_calling_3_outlined,
                                                  color: AppColor.lightPurple,
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                Text(
                                                  '${controller.leadsList[index].leadDetails!.contactNo}',
                                                  style: FontTextStyle
                                                      .tDeepGrey12Normal,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 30.h, right: 7.w),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 22.h,
                                            width: 77.h,
                                            decoration: BoxDecoration(
                                              color: controller.leadsList[index]
                                                          .status ==
                                                      "Pending"
                                                  ? AppColor.lightPurpleColor
                                                  : controller.leadsList[index]
                                                              .status ==
                                                          "Rejected"
                                                      ? Colors.red
                                                      : AppColor.notGreen,
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '${controller.leadsList[index].status}',
                                                style: TextStyle(
                                                    color: controller
                                                                .leadsList[
                                                                    index]
                                                                .status ==
                                                            "Pending"
                                                        ? AppColor
                                                            .buttonBlueColor
                                                        : Colors.white,
                                                    fontSize: 15.sp),
                                              ),
                                            ),
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
                  ),
                ],
              ),
            ],
          );
        }
      }),
    );
  }
}
