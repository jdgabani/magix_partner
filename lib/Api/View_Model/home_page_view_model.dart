import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:magix_partner/Api/Model/Response_Model/loan_Slider_List_Response_Model.dart';
import 'package:magix_partner/Api/Repo/Home_page_repo.dart';
import 'package:magix_partner/Api/api_response.dart';

import '../Model/Response_Model/Loan_Product_Wise_Details_Response_Model.dart';
import '../Model/Response_Model/loan_Dashboard_Response_Model.dart';
import '../Model/Response_Model/loan_Product_List_Response_Model.dart';

class HomePageViewModel extends GetxController {
  bool loading = false;

  List<SliderModel> slider = [];
  List<Product> productWise = [];
  List<ProductList> productList = [];

  /// sliderListViewModel
  ApiResponse _homePageSlider = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _homePageSlider;
  Future sliderListViewModel() async {
    _homePageSlider = ApiResponse.loading(message: 'Loading');

    loading = true;

    update();
    try {
      SliderListResponseModel response = await HomePageRepo.sliderList();

      _homePageSlider = ApiResponse.complete(response);
      slider.clear();
      for (var element in response.data!) {
        slider.add(element);
      }
      log('sliderListResponseModel ----response---->>>>>>$response');

      loading = false;
    } catch (e) {
      _homePageSlider = ApiResponse.error(message: e.toString());
      log('sliderListViewModel-------->>>>>>$e');
      loading = false;
    }
    update();
  }

  /// ProductWiseViewModel

  final box = GetStorage();
  ApiResponse _homeProductWise = ApiResponse.initial(message: 'Initialization');

  ApiResponse get homeProductWise => _homeProductWise;

  Future productWiseViewModel() async {
    _homeProductWise = ApiResponse.loading(message: 'Loading');

    loading = true;

    update();
    try {
      ProductWiseDetailsResponseModel response =
          await HomePageRepo.productWise(box.read("userId"));

      _homeProductWise = ApiResponse.complete(response);
      productWise.clear();
      for (var element in response.data!) {
        productWise.add(element);
      }

      log('productWiseResponseModel ----response---->>>>>>$response');

      loading = false;
    } catch (e) {
      _homeProductWise = ApiResponse.error(message: e.toString());
      log(' productwiseViewModel-------->>>>>>$e');
      loading = false;
    }
    update();
  }

  /// ProductListViewModel

  ApiResponse _homeProductlistView =
      ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiProductResponse => _homeProductlistView;
  Future productListViewModel() async {
    _homeProductlistView = ApiResponse.loading(message: 'Loading');
    loading = true;
    update();
    try {
      ProductListResponseModel response = await HomePageRepo.productList();

      _homeProductlistView = ApiResponse.complete(response);
      productList.clear();
      for (var element in response.data!) {
        productList.add(element);
      }

      log('productListResponseModel ----response---->>>>>>$response');

      loading = false;
    } catch (e) {
      _homeProductlistView = ApiResponse.error(message: e.toString());

      log('productListViewModel-------->>>>>>$e');
      loading = false;
    }
    update();
  }

  /// DashboardViewModel

  ApiResponse _homePageDashboard =
      ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiDashboardResponse => _homePageDashboard;
  Future dashboardViewModel() async {
    _homePageDashboard = ApiResponse.loading(message: 'Loading');

    loading = true;
    update();
    try {
      DashboardResponseModel response = await HomePageRepo.dashboard();

      _homePageDashboard = ApiResponse.complete(response);

      log('dashboardResponseModel ----response---->>>>>>$response');

      loading = false;
    } catch (e) {
      _homePageDashboard = ApiResponse.error(message: e.toString());

      log('dashboardViewModel-------->>>>>>$e');
      loading = false;
    }
    update();
  }
}
