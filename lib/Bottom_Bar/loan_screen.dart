import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:magix_partner/Api/View_Model/home_page_view_model.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';
import 'package:magix_partner/Constants/image_path.dart';
import 'package:magix_partner/Controller/loanscreen_controller.dart';
import '../Api/Api_Routes/api_routs.dart';
import '../Api/Model/Response_Model/loan_Dashboard_Response_Model.dart';
import '../Constants/loan_screen_list.dart';
import '../Screens/HomeScreen/home_wise_bank_details_screen.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({super.key});

  @override
  State<LoanScreen> createState() => LoanScreenState();
}

class LoanScreenState extends State<LoanScreen> {
  LoanController loanController = Get.put(LoanController());

  final box = GetStorage();

  HomePageViewModel homePageViewModel = Get.put(HomePageViewModel());

  Future getData() async {
    await homePageViewModel.sliderListViewModel();
    await homePageViewModel.productListViewModel();
    await homePageViewModel.dashboardViewModel();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (LoanController loanController) {
        return Scaffold(
          body: GetBuilder<HomePageViewModel>(builder: (controller) {
            if (controller.loading == true) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.colorLitePurple,
                ),
              );
            } else {
              DashboardResponseModel dashboard =
                  controller.apiDashboardResponse.data;
              List dData = [
                dashboard.data!.leads,
                dashboard.data!.approved,
                dashboard.data!.pending,
                dashboard.data!.earnings,
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
                            leading: Image.asset(
                              ImagePath.homeMenPics,
                              height: 60.h,
                              width: 60.w,
                            ),
                            title: RichText(
                              text: TextSpan(
                                  text: "Hello !",
                                  style: FontTextStyle.htlWhite20bold,
                                  children: [
                                    TextSpan(
                                      text: " Sandy Singh",
                                      style: FontTextStyle.htWhite20bold,
                                    )
                                  ]),
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
                                  padding:
                                      EdgeInsets.only(top: 1.5.h, right: 1.w),
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 120.h),
                        child: SizedBox(
                          height: 250.h,
                          child: PageView.builder(
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (value) {
                              loanController.selected.value = value;
                            },
                            itemCount: controller.slider.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 213.h,
                                    width: 398.w,
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
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          '${ApiRoutes.imageBaseUrl}${controller.slider[index].image}',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      Obx(
                        () => Positioned(
                          top: 337.h,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: List.generate(
                              controller.slider.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 6.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color:
                                        loanController.selected.value == index
                                            ? AppColor.buttonBlueColor
                                            : AppColor.lightPurpleColor,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Padding(
                        padding: EdgeInsets.only(top: 365.h),
                        child: Container(
                          height: 237.h,
                          width: double.infinity,
                          color: AppColor.lightPurpleColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.h),
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: controller.productList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisExtent: 105.h,
                                crossAxisSpacing: 3.h,
                                mainAxisSpacing: 9.h,
                              ),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(HomeWiseBankDetailsScreen(
                                            userId: box.write("userId",
                                                "${controller.productList[index].id}"),
                                            code: controller
                                                .productList[index].name));
                                      },
                                      child: controller.productList[index].icon!
                                                  .split('/')
                                                  .last
                                                  .split('.')
                                                  .last ==
                                              'svg'
                                          ? SvgPicture.network(
                                              '${ApiRoutes.imageBaseUrl}${controller.productList[index].icon}',
                                              height: 70.h,
                                            )
                                          : Image.network(
                                              '${ApiRoutes.imageBaseUrl}${controller.productList[index].icon}',
                                              height: 70.h,
                                            ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      '${controller.productList[index].name}',
                                      style: FontTextStyle.tBlack12Bold,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: false,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 76.h,
                            width: 398.w,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.lightPurpleColor,
                                    blurRadius: 20,
                                    spreadRadius: 1,
                                  ),
                                ]),
                            child: Center(
                              child: ListTile(
                                leading: Container(
                                  height: 66.h,
                                  width: 66.w,
                                  decoration: BoxDecoration(
                                    color: boxColor[index],
                                    borderRadius: BorderRadius.circular(20.r),
                                    image: DecorationImage(
                                      image: AssetImage(boxIcon[index]),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  boxTitle[index],
                                  style: FontTextStyle.tBlack20normal,
                                ),
                                trailing: Text(
                                  '${dData[index]}',
                                  style: FontTextStyle.tBlack32Bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
        );
      },
    );
  }
}
