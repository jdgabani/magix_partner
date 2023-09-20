import 'dart:developer';

import '../Api_Routes/api_routs.dart';
import '../Model/Response_Model/personal_details_response_model.dart';
import '../Model/Response_Model/pin_code_response_model.dart';
import '../api_handlers.dart';

class GenerateLeadRepo {
  /// pinCodeLoanDetails

  static Future pinCodeRepo(String? url) async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aGet, url: url!, header: {
      'Content-Type': 'application/json',
    });

    log("response $response");

    PinCodeResponseModel pinCodeResponseModel =
        PinCodeResponseModel.fromJson(response);
    return pinCodeResponseModel;
  }

  ///PersonalDetailsScreen
  static Future personalDetailsRepo(
      {required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aPost,
        body: body,
        url: ApiRoutes.personalDetails,
        header: {
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OWQ1MGQzZi03ODY5LTRhNWMtYjMxNS01MGU1NDNmNjI1ZjIiLCJqdGkiOiIyMTdlN2U0M2E4ZmRmYzM0NzExZWRmNGFhOGU4YmE2NmM0OTZlNDBiYTY4ZTZhYTlkNWEyYjgxODY4OWM0NWFjMWMwN2VkODNkNjRmNmE0MCIsImlhdCI6MTY5MjI3NTM4OC40NzgyMTQsIm5iZiI6MTY5MjI3NTM4OC40NzgyMTYsImV4cCI6MTcyMzg5Nzc4OC40NzM0ODgsInN1YiI6IjE5NjYiLCJzY29wZXMiOltdfQ.ZlH5zNhop0I6dHh6ErU8X4PyQ8E09nmmFv_jm8-WzR3bNmD_MEDzEJCBmRT9va_EWr0Dx9CYBte_68X5-SrtmN_Hf-u2r-OxLSja4s4vk8UJRUa8kBqCvtYv8s_l2nXFkeR2DQXK5MaEig-myri7i-5Nb4wtz9x9XhhE-43xvzl04WMa_sKmyp_DvePa24YwQ-BHHHfxxRiok7K8G-XmkEpR7uQ5CVicLPYOSW7o6iikcFwiM1yd4mHhkEILujbAoR1Io7F2RynvqAAsnasVWR6buwSkIz9FwjwYx8zF3RU6yTu21Unf3O4PPUOFqId1p_0niNJmvHpY6C8PQl8gryi712knEW8CjV7t9wWumaQRkJEz1s63b0azfhyI_hA_5F4LWXu711ZEh-p2Kp5I26Gea6WPfxxE1aXGdNLJhkEybWrLwCRLzpx80oHYFrgBPUGo8LlmN13o8La9R5C2ILJBYXV4-ijXMpuXgEpXYhMOGfAq10ZHmHe5ultAs4y_45t9KvgGBrhjSGawSifAP3sEJm9eGKINj3lfbka0LJSz4XNC9i6ADn3GIXXXFaJiIoqBQyRQWCdUhRTOaw3C6Q-PEg8iwTqwjZ_sB_5_2EgxZPZ5Deaip1pihD9nCwJrThNRgDS8baL5ymoqHH0h-GpeE7lUdeV1TY-Mz_0Lu9c'
        });

    log("response $response");
    PersonalDetailsResponseModel personalDetailsResponseModel =
        PersonalDetailsResponseModel.fromJson(response);

    return personalDetailsResponseModel;
  }
}
