import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:magix_partner/Api/Model/Response_Model/more_faqs_response_model.dart';
import 'package:magix_partner/Api/Model/Response_Model/more_product_policy_response_model.dart';
import 'package:magix_partner/Api/Model/Response_Model/more_promote_business_response_model.dart';
import 'package:magix_partner/Api/Repo/more_page_repo.dart';

import '../Model/Response_Model/user_profile_details_response_model.dart';
import '../api_response.dart';

class MorePageViewModel extends GetxController {
  /// promote_business

  ApiResponse promoteBusiness = ApiResponse.initial(message: 'Initialization');

  ApiResponse get promoteApiResponse => promoteBusiness;

  Future promoteBusinessViewModel() async {
    promoteBusiness = ApiResponse.loading(message: 'Loading');

    update();
    try {
      PromoteBusinessResponseModel response =
          await MorePageRepo.promoteBusinessRepo();

      promoteBusiness = ApiResponse.complete(response);

      log('promoteBusinessResponseModel ----response---->>>>>>$response');
    } catch (e) {
      promoteBusiness = ApiResponse.error(message: e.toString());

      log('promoteBusinessViewModel-------->>>>>>$e');
    }
    update();
  }

  /// faqsPage View Model
  ApiResponse faqsPage = ApiResponse.initial(message: 'Initialization');

  ApiResponse get faqsResponse => faqsPage;

  Future faqsPageViewModel() async {
    faqsPage = ApiResponse.loading(message: 'Loading');

    update();
    try {
      MoreFaqsResponseModel response = await MorePageRepo.faqsPageRepo();

      faqsPage = ApiResponse.complete(response);

      log('moreFaqsResponseModel ----response---->>>>>>$response');
    } catch (e) {
      faqsPage = ApiResponse.error(message: e.toString());

      log('morePageViewModel-------->>>>>>$e');
    }
    update();
  }

  /// UserProfileDetailsViewModel

  final fullName = TextEditingController();
  final emailId = TextEditingController();
  final mobileNumber = TextEditingController();
  final address = TextEditingController();
  final panCardNo = TextEditingController();
  final aadhaarCardNo = TextEditingController();

  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get userDetailsResponse => _apiResponse;

  Future<void> userProfileDetailsViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      UserProfileDetailsResponseModel response =
          await MorePageRepo.userprofileDetailsRepo();

      _apiResponse = ApiResponse.complete(response);

      fullName.text = response.name!;
      emailId.text = response.email!;
      mobileNumber.text = response.mobileNo!;
      address.text = response.details!.address!;
      panCardNo.text = response.details!.panNo ?? "0".toString();
      aadhaarCardNo.text = response.details!.aadhaarNo!.toString();

      log('userProfileDetailsViewModel----response---->>>>>>$response');
      // CommonSnackBar.showSnackBar(
      //     title: response.status, message: response.message);
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());
      // CommonSnackBar.showSnackBar(title: 'Something Went Wrong', message: '');
      log('userProfileDetailsViewModel-------->>>>>>$e');
    }
    update();
  }

  /// productPolicy View Model
  ApiResponse policyPage = ApiResponse.initial(message: 'Initialization');

  ApiResponse get policyResponse => policyPage;

  Future productPolicyViewModel() async {
    policyPage = ApiResponse.loading(message: 'Loading');

    update();
    try {
      MoreProductPolicyResponseModel response =
          await MorePageRepo.productPolicyRepo();

      policyPage = ApiResponse.complete(response);

      log('moreProductPolicyResponseModel ----response---->>>>>>$response');
    } catch (e) {
      policyPage = ApiResponse.error(message: e.toString());

      log('productPolicyViewModel-------->>>>>>$e');
    }
    update();
  }
}
