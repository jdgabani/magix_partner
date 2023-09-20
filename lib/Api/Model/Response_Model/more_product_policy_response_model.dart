// To parse this JSON data, do
//
//     final moreProductPolicyResponseModel = moreProductPolicyResponseModelFromJson(jsonString);

import 'dart:convert';

MoreProductPolicyResponseModel moreProductPolicyResponseModelFromJson(
        String str) =>
    MoreProductPolicyResponseModel.fromJson(json.decode(str));

String moreProductPolicyResponseModelToJson(
        MoreProductPolicyResponseModel data) =>
    json.encode(data.toJson());

class MoreProductPolicyResponseModel {
  bool? status;
  String? message;
  List<dynamic>? data;

  MoreProductPolicyResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory MoreProductPolicyResponseModel.fromJson(Map<String, dynamic> json) =>
      MoreProductPolicyResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<dynamic>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
      };
}
