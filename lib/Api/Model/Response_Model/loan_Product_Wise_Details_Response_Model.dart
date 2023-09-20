// To parse this JSON data, do
//
//     final productWiseDetailsResponseModel = productWiseDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

ProductWiseDetailsResponseModel productWiseDetailsResponseModelFromJson(
        String str) =>
    ProductWiseDetailsResponseModel.fromJson(json.decode(str));

String productWiseDetailsResponseModelToJson(
        ProductWiseDetailsResponseModel data) =>
    json.encode(data.toJson());

class ProductWiseDetailsResponseModel {
  bool? status;
  String? message;
  List<Product>? data;

  ProductWiseDetailsResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProductWiseDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductWiseDetailsResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Product>.from(json["data"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Product {
  int? id;
  int? bankId;
  String? shortNote;
  Bank? bank;

  Product({
    this.id,
    this.bankId,
    this.shortNote,
    this.bank,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        bankId: json["bank_id"],
        shortNote: json["short_note"],
        bank: json["bank"] == null ? null : Bank.fromJson(json["bank"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bank_id": bankId,
        "short_note": shortNote,
        "bank": bank?.toJson(),
      };
}

class Bank {
  int? id;
  String? name;
  String? logo;

  Bank({
    this.id,
    this.name,
    this.logo,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
      };
}
