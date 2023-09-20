// To parse this JSON data, do
//
//     final pinCodeResponseModel = pinCodeResponseModelFromJson(jsonString);

import 'dart:convert';

PinCodeResponseModel pinCodeResponseModelFromJson(String str) =>
    PinCodeResponseModel.fromJson(json.decode(str));

String pinCodeResponseModelToJson(PinCodeResponseModel data) =>
    json.encode(data.toJson());

class PinCodeResponseModel {
  bool? status;
  String? message;
  Data? data;

  PinCodeResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory PinCodeResponseModel.fromJson(Map<String, dynamic> json) =>
      PinCodeResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? state;
  String? district;
  int? stateId;
  int? districtId;

  Data({
    this.state,
    this.district,
    this.stateId,
    this.districtId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        state: json["state"],
        district: json["district"],
        stateId: json["state_id"],
        districtId: json["district_id"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "district": district,
        "state_id": stateId,
        "district_id": districtId,
      };
}
