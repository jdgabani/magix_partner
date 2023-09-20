import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:magix_partner/Api/Repo/generate_lead_repo.dart';

import '../Model/Response_Model/personal_details_response_model.dart';
import '../Model/Response_Model/pin_code_response_model.dart';
import '../api_response.dart';

class GenerateLeadViewModel extends GetxController {
  ///pinCodeLoanDetails

  ApiResponse _pinCodeData = ApiResponse.initial(message: 'Initialization');

  ApiResponse get pinCodeApiResponse => _pinCodeData;

  Future<void> pinCodeListViewModel({String? url}) async {
    _pinCodeData = ApiResponse.loading(message: 'Loading');

    update();

    try {
      PinCodeResponseModel response = await GenerateLeadRepo.pinCodeRepo(url);

      _pinCodeData = ApiResponse.complete(response);

      log('pinCodeResponseModel ----response---->>>>>>$response');
    } catch (e) {
      _pinCodeData = ApiResponse.error(message: e.toString());

      log('pinCodeResponseModel-------->>>>>>$e');
    }
    update();
  }

  ///personalDetailsScreen

  Map values = {};

  List<Map<String, dynamic>> controllers = [];

  ApiResponse _personalDetails = ApiResponse.initial(message: 'Initialization');

  ApiResponse get personalDetailsApiResponse => _personalDetails;

  TextEditingController loanType = TextEditingController();
  TextEditingController customerName = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController state = TextEditingController();

  Future<void> personalDetailsViewModel(Map<String, dynamic> body) async {
    _personalDetails = ApiResponse.loading(message: 'Loading');

    update();

    try {
      PersonalDetailsResponseModel response =
          await GenerateLeadRepo.personalDetailsRepo(body: body);

      _personalDetails = ApiResponse.complete(response);

      for (int i = 0; i < response.data!.length; i++) {
        values.addAll({
          response.data![i].name: '',
        });
        controllers.add({
          "lebal": response.data![i].name,
          "controllers": TextEditingController(),
        });
      }

      log("-------------------Api$values");
    } catch (e) {
      _personalDetails = ApiResponse.error(message: e.toString());

      log('personalDetailsResponseModel-------->>>>>>$e');
    }
    update();
  }
}
