import 'package:flutter/cupertino.dart';
import 'package:magix_partner/Bottom_Bar/emi_calculator.dart';
import 'package:magix_partner/Bottom_Bar/leads_screen.dart';
import 'package:magix_partner/Bottom_Bar/loan_screen.dart';
import 'package:magix_partner/Bottom_Bar/more_screen.dart';
import 'package:magix_partner/Constants/image_path.dart';

class ListCollection {
  List<Map<String, dynamic>> bottomList = [
    {
      "icon": ImagePath.loanIcon,
      "title": "Loan",
      "screen": const LoanScreen(),
    },
    {
      "icon": ImagePath.leadsIcon,
      "title": "Leads",
      "screen": const LeadsScreen(),
    },
    {
      "icon": "",
      "title": "",
      "screen": const SizedBox(),
    },
    {
      "icon": ImagePath.emiCalIcon,
      "title": "EMI Cal.",
      "screen": const EmiCalculatorScreen(),
    },
    {
      "icon": ImagePath.more,
      "title": "More",
      "screen": const MoreScreen(),
    },
  ];
}
