class ApiRoutes {
  static String baseUrl =
      'https://phpstack-962363-3710001.cloudwaysapps.com/api';

  static String imageBaseUrl =
      'https://phpstack-962363-3710001.cloudwaysapps.com/storage/';

  /// Home Screen
  static String getSliderList = '$baseUrl/pages/slider-list';
  static String getProductList = '$baseUrl/pages/product-list';
  static String getDashboard = '$baseUrl/user/dashboard/7';
  static String getProductWise = '$baseUrl/bank/criteria';

  /// Leads Screen
  static String getLeadsList = '$baseUrl/lead/7';

  /// Leads Details
  static String getDetails = '$baseUrl/lead/get/details';

  /// Profile Details
  static String userProfileDetails = '$baseUrl/user/profile?user_id=7';

  /// Profile Details
  static String promoteBusiness = '$baseUrl/pages/promote-business';

  /// Faq
  static String faqsPage = '$baseUrl/pages/faq';

  /// productPolicies
  static String policies = '$baseUrl/pages/product-policy';

  /// pinCode
  static String pinCode = '$baseUrl/state/district';

  ///personalDetails
  static String personalDetails = '$baseUrl/product-fileds';
}
