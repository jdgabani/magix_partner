// To parse this JSON data, do
//
//     final promoteBusinessResponseModel = promoteBusinessResponseModelFromJson(jsonString);

import 'dart:convert';

PromoteBusinessResponseModel promoteBusinessResponseModelFromJson(String str) =>
    PromoteBusinessResponseModel.fromJson(json.decode(str));

String promoteBusinessResponseModelToJson(PromoteBusinessResponseModel data) =>
    json.encode(data.toJson());

class PromoteBusinessResponseModel {
  bool? status;
  String? message;
  List<Promote>? data;

  PromoteBusinessResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory PromoteBusinessResponseModel.fromJson(Map<String, dynamic> json) =>
      PromoteBusinessResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Promote>.from(json["data"]!.map((x) => Promote.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Promote {
  int? id;
  String? title;
  String? image;
  String? link;
  String? createdAt;
  String? updatedAt;

  Promote({
    this.id,
    this.title,
    this.image,
    this.link,
    this.createdAt,
    this.updatedAt,
  });

  factory Promote.fromJson(Map<String, dynamic> json) => Promote(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        link: json["link"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "link": link,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
