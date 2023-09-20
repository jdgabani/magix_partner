import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:html/parser.dart';
import 'package:magix_partner/Api/Api_Routes/api_routs.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';
import 'package:magix_partner/Screens/HomeScreen/Generate_Lead_Screen/LeadIndicator.dart';

import '../../Api/View_Model/home_page_view_model.dart';

class HomeWiseBankDetailsScreen extends StatefulWidget {
  final code;
  final userId;
  const HomeWiseBankDetailsScreen({super.key, required this.code, this.userId});

  @override
  State<HomeWiseBankDetailsScreen> createState() =>
      _HomeWiseBankDetailsScreenState();
}

class _HomeWiseBankDetailsScreenState extends State<HomeWiseBankDetailsScreen> {
  final box = GetStorage();

  HomePageViewModel homePageViewModel = Get.put(HomePageViewModel());

  Future getData() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homePageViewModel.productWiseViewModel();
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.black,
          ),
        ),
        title: Text(
          '${widget.code}',
          style: FontTextStyle.black20Normal,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<HomePageViewModel>(builder: (controller) {
                if (controller.loading == true) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.colorLitePurple,
                    ),
                  );
                } else {
                  return controller.productWise.isEmpty
                      ? const Center(
                          child: Text("No DATA"),
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: controller.productWise.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                //  height: 500.h,
                                margin: EdgeInsets.symmetric(vertical: 15.h),
                                decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.r),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 6.r,
                                          spreadRadius: 1.r,
                                          color: AppColor.lightGreyColor)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                          child: controller.productWise[index]
                                                      .bank?.logo!
                                                      .split('/')
                                                      .last
                                                      .split('.')
                                                      .last ==
                                                  'svg'
                                              ? SvgPicture.network(
                                                  '${ApiRoutes.imageBaseUrl}${controller.productWise[index].bank!.logo}',
                                                  height: 140.h,
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.network(
                                                  '${ApiRoutes.imageBaseUrl}${controller.productWise[index].bank!.logo}',
                                                  height: 140.h,
                                                  fit: BoxFit.fill,
                                                )),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      Text(
                                        "${controller.productWise[index].bank!.name}",
                                        style: FontTextStyle.tDeepGrey16Normal,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text(
                                        parse("${controller.productWise[index].shortNote}")
                                            .body!
                                            .text,
                                        style: FontTextStyle
                                            .earningTextTDeepGrey14normal,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Center(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColor.buttonBlueColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.r),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 50.w,
                                                vertical: 16.h,
                                              )),
                                          onPressed: () {
                                            Get.to(LeadIndicator(
                                              loanType: widget.code,
                                              bankId: controller
                                                  .productWise[index]
                                                  .bank!
                                                  .name,
                                            ));
                                          },
                                          child: const Text('Generate Lead'),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                // child: Text(
                                //     '${productWiseDetails.data![index].bank!.name}'),
                              ),
                            );
                          },
                        );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
