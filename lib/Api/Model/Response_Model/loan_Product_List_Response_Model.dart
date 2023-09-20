// To parse this JSON data, do
//
//     final productListResponseModel = productListResponseModelFromJson(jsonString);

import 'dart:convert';

ProductListResponseModel productListResponseModelFromJson(String str) =>
    ProductListResponseModel.fromJson(json.decode(str));

String productListResponseModelToJson(ProductListResponseModel data) =>
    json.encode(data.toJson());

class ProductListResponseModel {
  bool? status;
  String? message;
  List<ProductList>? data;

  ProductListResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProductListResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductListResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ProductList>.from(
                json["data"]!.map((x) => ProductList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProductList {
  int? id;
  String? name;
  String? icon;
  bool? hasEligibilityCriteria;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  ProductList({
    this.id,
    this.name,
    this.icon,
    this.hasEligibilityCriteria,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        hasEligibilityCriteria: json["has_eligibility_criteria"],
        isActive: json["is_active"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "has_eligibility_criteria": hasEligibilityCriteria,
        "is_active": isActive,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
