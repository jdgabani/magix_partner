// To parse this JSON data, do
//
//     final moreFaqsResponseModel = moreFaqsResponseModelFromJson(jsonString);

import 'dart:convert';

MoreFaqsResponseModel moreFaqsResponseModelFromJson(String str) =>
    MoreFaqsResponseModel.fromJson(json.decode(str));

String moreFaqsResponseModelToJson(MoreFaqsResponseModel data) =>
    json.encode(data.toJson());

class MoreFaqsResponseModel {
  bool? status;
  String? message;
  List<Faqs>? data;

  MoreFaqsResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory MoreFaqsResponseModel.fromJson(Map<String, dynamic> json) =>
      MoreFaqsResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Faqs>.from(json["data"]!.map((x) => Faqs.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Faqs {
  int? id;
  String? question;
  String? answer;
  String? createdAt;
  String? updatedAt;

  Faqs({
    this.id,
    this.question,
    this.answer,
    this.createdAt,
    this.updatedAt,
  });

  factory Faqs.fromJson(Map<String, dynamic> json) => Faqs(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
