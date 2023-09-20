import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';

class CommonLoginVeriButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;

  const CommonLoginVeriButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 58.h,
        width: 250.w,
        decoration: BoxDecoration(
            color: AppColor.buttonBlueColor,
            borderRadius: BorderRadius.circular(30.r)),
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 3,
                )
              : Text(
                  title,
                  style: FontTextStyle.lveWhite18normal,
                ),
        ),
      ),
    );
  }
}
