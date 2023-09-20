import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';

import '../../Api/Model/Response_Model/personal_details_response_model.dart';
import '../../Api/View_Model/generate_lead_view_model.dart';

class CommonTextFomField extends StatefulWidget {
  final labelText;
  final suffixIcon;
  final controller;
  final validator;
  final keyboardType;
  final textInputAction;
  final focusedBorder;
  final enabledBorder;
  final contentPadding;
  final hintText;
  final hintStyle;
  final prefixIcon;
  final onChanged;
  final onTap;
  final bool? filled;

  const CommonTextFomField({
    super.key,
    this.labelText,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusedBorder,
    this.enabledBorder,
    this.contentPadding,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.onChanged,
    this.onTap,
    this.filled,
  });

  @override
  State<CommonTextFomField> createState() => _CommonTextFomFieldState();
}

class _CommonTextFomFieldState extends State<CommonTextFomField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      controller: widget.controller,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      decoration: InputDecoration(
        filled: widget.filled,
        labelText: widget.labelText,
        labelStyle: FontTextStyle.textFieldDipGrey17normal,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.lightPurpleColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.lightPurpleColor),
        ),
        contentPadding: widget.contentPadding,
        constraints: BoxConstraints(maxHeight: 70.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
    );
  }
}

/// commonContainerTextfield
Widget commonContainer({
  String? label,
  String? hint,
  final controller,
  Widget? suffix,
  Widget? prefix,
  bool? profile,
  bool? filled,
}) {
  return SizedBox(
    height: 70.h,
    width: profile == true ? 358.w : 398.w,
    child: TextField(
      cursorColor: Colors.black,
      controller: controller,
      autofocus: true,
      readOnly: true,
      decoration: InputDecoration(
        labelStyle:
            FontTextStyle.kLightBlack18Regular.copyWith(fontSize: 16.sp),
        // contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        labelText: label,
        hintText: hint,
        hintStyle: FontTextStyle.mTDarkBlue18Bold,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabled: true,
        suffixIcon: suffix,
        prefixIcon: prefix,
        filled: filled == true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppColor.lightPurpleColor, width: 2.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppColor.lightPurpleColor, width: 2.w),
        ),
      ),
    ),
  );
}

/// personal textFormField
class PersonalCommonTextFomField extends StatefulWidget {
  final labelText;
  final suffixIcon;
  final validator;
  final keyboardType;
  final textInputAction;
  final focusedBorder;
  final enabledBorder;
  final contentPadding;
  final controller;
  final hintText;
  final hintStyle;
  final prefixIcon;
  final onChanged;
  final onTap;
  final bool? filled;
  final keys;
  final int? indexP;

  const PersonalCommonTextFomField({
    super.key,
    this.labelText,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusedBorder,
    this.enabledBorder,
    this.contentPadding,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.onChanged,
    this.onTap,
    this.filled,
    this.keys,
    this.indexP,
    this.controller,
  });

  @override
  State<PersonalCommonTextFomField> createState() =>
      _PersonalCommonTextFomFieldState();
}

class _PersonalCommonTextFomFieldState
    extends State<PersonalCommonTextFomField> {
  GenerateLeadViewModel generateLeadViewModel =
      Get.put(GenerateLeadViewModel());

  TextEditingController dropdown = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenerateLeadViewModel>(builder: (controller) {
      PersonalDetailsResponseModel personalDetails =
          controller.personalDetailsApiResponse.data;
      return TextFormField(
        onChanged: (value) {
          controller.values[widget.keys] = value;
          controller.controllers[widget.indexP!]['controllers'].selection =
              TextSelection.collapsed(
                  offset: controller
                      .controllers[widget.indexP!]['controllers'].text.length);
        },
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        controller: controller.controllers[widget.indexP!]["controllers"],
        onTap: widget.onTap,
        decoration: InputDecoration(
          filled: widget.filled,
          labelText: widget.labelText,
          labelStyle: FontTextStyle.textFieldDipGrey17normal,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.lightPurpleColor),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.lightPurpleColor),
          ),
          contentPadding: widget.contentPadding,
          constraints: BoxConstraints(maxHeight: 70.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
      );
    });
  }
}

///Common DropDown

class CommonDropdownButton extends StatefulWidget {
  const CommonDropdownButton({
    Key? key,
    required this.keyDroup,
    this.indexD,
  }) : super(key: key);

  final List keyDroup;
  final int? indexD;

  @override
  State<CommonDropdownButton> createState() => _CommonDropdownButtonState();
}

class _CommonDropdownButtonState extends State<CommonDropdownButton> {
  GenerateLeadViewModel generateLeadViewModel =
      Get.put(GenerateLeadViewModel());
  String values = '';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GenerateLeadViewModel>(
      builder: (controller) {
        return DropdownButton(
          isExpanded: true,
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
                  style: const TextStyle(color: Colors.black54),
                )
              ],
            ),
          ),
          style: const TextStyle(color: Colors.black),
          items: widget.keyDroup.map(
            (value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.black54),
                ),
              );
            },
          ).toList(),
          onChanged: (value) {
            setState(() {
              values = value.toString();
              controller.values[widget.keyDroup] = value;
              controller.controllers[widget.indexD!]["controllers"].text =
                  value.toString();
            });
          },
        );
      },
    );
  }
}
