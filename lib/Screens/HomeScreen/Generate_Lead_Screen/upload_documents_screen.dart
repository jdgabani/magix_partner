import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';

class UploadDocumentsScreen extends StatefulWidget {
  const UploadDocumentsScreen({super.key});

  @override
  State<UploadDocumentsScreen> createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 22.h),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Upload Photo',
              style: FontTextStyle.updBlack16BlackBold,
            ),
          ),
          SizedBox(height: 6.h),
          DottedBorder(
            dashPattern: const [4, 4],
            strokeWidth: 1.5,
            color: AppColor.lightPurpleColor,
            radius: Radius.circular(10.r),
            child: SizedBox(
              height: 90.h,
              width: 150.w,
            ),
          ),
          SizedBox(height: 26.h),
          Text(
            "Aadhar Card",
            style: FontTextStyle.updBlack16BlackBold,
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              DottedBorder(
                dashPattern: const [4, 4],
                strokeWidth: 1.5,
                color: AppColor.lightPurpleColor,
                radius: Radius.circular(10.r),
                child: SizedBox(
                  height: 90.h,
                  width: 150.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.camera_alt_outlined,
                        color: AppColor.lightPurple,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Choose File',
                        style: FontTextStyle.cameraTextDipGrey14normal,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Front Side',
                        style: FontTextStyle.cameraTextLightGrey12normal,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              DottedBorder(
                dashPattern: const [4, 4],
                strokeWidth: 1.5,
                color: AppColor.lightPurpleColor,
                radius: Radius.circular(10.r),
                child: SizedBox(
                  height: 90.h,
                  width: 150.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.camera_alt_outlined,
                        color: AppColor.lightPurple,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Choose File',
                        style: FontTextStyle.cameraTextDipGrey14normal,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Back Side',
                        style: FontTextStyle.cameraTextLightGrey12normal,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 26.h),
          Text(
            "3 Months Latest Payslips",
            style: FontTextStyle.updBlack16BlackBold,
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              DottedBorder(
                dashPattern: const [4, 4],
                strokeWidth: 1.5,
                color: AppColor.lightPurpleColor,
                radius: Radius.circular(10.r),
                child: SizedBox(
                  height: 90.h,
                  width: 113.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_circle_outline,
                        color: AppColor.lightPurple,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Choose File',
                        style: FontTextStyle.cameraTextDipGrey14normal,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              DottedBorder(
                dashPattern: const [4, 4],
                strokeWidth: 1.5,
                color: AppColor.lightPurpleColor,
                radius: Radius.circular(10.r),
                child: SizedBox(
                  height: 90.h,
                  width: 113.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_circle_outline,
                        color: AppColor.lightPurple,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Choose File',
                        style: FontTextStyle.cameraTextDipGrey14normal,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              DottedBorder(
                dashPattern: const [4, 4],
                strokeWidth: 1.5,
                color: AppColor.lightPurpleColor,
                radius: Radius.circular(10.r),
                child: SizedBox(
                  height: 90.h,
                  width: 113.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_circle_outline,
                        color: AppColor.lightPurple,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Choose File',
                        style: FontTextStyle.cameraTextDipGrey14normal,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 26.h),
          Row(
            children: [
              Text(
                "Bank Statement",
                style: FontTextStyle.updBlack16BlackBold,
              ),
              SizedBox(
                width: 48.w,
              ),
              Text(
                "Photo",
                style: FontTextStyle.updBlack16BlackBold,
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              DottedBorder(
                dashPattern: const [4, 4],
                strokeWidth: 1.5,
                color: AppColor.lightPurpleColor,
                radius: Radius.circular(10.r),
                child: SizedBox(
                  height: 90.h,
                  width: 150.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_circle_outline,
                        color: AppColor.lightPurple,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Choose File',
                        style: FontTextStyle.cameraTextDipGrey14normal,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              DottedBorder(
                dashPattern: const [4, 4],
                strokeWidth: 1.5,
                color: AppColor.lightPurpleColor,
                radius: Radius.circular(10.r),
                child: SizedBox(
                  height: 90.h,
                  width: 150.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.camera_alt_outlined,
                        color: AppColor.lightPurple,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Upload Photo',
                        style: FontTextStyle.cameraTextDipGrey14normal,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '3 Months to till date Bank\nstatement (Only PDF)',
                style: FontTextStyle.bankTextDipGrey13normal,
              ),
              SizedBox(
                width: 21.w,
              ),
              Text(
                'Passport size photo',
                style: FontTextStyle.bankTextDipGrey13normal,
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
