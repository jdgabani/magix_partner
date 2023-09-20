// To parse this JSON data, do
//
//     final personalDetailsResponseModel = personalDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

PersonalDetailsResponseModel personalDetailsResponseModelFromJson(String str) =>
    PersonalDetailsResponseModel.fromJson(json.decode(str));

String personalDetailsResponseModelToJson(PersonalDetailsResponseModel data) =>
    json.encode(data.toJson());

class PersonalDetailsResponseModel {
  bool? status;
  String? message;
  List<Datum>? data;

  PersonalDetailsResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory PersonalDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      PersonalDetailsResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? category;
  String? name;
  String? labelName;
  String? type;
  String? values;
  dynamic parentFieldId;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  int? isRequired;
  List<dynamic>? childFields;

  Datum({
    this.id,
    this.category,
    this.name,
    this.labelName,
    this.type,
    this.values,
    this.parentFieldId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.isRequired,
    this.childFields,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        category: json["category"],
        name: json["name"],
        labelName: json["label_name"],
        type: json["type"],
        values: json["values"],
        parentFieldId: json["parent_field_id"],
        isActive: json["is_active"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        isRequired: json["is_required"],
        childFields: json["child_fields"] == null
            ? []
            : List<dynamic>.from(json["child_fields"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "name": name,
        "label_name": labelName,
        "type": type,
        "values": values,
        "parent_field_id": parentFieldId,
        "is_active": isActive,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "is_required": isRequired,
        "child_fields": childFields == null
            ? []
            : List<dynamic>.from(childFields!.map((x) => x)),
      };
}
