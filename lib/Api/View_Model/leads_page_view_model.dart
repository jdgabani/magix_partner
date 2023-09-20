import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:magix_partner/Api/Model/Response_Model/leads_list_response_model.dart';
import '../Model/Response_Model/leads_details_response_model.dart';
import '../Repo/leads_page_repo.dart';
import '../api_response.dart';

class LeadsPageViewModel extends GetxController {
  bool loading = false;

  List<LeadsL> leadsList = [];
  List<LeadsDetails> leadsDetails = [];

  /// leadsListviewmodel

  ApiResponse _leadsList = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiLeadsResponse => _leadsList;

  Future leadsListViewModel() async {
    _leadsList = ApiResponse.loading(message: 'Loading');
    loading = true;
    update();
    try {
      LeadListResponseModel response = await LeadsPageRepo.leadsList();

      _leadsList = ApiResponse.complete(response);
      leadsList.clear();
      for (var element in response.data!) {
        leadsList.add(element);
      }
      log('leadsListResponseModel ----response---->>>>>>$response');

      loading = false;
    } catch (e) {
      _leadsList = ApiResponse.error(message: e.toString());

      log('leadsListViewModel-------->>>>>>$e');

      loading = false;
    }
    update();
  }

  /// leadsDetails

  final box = GetStorage();

  ApiResponse _leadsDetails = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _leadsDetails;

  Future leadsDetailsViewModel() async {
    _leadsDetails = ApiResponse.loading(message: 'Loading');

    loading = true;
    update();
    try {
      LeadDetailsResponseModel response =
          await LeadsPageRepo.leadsDetails(box.read("leadId"));

      _leadsDetails = ApiResponse.complete(response);

      log('leadDetailsResponseModel ----response---->>>>>>$response');

      loading = false;
    } catch (e) {
      _leadsDetails = ApiResponse.error(message: e.toString());

      log('leadsDetailsViewModel-------->>>>>>$e');

      loading = false;
    }
    update();
  }
}
