import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magix_partner/Api/Model/Response_Model/pin_code_response_model.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Screens/CommonWidgets/common_textformfield.dart';
import '../../../Api/Api_Routes/api_routs.dart';
import '../../../Api/View_Model/generate_lead_view_model.dart';
import '../../../Api/api_response.dart';

class LoanDetailsScreen extends StatefulWidget {
  final loanType;
  final bankId;
  const LoanDetailsScreen({super.key, this.loanType, this.bankId});

  @override
  State<LoanDetailsScreen> createState() => _LoanDetailsScreenState();
}

class _LoanDetailsScreenState extends State<LoanDetailsScreen> {
  // TextEditingController loanType = TextEditingController();
  // TextEditingController bankName = TextEditingController();
  // TextEditingController customerName = TextEditingController();
  // TextEditingController contactNo = TextEditingController();
  // TextEditingController email = TextEditingController();
  // TextEditingController pinCode = TextEditingController();
  // TextEditingController district = TextEditingController();
  // TextEditingController state = TextEditingController();

  GenerateLeadViewModel generateLeadViewModel =
      Get.put(GenerateLeadViewModel());

  // Future getData() async {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     generateLeadViewModel.pinCodeListViewModel();
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // getData();
  }

  String values = " ";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 630.h,
              child: GetBuilder<GenerateLeadViewModel>(
                builder: (controller) {
                  List dropValues = ["${widget.loanType}", "BALANCE TRANSFER"];
                  return ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 70.h,
                        child: TextField(
                          controller: controller.loanType,
                          cursorColor: Colors.black,
                          autofocus: true,
                          readOnly: true,
                          decoration: InputDecoration(
                            label: const Text("Loan type"),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabled: true,
                            prefixIcon: Icon(
                              Icons.dashboard_outlined,
                              size: 30.sp,
                              color: AppColor.lightPurple,
                            ),
                            suffixIcon:
                                buildDropdownButton(dropValues, controller),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  color: AppColor.lightPurpleColor, width: 2.w),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                  color: AppColor.lightPurpleColor, width: 2.w),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      commonContainer(
                        label: "Bank Name",
                        filled: true,
                        prefix: const Icon(
                          Icons.home_work_outlined,
                          color: AppColor.lightPurple,
                        ),
                        hint: '${widget.bankId}',
                      ),
                      SizedBox(height: 25.h),
                      CommonTextFomField(
                        controller: controller.customerName,
                        labelText: 'Customer Name',
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: AppColor.lightPurple,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      CommonTextFomField(
                        controller: controller.contactNo,
                        labelText: 'Contact No',
                        prefixIcon: const Icon(
                          Icons.phone_android_outlined,
                          color: AppColor.lightPurple,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      CommonTextFomField(
                        controller: controller.email,
                        labelText: 'Email',
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: AppColor.lightPurple,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      TextFormField(
                        onChanged: (val) async {
                          log('=======::::::${controller.pinCode.text.length == 6}');

                          if (controller.pinCode.text.length == 6) {
                            await controller.pinCodeListViewModel(
                                url:
                                    '${ApiRoutes.baseUrl}/state/district/${controller.pinCode.text}');

                            log('------->>>>${controller.pinCodeApiResponse.status == Status.COMPLETE}');
                            log('------->>>>${controller.pinCodeApiResponse.status}');
                            if (controller.pinCodeApiResponse.status ==
                                Status.COMPLETE) {
                              PinCodeResponseModel data =
                                  controller.pinCodeApiResponse.data;

                              controller.district.text = data.data!.district!;
                              controller.state.text = data.data!.state!;
                              controller.update();
                            } else if (controller.pinCodeApiResponse.status ==
                                Status.ERROR) {
                              Get.snackbar("PinCode", "Invalid PinCode",
                                  colorText: AppColor.white,
                                  dismissDirection: DismissDirection.horizontal,
                                  backgroundColor:
                                      Colors.black.withOpacity(0.40));
                            }
                          } else {
                            log('Error');
                          }
                        },
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        controller: controller.pinCode,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 26.h),
                          prefixIcon: Icon(
                            Icons.home_work_outlined,
                            size: 30.sp,
                            color: AppColor.lightPurple,
                          ),
                          labelText: "Pin-Code",
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.lightPurpleColor,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.lightPurpleColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      commonContainer(
                        controller: controller.district,
                        label: "District",
                        filled: true,
                        prefix: const Icon(
                          Icons.place_outlined,
                          color: AppColor.lightPurple,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      commonContainer(
                        controller: controller.state,
                        label: "State",
                        filled: true,
                        prefix: const Icon(
                          Icons.place_outlined,
                          color: AppColor.lightPurple,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }

  DropdownButton<Object> buildDropdownButton(
      List<dynamic> dropValues, GenerateLeadViewModel controller) {
    return DropdownButton(
      focusColor: Colors.white,
      dropdownColor: Colors.white,
      borderRadius: BorderRadius.circular(10.r),
      underline: const SizedBox(),
      icon: Padding(
        padding: EdgeInsets.only(right: 18.w),
        child: RotatedBox(
          quarterTurns: 3,
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 20.h,
            color: AppColor.black,
          ),
        ),
      ),
      menuMaxHeight: 400.h,
      hint: Padding(
        padding: EdgeInsets.only(left: 53.w),
        child: Row(
          children: [
            Text(
              values,
            ),
          ],
        ),
      ),
      isExpanded: true,
      style: const TextStyle(color: Colors.black),
      items: dropValues.map(
        (value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
      onChanged: (value) async {
        setState(() {
          values = value.toString();
          controller.loanType.text = values.toString();
        });
      },
    );
  }
}
