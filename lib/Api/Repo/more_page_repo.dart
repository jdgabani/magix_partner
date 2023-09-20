import 'dart:developer';
import 'package:magix_partner/Api/Model/Response_Model/more_faqs_response_model.dart';

import '../Api_Routes/api_routs.dart';
import '../Model/Response_Model/more_product_policy_response_model.dart';
import '../Model/Response_Model/more_promote_business_response_model.dart';
import '../Model/Response_Model/user_profile_details_response_model.dart';
import '../api_handlers.dart';

class MorePageRepo {
  /// Promote_business_repo

  static Future promoteBusinessRepo() async {
    var response = await ApiService().getResponse(
        apiType: APIType.aGet,
        url: ApiRoutes.promoteBusiness,
        header: {
          'Authorization':
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OWQ1MGQzZi03ODY5LTRhNWMtYjMxNS01MGU1NDNmNjI1ZjIiLCJqdGkiOiJjOTM5NGFhNzgxNzM1NDI2YmY3ZjhkMzlmMzY5MzE1ZmY2NzI0ZDc3MjRhNWM0NGYxMTBkMmE0OWNiMTc3NjIyZGE2ZDQ1YTk4MWRlOWQwYyIsImlhdCI6MTY5NDU4NTA4Mi4yMTcyNjUsIm5iZiI6MTY5NDU4NTA4Mi4yMTcyNjYsImV4cCI6MTcyNjIwNzQ4Mi4yMTI1MzcsInN1YiI6IjciLCJzY29wZXMiOltdfQ.JtGZnL2qdzc3OUp4JXcjeqOGBdwVXUmeGO2XU8UdZ7xZ14yBHcyubbAdgFbAwKN9frLXLgp-nE2aGTAVZbXGKOcoiegOrQhrvNGruDbXRfr_79EXU9TSDQb1Y_IMFLANGmM7vZwtI9AcCU_0AjbnCe-5gaU7jVi9f5O8HZAzF1t22ovjsNmVRDKsiDBYNz3EtdVDMFGZkN8D5td-_a5A1m8rTGHECyvWgVcvDIDATyI3gtHILriBGurhVJBGCb_u8RLTfvGJhaZ04eTqiKxGjIFu8pqz4XcoXFKJQ113RP38WZAl443_3LGUDXYcP2MH6WtdU5-53plT7ljmV_ThgI9gDwqTovgYr9AWxoGHJhIjI8f58MqpVh_RiYV9ZwW8XybdngXfSB11sk7dK3asRC8-e-MOSongKj9JewKU32vUaHbcgFLfOwHBVyWZV2acrnMx-y63AoJURDuxm5uWxe7xpffLql6YPHfgUgnFC7eR1gJVBNRi6jHOBf3LB7CIqlsPExL0Q2SVXysgqreQxitW22JHXu-fTcNPUA3IdUETddRt7tkvUrYEyeHiNQppQ6jfgbx6OE3ZSfMwo68yUyD-nxY0WugPy2GdIVHm4j6ZGn2ngBoSy65-mO03c-r1m6-BhBzXBl0F_ERJuCwWfPtgGwTn7u_6RHaqfH9uXlU"
        });

    log("response $response");

    PromoteBusinessResponseModel promoteBusinessResponseModel =
        PromoteBusinessResponseModel.fromJson(response);
    return promoteBusinessResponseModel;
  }

  /// FaqsPageRepo

  static Future faqsPageRepo() async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aGet, url: ApiRoutes.faqsPage, header: {
      'Authorization':
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OWQ1MGQzZi03ODY5LTRhNWMtYjMxNS01MGU1NDNmNjI1ZjIiLCJqdGkiOiJjOTM5NGFhNzgxNzM1NDI2YmY3ZjhkMzlmMzY5MzE1ZmY2NzI0ZDc3MjRhNWM0NGYxMTBkMmE0OWNiMTc3NjIyZGE2ZDQ1YTk4MWRlOWQwYyIsImlhdCI6MTY5NDU4NTA4Mi4yMTcyNjUsIm5iZiI6MTY5NDU4NTA4Mi4yMTcyNjYsImV4cCI6MTcyNjIwNzQ4Mi4yMTI1MzcsInN1YiI6IjciLCJzY29wZXMiOltdfQ.JtGZnL2qdzc3OUp4JXcjeqOGBdwVXUmeGO2XU8UdZ7xZ14yBHcyubbAdgFbAwKN9frLXLgp-nE2aGTAVZbXGKOcoiegOrQhrvNGruDbXRfr_79EXU9TSDQb1Y_IMFLANGmM7vZwtI9AcCU_0AjbnCe-5gaU7jVi9f5O8HZAzF1t22ovjsNmVRDKsiDBYNz3EtdVDMFGZkN8D5td-_a5A1m8rTGHECyvWgVcvDIDATyI3gtHILriBGurhVJBGCb_u8RLTfvGJhaZ04eTqiKxGjIFu8pqz4XcoXFKJQ113RP38WZAl443_3LGUDXYcP2MH6WtdU5-53plT7ljmV_ThgI9gDwqTovgYr9AWxoGHJhIjI8f58MqpVh_RiYV9ZwW8XybdngXfSB11sk7dK3asRC8-e-MOSongKj9JewKU32vUaHbcgFLfOwHBVyWZV2acrnMx-y63AoJURDuxm5uWxe7xpffLql6YPHfgUgnFC7eR1gJVBNRi6jHOBf3LB7CIqlsPExL0Q2SVXysgqreQxitW22JHXu-fTcNPUA3IdUETddRt7tkvUrYEyeHiNQppQ6jfgbx6OE3ZSfMwo68yUyD-nxY0WugPy2GdIVHm4j6ZGn2ngBoSy65-mO03c-r1m6-BhBzXBl0F_ERJuCwWfPtgGwTn7u_6RHaqfH9uXlU"
    });

    log("response $response");

    MoreFaqsResponseModel moreFaqsResponseModel =
        MoreFaqsResponseModel.fromJson(response);
    return moreFaqsResponseModel;
  }

  ///User Profile Details Repo

  static Future userprofileDetailsRepo() async {
    var response = await ApiService().getResponse(
        apiType: APIType.aGet,
        url: ApiRoutes.userProfileDetails,
        header: {
          'Authorization':
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OWQ1MGQzZi03ODY5LTRhNWMtYjMxNS01MGU1NDNmNjI1ZjIiLCJqdGkiOiJjOTM5NGFhNzgxNzM1NDI2YmY3ZjhkMzlmMzY5MzE1ZmY2NzI0ZDc3MjRhNWM0NGYxMTBkMmE0OWNiMTc3NjIyZGE2ZDQ1YTk4MWRlOWQwYyIsImlhdCI6MTY5NDU4NTA4Mi4yMTcyNjUsIm5iZiI6MTY5NDU4NTA4Mi4yMTcyNjYsImV4cCI6MTcyNjIwNzQ4Mi4yMTI1MzcsInN1YiI6IjciLCJzY29wZXMiOltdfQ.JtGZnL2qdzc3OUp4JXcjeqOGBdwVXUmeGO2XU8UdZ7xZ14yBHcyubbAdgFbAwKN9frLXLgp-nE2aGTAVZbXGKOcoiegOrQhrvNGruDbXRfr_79EXU9TSDQb1Y_IMFLANGmM7vZwtI9AcCU_0AjbnCe-5gaU7jVi9f5O8HZAzF1t22ovjsNmVRDKsiDBYNz3EtdVDMFGZkN8D5td-_a5A1m8rTGHECyvWgVcvDIDATyI3gtHILriBGurhVJBGCb_u8RLTfvGJhaZ04eTqiKxGjIFu8pqz4XcoXFKJQ113RP38WZAl443_3LGUDXYcP2MH6WtdU5-53plT7ljmV_ThgI9gDwqTovgYr9AWxoGHJhIjI8f58MqpVh_RiYV9ZwW8XybdngXfSB11sk7dK3asRC8-e-MOSongKj9JewKU32vUaHbcgFLfOwHBVyWZV2acrnMx-y63AoJURDuxm5uWxe7xpffLql6YPHfgUgnFC7eR1gJVBNRi6jHOBf3LB7CIqlsPExL0Q2SVXysgqreQxitW22JHXu-fTcNPUA3IdUETddRt7tkvUrYEyeHiNQppQ6jfgbx6OE3ZSfMwo68yUyD-nxY0WugPy2GdIVHm4j6ZGn2ngBoSy65-mO03c-r1m6-BhBzXBl0F_ERJuCwWfPtgGwTn7u_6RHaqfH9uXlU"
        });
    log('response $response');
    UserProfileDetailsResponseModel userProfileDetailsResponseModel =
        UserProfileDetailsResponseModel.fromJson(response);
    return userProfileDetailsResponseModel;
  }

  /// ProductPolicyRepo

  static Future productPolicyRepo() async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aGet, url: ApiRoutes.policies, header: {
      'Authorization':
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OWQ1MGQzZi03ODY5LTRhNWMtYjMxNS01MGU1NDNmNjI1ZjIiLCJqdGkiOiJjOTM5NGFhNzgxNzM1NDI2YmY3ZjhkMzlmMzY5MzE1ZmY2NzI0ZDc3MjRhNWM0NGYxMTBkMmE0OWNiMTc3NjIyZGE2ZDQ1YTk4MWRlOWQwYyIsImlhdCI6MTY5NDU4NTA4Mi4yMTcyNjUsIm5iZiI6MTY5NDU4NTA4Mi4yMTcyNjYsImV4cCI6MTcyNjIwNzQ4Mi4yMTI1MzcsInN1YiI6IjciLCJzY29wZXMiOltdfQ.JtGZnL2qdzc3OUp4JXcjeqOGBdwVXUmeGO2XU8UdZ7xZ14yBHcyubbAdgFbAwKN9frLXLgp-nE2aGTAVZbXGKOcoiegOrQhrvNGruDbXRfr_79EXU9TSDQb1Y_IMFLANGmM7vZwtI9AcCU_0AjbnCe-5gaU7jVi9f5O8HZAzF1t22ovjsNmVRDKsiDBYNz3EtdVDMFGZkN8D5td-_a5A1m8rTGHECyvWgVcvDIDATyI3gtHILriBGurhVJBGCb_u8RLTfvGJhaZ04eTqiKxGjIFu8pqz4XcoXFKJQ113RP38WZAl443_3LGUDXYcP2MH6WtdU5-53plT7ljmV_ThgI9gDwqTovgYr9AWxoGHJhIjI8f58MqpVh_RiYV9ZwW8XybdngXfSB11sk7dK3asRC8-e-MOSongKj9JewKU32vUaHbcgFLfOwHBVyWZV2acrnMx-y63AoJURDuxm5uWxe7xpffLql6YPHfgUgnFC7eR1gJVBNRi6jHOBf3LB7CIqlsPExL0Q2SVXysgqreQxitW22JHXu-fTcNPUA3IdUETddRt7tkvUrYEyeHiNQppQ6jfgbx6OE3ZSfMwo68yUyD-nxY0WugPy2GdIVHm4j6ZGn2ngBoSy65-mO03c-r1m6-BhBzXBl0F_ERJuCwWfPtgGwTn7u_6RHaqfH9uXlU"
    });
    log('response $response');
    MoreProductPolicyResponseModel moreProductPolicyResponseModel =
        MoreProductPolicyResponseModel.fromJson(response);
    return moreProductPolicyResponseModel;
  }
}
