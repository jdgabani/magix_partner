import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';
import 'package:magix_partner/Constants/image_path.dart';
import 'package:magix_partner/Controller/emi_controller.dart';
import 'package:magix_partner/Screens/CommonWidgets/common_emi_calcu_button.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class EmiCalculatorScreen extends StatefulWidget {
  const EmiCalculatorScreen({super.key});

  @override
  State<EmiCalculatorScreen> createState() => _EmiCalculatorScreenState();
}

class _EmiCalculatorScreenState extends State<EmiCalculatorScreen> {
  double loanAmount = 0;
  double interestRate = 0;
  int loan = 0;
  double loanTenure = 0;
  double amount = 0;

  void main() {
    // Principal amount of the loan
    double principal = 100000;

    // Interest rate per year
    double interestRate = 10;

    // Term of the loan in years
    int term = 3;

    // Number of payments per year
    int numberOfPayments = 12;

    // Calculate the EMI
    double emi = principal *
        interestRate *
        numberOfPayments /
        (1 -
            pow(1 + interestRate / numberOfPayments, -numberOfPayments * term));

    // Print the EMI
    print("The EMI on the loan is: $emi");
  }

  amountCalc() {
    var P = loanAmount * 100000;
    var N = loanTenure * 12;
    var R = interestRate / 12 / 100;

    if (P != 0 && N != 0 && R != 0) {
      double emi =
          P * R * (pow(1 + interestRate, N) / (pow(1 + interestRate, N) - 1));

      var totalEmiAmount = (emi * 12) + P;

      amount = totalEmiAmount / N;
      setState(() {});
    }
  }

  EmiController emiController = Get.put(EmiController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (EmiController emiController) {
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
                      padding: EdgeInsets.only(top: 5.h),
                      child: ListTile(
                        leading: Image.asset(
                          ImagePath.calculatorLogo,
                          height: 60.h,
                          width: 60.w,
                        ),
                        title: Text(
                          "EMI Calculator",
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
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 130.h),
                      child: Container(
                        height: 156.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                            color: AppColor.emiContainerColor,
                            borderRadius: BorderRadius.circular(15.r),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColor.lightPurpleColor,
                                blurRadius: 20,
                                offset: Offset(4, 4),
                              ),
                            ]),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 14.h,
                            ),
                            Image.asset(
                              ImagePath.calculator,
                              height: 31.h,
                              width: 31.w,
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            Text(
                              '₹${amount.toStringAsFixed(2)}',
                              style: FontTextStyle.textRsBlue44bold,
                            ),
                            const Text(
                              'Your EMI Per Month is',
                              style: TextStyle(color: AppColor.buttonBlueColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Row(
                        children: [
                          Text(
                            "Loan Amount",
                            style: FontTextStyle.loanAmtBlack16bold,
                          ),
                          const Spacer(),
                          Container(
                            height: 48.h,
                            width: 180.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColor.lightPurpleColor,
                                width: 2.w,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "₹${loan}",
                                style: FontTextStyle.emiTextRsBlue18bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SfSlider(
                    min: 0,
                    max: 10,
                    value: loanAmount,
                    interval: 1,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: false,
                    activeColor: AppColor.buttonBlueColor,
                    inactiveColor: const Color(0xffEEEFFB),
                    minorTicksPerInterval: 0,
                    onChanged: (value) {
                      loanAmount = value;
                      loan = loanAmount.toInt() * 100000;
                      emiController.update();
                    },
                  ),
                  SizedBox(height: 9.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: Row(
                        children: [
                          Text(
                            "Interest Rate",
                            style: FontTextStyle.loanAmtBlack16bold,
                          ),
                          const Spacer(),
                          Container(
                            height: 48.h,
                            width: 180.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColor.lightPurpleColor,
                                width: 2.w,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "%${interestRate.toStringAsFixed(2)}",
                                style: FontTextStyle.emiTextRsBlue18bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SfSlider(
                    min: 0,
                    max: 10,
                    value: interestRate,
                    interval: 2,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: false,
                    activeColor: AppColor.buttonBlueColor,
                    inactiveColor: const Color(0xffEEEFFB),
                    minorTicksPerInterval: 0,
                    onChanged: (value) {
                      interestRate = value;
                      emiController.update();
                    },
                  ),
                  SizedBox(height: 1.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: Row(
                        children: [
                          Text(
                            "Loan Tenure",
                            style: FontTextStyle.loanAmtBlack16bold,
                          ),
                          const Spacer(),
                          Container(
                            height: 48.h,
                            width: 180.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColor.lightPurpleColor,
                                width: 2.w,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Yr ${loanTenure.toStringAsFixed(1)}",
                                style: FontTextStyle.emiTextRsBlue18bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SfSlider(
                    min: 0,
                    max: 8.0,
                    value: loanTenure,
                    interval: 2,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: false,
                    activeColor: AppColor.buttonBlueColor,
                    inactiveColor: const Color(0xffEEEFFB),
                    minorTicksPerInterval: 0,
                    onChanged: (value) {
                      loanTenure = value;
                      emiController.update();
                    },
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CommonEmiCalcuButton(
                        title: 'Calculate',
                        onTap: amountCalc,
                      ),
                      Container(
                        height: 58.h,
                        width: 58.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.lightPurpleColor,
                        ),
                        child: InkResponse(
                          onTap: () {
                            setState(() {
                              loanAmount = 0;
                              interestRate = 0;
                              loanTenure = 0;
                              amount = 0;
                              loan = 0;
                            });
                            print('LoanAmount>>>>${loanAmount}');
                          },
                          child: Image.asset(
                            ImagePath.emiChangeIcon,
                            height: 10.h,
                            width: 10.w,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
