import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magix_partner/Constants/bottom_list.dart';
import 'package:magix_partner/Constants/color.dart';
import 'package:magix_partner/Constants/font_style.dart';
import 'package:magix_partner/Constants/image_path.dart';

import 'leads_screen.dart';
import 'loan_screen.dart';
import 'more_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoanScreenState().getData();
    LeadsScreenState().lead();
    MoreScreenState().gData();
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.buttonBlueColor),
                child: const Text('NO'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.buttonBlueColor),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        body: Center(
          child: ListCollection().bottomList[selectedIndex]['screen'],
        ),
        backgroundColor: AppColor.white,
        bottomNavigationBar: Container(
          height: 102.h,
          width: 430.w,
          color: AppColor.white,
          child: Container(
            height: 70.h,
            width: 398.w,
            margin: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              color: AppColor.black,
              borderRadius: BorderRadius.circular(13.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                ListCollection().bottomList.length,
                (index) => InkResponse(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: index == 2
                      ? Image.asset(
                          ImagePath.addIcon,
                          height: 60.h,
                          width: 60.w,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ListCollection().bottomList[index]["icon"],
                              height: 22.h,
                              width: 22.w,
                              color: selectedIndex == index
                                  ? AppColor.lightPurple
                                  : AppColor.white,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(ListCollection().bottomList[index]["title"],
                                style: selectedIndex == index
                                    ? FontTextStyle.earningRsTWhite14BlackNormal
                                        .copyWith(
                                            fontSize: 12.sp,
                                            color: const Color(0xff6b79ff))
                                    : FontTextStyle.earningRsTWhite14BlackNormal
                                        .copyWith(
                                        fontSize: 12.sp,
                                      ))
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
