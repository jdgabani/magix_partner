import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';

class CommonEmiCalcuButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;

  const CommonEmiCalcuButton(
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
        width: 324.w,
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

class CommonButton extends StatefulWidget {
  final onpressed;
  final color;
  final text;
  const CommonButton({Key? key, this.onpressed, this.color, this.text})
      : super(key: key);

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {

    return MaterialButton(
      onPressed: widget.onpressed,
      color: widget.color,
      child: Text(
        "${widget.text}",
        style: TextStyle(
          fontSize: 18.sp,
          color: AppColor.white,
          fontFamily: 'inter',
          fontWeight: FontWeight.bold,

        ),
      ),
      minWidth: double.infinity,
      height: 58.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
    );
  }
}
