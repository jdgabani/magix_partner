import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magix_partner/Api/Model/Response_Model/more_product_policy_response_model.dart';
import 'package:magix_partner/Api/View_Model/more_page_view_model.dart';

import '../../Api/api_response.dart';
import '../../Constants/color.dart';
import '../../Constants/font_style.dart';
import '../../Constants/image_path.dart';

class MoreProductPoliciesScreen extends StatefulWidget {
  const MoreProductPoliciesScreen({super.key});

  @override
  State<MoreProductPoliciesScreen> createState() =>
      _MoreProductPoliciesScreenState();
}

class _MoreProductPoliciesScreenState extends State<MoreProductPoliciesScreen> {
  MorePageViewModel morePageViewModel = Get.put(MorePageViewModel());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      morePageViewModel.productPolicyViewModel();
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
                  padding: EdgeInsets.only(top: 5.h, left: 7.w),
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
              Padding(
                padding: EdgeInsets.only(top: 130.h),
                child: GetBuilder<MorePageViewModel>(builder: (controller) {
                  if (controller.policyResponse.status == Status.LOADING) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.colorLitePurple,
                      ),
                    );
                  } else if (controller.policyResponse.status == Status.ERROR) {
                    return const Center(
                      child: Text('ERROR'),
                    );
                  } else if (controller.policyResponse.status ==
                      Status.COMPLETE) {
                    MoreProductPolicyResponseModel productPolicy =
                        controller.policyResponse.data;
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 20.h),
                      child: Text('${productPolicy.message}'),
                    );
                  } else {
                    return const Center(
                      child: Text('SOMETHING WENT WRONG'),
                    );
                  }
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
