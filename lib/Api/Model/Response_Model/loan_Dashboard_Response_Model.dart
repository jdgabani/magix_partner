// To parse this JSON data, do
//
//     final homeDashboardResponseModel = homeDashboardResponseModelFromJson(jsonString);

import 'dart:convert';

DashboardResponseModel homeDashboardResponseModelFromJson(String str) =>
    DashboardResponseModel.fromJson(json.decode(str));

String homeDashboardResponseModelToJson(DashboardResponseModel data) =>
    json.encode(data.toJson());

class DashboardResponseModel {
  bool? status;
  String? message;
  DashboardData? data;

  DashboardResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory DashboardResponseModel.fromJson(Map<String, dynamic> json) =>
      DashboardResponseModel(
        status: json["status"],
        message: json["message"],
        data:
            json["data"] == null ? null : DashboardData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class DashboardData {
  int? leads;
  int? approved;
  int? pending;
  int? earnings;

  DashboardData({
    this.leads,
    this.approved,
    this.pending,
    this.earnings,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) => DashboardData(
        leads: json["leads"],
        approved: json["approved"],
        pending: json["pending"],
        earnings: json["earnings"],
      );

  get length => null;

  Map<String, dynamic> toJson() => {
        "leads": leads,
        "approved": approved,
        "pending": pending,
        "earnings": earnings,
      };
}
