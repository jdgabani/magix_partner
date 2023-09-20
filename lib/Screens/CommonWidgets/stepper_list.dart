import 'package:another_stepper/another_stepper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';

List<StepperData> stepperData = [
  StepperData(
    title: StepperText("Submitted", textStyle: FontTextStyle.lTextNotGreen14bold),
    iconWidget: DottedBorder(
        borderType: BorderType.Circle,
        color: AppColor.notGreen,
        dashPattern: const [2, 2],
        strokeWidth: 1.2,
        child:Center(child: Icon(Icons.check,size: 20.sp,color: AppColor.notGreen,))
    ),
  ),
  StepperData(
    title: StepperText("Received",textStyle: FontTextStyle.lTextNotGreen14bold),
    iconWidget: DottedBorder(
        borderType: BorderType.Circle,
        color: AppColor.notGreen,
        dashPattern: const [2, 2],
        strokeWidth: 1.2,
        child:Center(child: Icon(Icons.check,size: 20.sp,color: AppColor.notGreen,))
    ),
  ),
  StepperData(
    title: StepperText("Verified", textStyle: FontTextStyle.lTextNotGreen14bold),
    iconWidget: DottedBorder(
        borderType: BorderType.Circle,
        color: AppColor.notGreen,
        dashPattern: const [2, 2],
        strokeWidth: 1.2,
        child:Center(child: Icon(Icons.check,size: 20.sp,color: AppColor.notGreen,))
    ),
  ),
  StepperData(
    title: StepperText("Processed", textStyle: FontTextStyle.leadTextDipBlack14bold),
    iconWidget: DottedBorder(
      borderType: BorderType.Circle,
      color: Colors.grey.withOpacity(0.8),
      dashPattern: const [2, 2],
      strokeWidth: 1.2,
      child:const SizedBox(),
    ),
  ),
  StepperData(
    title: StepperText("Approved", textStyle: FontTextStyle.leadTextDipBlack14bold),
    iconWidget: DottedBorder(
      borderType: BorderType.Circle,
      color: Colors.grey.withOpacity(0.8),
      dashPattern: const [2, 2],
      strokeWidth: 1.2,
      child:const SizedBox(),
    ),
  ),
  StepperData(
    title: StepperText("Disbursed", textStyle: FontTextStyle.leadTextDipBlack14bold),
    iconWidget: DottedBorder(
      borderType: BorderType.Circle,
      color: Colors.grey.withOpacity(0.8),
      dashPattern: const [2, 2],
      strokeWidth: 1.2,
      child:const SizedBox(),
    ),
  ),
];