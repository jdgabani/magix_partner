import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:magix_partner/Api/Api_Routes/api_routs.dart';
import 'package:magix_partner/Api/Model/Response_Model/more_promote_business_response_model.dart';
import 'package:magix_partner/Api/api_response.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';
import 'package:magix_partner/Constants/image_path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../Api/View_Model/more_page_view_model.dart';

class PromoteBusiness extends StatefulWidget {
  const PromoteBusiness({
    super.key,
  });

  @override
  State<PromoteBusiness> createState() => _PromoteBusinessState();
}

class _PromoteBusinessState extends State<PromoteBusiness> {
  MorePageViewModel morePageViewModel = Get.put(MorePageViewModel());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      morePageViewModel.promoteBusinessViewModel();
    });
  }

  Future shareImage({String? imageUrl, String? text}) async {
    var urls = imageUrl;
    final url = Uri.parse(urls!);
    final res = await get(url);
    final bytes = res.bodyBytes;
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/imageToShare.jpg';
    File(path).writeAsBytesSync(bytes);
    Share.shareFiles([path], text: text);
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
                      "Promote Business",
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
                    if (controller.promoteApiResponse.status ==
                        Status.LOADING) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.colorLitePurple,
                        ),
                      );
                    } else if (controller.promoteApiResponse.status ==
                        Status.ERROR) {
                      return const Center(
                        child: Text('ERROR'),
                      );
                    } else if (controller.promoteApiResponse.status ==
                        Status.COMPLETE) {
                      PromoteBusinessResponseModel promoteBusiness =
                          controller.promoteApiResponse.data;
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: promoteBusiness.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(vertical: 10.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColor.lightPurpleColor,
                                  width: 2.w,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      '${ApiRoutes.imageBaseUrl}${promoteBusiness.data![index].image}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      var makeText =
                                          '${promoteBusiness.data![index].title} ${promoteBusiness.data![index].link})';

                                      await shareImage(
                                          text: makeText,
                                          imageUrl:
                                              '${ApiRoutes.imageBaseUrl}${promoteBusiness.data![index].image}');
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColor.buttonBlueColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 30.w,
                                        )),
                                    child: const Text("Share"),
                                  ),
                                ],
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
          ),
        ],
      ),
    );
  }
}
