import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Screens/CommonWidgets/common_textformfield.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({super.key});

  @override
  State<BankDetailsScreen> createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: SizedBox(
        height: 550.h,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                const CommonTextFomField(
                  labelText: 'Bank Name',
                  prefixIcon: Icon(
                    Icons.home_work_outlined,
                    color: AppColor.lightPurple,
                  ),
                ),
                SizedBox(height: 25.h),
                const CommonTextFomField(
                  labelText: 'Branch Name',
                  prefixIcon: Icon(
                    Icons.home_outlined,
                    color: AppColor.lightPurple,
                  ),
                ),
                SizedBox(height: 25.h),
                const CommonTextFomField(
                  labelText: 'IFSC Code',
                  prefixIcon: Icon(
                    Icons.credit_card_sharp,
                    color: AppColor.lightPurple,
                  ),
                ),
                SizedBox(height: 25.h),
                const CommonTextFomField(
                  labelText: 'Account Number',
                  prefixIcon: Icon(
                    Icons.credit_card_sharp,
                    color: AppColor.lightPurple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
