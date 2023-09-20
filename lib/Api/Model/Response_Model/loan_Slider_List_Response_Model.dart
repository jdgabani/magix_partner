// To parse this JSON data, do
//
//     final sliderListResponseModel = sliderListResponseModelFromJson(jsonString);

import 'dart:convert';

SliderListResponseModel sliderListResponseModelFromJson(String str) =>
    SliderListResponseModel.fromJson(json.decode(str));

String sliderListResponseModelToJson(SliderListResponseModel data) =>
    json.encode(data.toJson());

class SliderListResponseModel {
  bool? status;
  String? message;
  List<SliderModel>? data;

  SliderListResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory SliderListResponseModel.fromJson(Map<String, dynamic> json) =>
      SliderListResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<SliderModel>.from(
                json["data"]!.map((x) => SliderModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SliderModel {
  int? id;
  String? image;
  String? createdAt;
  String? updatedAt;

  SliderModel({
    this.id,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        id: json["id"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
