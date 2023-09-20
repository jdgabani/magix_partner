import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magix_partner/Api/Model/Response_Model/personal_details_response_model.dart';
import 'package:magix_partner/Api/View_Model/generate_lead_view_model.dart';
import 'package:magix_partner/Api/api_response.dart';
import 'package:magix_partner/Constants/color.dart';

import '../../CommonWidgets/common_textformfield.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  GenerateLeadViewModel generateLeadViewModel =
      Get.put(GenerateLeadViewModel());

  Future getData() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      generateLeadViewModel.personalDetailsViewModel({"product_id": '1'});
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 620.h,
              child: GetBuilder<GenerateLeadViewModel>(
                builder: (controller) {
                  if (controller.personalDetailsApiResponse.status ==
                      Status.LOADING) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.lightPurple,
                      ),
                    );
                  } else if (controller.personalDetailsApiResponse.status ==
                      Status.ERROR) {
                    return const Center(
                      child: Text('ERROR'),
                    );
                  } else if (controller.personalDetailsApiResponse.status ==
                      Status.COMPLETE) {
                    PersonalDetailsResponseModel personalDetails =
                        controller.personalDetailsApiResponse.data;
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: personalDetails.data?.length,
                      itemBuilder: (context, index) {
                        if (personalDetails.data![index].type == "text") {
                          return Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: PersonalCommonTextFomField(
                              indexP: index,
                              keys: personalDetails.data![index].type,
                              labelText: personalDetails.data![index].labelName,
                              controller: controller.controllers[index]
                                  ["controllers"],
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                size: 30,
                                color: AppColor.lightPurple,
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          );
                        } else if (personalDetails.data![index].type ==
                            "number") {
                          return Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: PersonalCommonTextFomField(
                              indexP: index,
                              keys: personalDetails.data![index].type,
                              labelText: personalDetails.data![index].labelName,
                              controller: controller.controllers[index]
                                  ["controllers"],
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                size: 30,
                                color: AppColor.lightPurple,
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          );
                        } else if (personalDetails.data![index].type ==
                            'dropdown') {
                          List dropDownElement = [];
                          personalDetails.data![index].values
                              .toString()
                              .split('["')
                              .last
                              .split('"]')
                              .first
                              .split('","')
                              .forEach(
                            (element) {
                              dropDownElement.add(element);
                            },
                          );
                          log("------------$dropDownElement");
                          return Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: PersonalCommonTextFomField(
                              indexP: index,
                              keys: personalDetails.data![index].type,
                              labelText: personalDetails.data![index].labelName,
                              controller: controller.controllers[index]
                                  ["controllers"],
                              prefixIcon: const Icon(
                                Icons.dashboard_rounded,
                                size: 30,
                                color: AppColor.lightPurple,
                              ),
                              suffixIcon: CommonDropdownButton(
                                keyDroup: dropDownElement,
                                indexD: index,
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("SOMETHING WENT WRONG"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
