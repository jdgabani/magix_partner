import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:magix_partner/Api/Model/Response_Model/more_faqs_response_model.dart';
import 'package:magix_partner/Api/View_Model/more_page_view_model.dart';

import '../../Api/api_response.dart';
import '../../Constants/color.dart';
import '../../Constants/font_style.dart';
import '../../Constants/image_path.dart';

class MoreFaqScreen extends StatefulWidget {
  const MoreFaqScreen({super.key});

  @override
  State<MoreFaqScreen> createState() => _MoreFaqScreenState();
}

class _MoreFaqScreenState extends State<MoreFaqScreen> {
  MorePageViewModel morePageViewModel = Get.put(MorePageViewModel());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      morePageViewModel.faqsPageViewModel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
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
                    leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.white,
                      ),
                    ),
                    title: Text(
                      "Faq's",
                      style: FontTextStyle.htlWhite20bold,
                    ),
                    trailing: const Icon(
                      Icons.language_outlined,
                      color: AppColor.lightWhite,
                    ),
                    horizontalTitleGap: 20.w,
                  ),
                ),
              ),
              SizedBox(
                height: 929.h,
                child: Padding(
                  padding: EdgeInsets.only(top: 130.h),
                  child: GetBuilder<MorePageViewModel>(builder: (controller) {
                    if (controller.faqsResponse.status == Status.LOADING) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.colorLitePurple,
                        ),
                      );
                    } else if (controller.faqsResponse.status == Status.ERROR) {
                      return const Center(
                        child: Text('ERROR'),
                      );
                    } else if (controller.faqsResponse.status ==
                        Status.COMPLETE) {
                      MoreFaqsResponseModel faqsPage =
                          controller.faqsResponse.data;
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: faqsPage.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColor.colorLitePurple,
                                  width: 1.8.w,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: ExpansionTile(
                                  tilePadding: EdgeInsets.zero,
                                  title: Text(
                                    parse("${faqsPage.data![index].question}")
                                        .body!
                                        .text,
                                    style: FontTextStyle.lightFaqBlack17Normal,
                                  ),
                                  children: [
                                    Text(
                                      parse("${faqsPage.data![index].answer}")
                                          .body!
                                          .text,
                                      style: FontTextStyle.faqBlack18w500,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text('SOMETHING WENT WRONG'),
                      );
                    }
                  }),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
