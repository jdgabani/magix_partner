// To parse this JSON data, do
//
//     final userProfileDetailsResponseModel = userProfileDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

UserProfileDetailsResponseModel userProfileDetailsResponseModelFromJson(
        String str) =>
    UserProfileDetailsResponseModel.fromJson(json.decode(str));

String userProfileDetailsResponseModelToJson(
        UserProfileDetailsResponseModel data) =>
    json.encode(data.toJson());

class UserProfileDetailsResponseModel {
  int? id;
  dynamic roleId;
  dynamic personId;
  dynamic fcmToken;
  String? name;
  String? email;
  String? mobileNo;
  dynamic stateId;
  dynamic districtId;
  String? status;
  bool? isKyc;
  bool? isFresh;
  bool? isBlocked;
  String? createdAt;
  String? updatedAt;
  String? website;
  Details? details;
  dynamic role;
  dynamic state;
  dynamic district;
  dynamic currentState;
  dynamic currentDistrict;
  dynamic bankDetails;
  List<dynamic>? intrestedProducts;

  UserProfileDetailsResponseModel({
    this.id,
    this.roleId,
    this.personId,
    this.fcmToken,
    this.name,
    this.email,
    this.mobileNo,
    this.stateId,
    this.districtId,
    this.status,
    this.isKyc,
    this.isFresh,
    this.isBlocked,
    this.createdAt,
    this.updatedAt,
    this.website,
    this.details,
    this.role,
    this.state,
    this.district,
    this.currentState,
    this.currentDistrict,
    this.bankDetails,
    this.intrestedProducts,
  });

  factory UserProfileDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      UserProfileDetailsResponseModel(
        id: json["id"],
        roleId: json["role_id"],
        personId: json["person_id"],
        fcmToken: json["fcm_token"],
        name: json["name"],
        email: json["email"],
        mobileNo: json["mobile_no"],
        stateId: json["state_id"],
        districtId: json["district_id"],
        status: json["status"],
        isKyc: json["is_kyc"],
        isFresh: json["is_fresh"],
        isBlocked: json["is_blocked"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        website: json["website"],
        details:
            json["details"] == null ? null : Details.fromJson(json["details"]),
        role: json["role"],
        state: json["state"],
        district: json["district"],
        currentState: json["current_state"],
        currentDistrict: json["current_district"],
        bankDetails: json["bank_details"],
        intrestedProducts: json["intrested_products"] == null
            ? []
            : List<dynamic>.from(json["intrested_products"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role_id": roleId,
        "person_id": personId,
        "fcm_token": fcmToken,
        "name": name,
        "email": email,
        "mobile_no": mobileNo,
        "state_id": stateId,
        "district_id": districtId,
        "status": status,
        "is_kyc": isKyc,
        "is_fresh": isFresh,
        "is_blocked": isBlocked,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "website": website,
        "details": details?.toJson(),
        "role": role,
        "state": state,
        "district": district,
        "current_state": currentState,
        "current_district": currentDistrict,
        "bank_details": bankDetails,
        "intrested_products": intrestedProducts == null
            ? []
            : List<dynamic>.from(intrestedProducts!.map((x) => x)),
      };
}

class Details {
  int? id;
  int? userId;
  dynamic regionalPartnerId;
  String? profileImage;
  dynamic profession;
  String? address;
  dynamic officeAddress;
  dynamic currentAddress;
  dynamic currentAddressPincode;
  dynamic currentAddressStateId;
  dynamic currentAddressDistrictId;
  dynamic currentProfession;
  dynamic gstNo;
  dynamic products;
  String? pincode;
  dynamic panNo;
  int? isPanVerified;
  String? aadhaarNo;
  String? slab;

  Details({
    this.id,
    this.userId,
    this.regionalPartnerId,
    this.profileImage,
    this.profession,
    this.address,
    this.officeAddress,
    this.currentAddress,
    this.currentAddressPincode,
    this.currentAddressStateId,
    this.currentAddressDistrictId,
    this.currentProfession,
    this.gstNo,
    this.products,
    this.pincode,
    this.panNo,
    this.isPanVerified,
    this.aadhaarNo,
    this.slab,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json["id"],
        userId: json["user_id"],
        regionalPartnerId: json["regional_partner_id"],
        profileImage: json["profile_image"],
        profession: json["profession"],
        address: json["address"],
        officeAddress: json["office_address"],
        currentAddress: json["current_address"],
        currentAddressPincode: json["current_address_pincode"],
        currentAddressStateId: json["current_address_state_id"],
        currentAddressDistrictId: json["current_address_district_id"],
        currentProfession: json["current_profession"],
        gstNo: json["gst_no"],
        products: json["products"],
        pincode: json["pincode"],
        panNo: json["pan_no"],
        isPanVerified: json["is_pan_verified"],
        aadhaarNo: json["aadhaar_no"],
        slab: json["slab"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "regional_partner_id": regionalPartnerId,
        "profile_image": profileImage,
        "profession": profession,
        "address": address,
        "office_address": officeAddress,
        "current_address": currentAddress,
        "current_address_pincode": currentAddressPincode,
        "current_address_state_id": currentAddressStateId,
        "current_address_district_id": currentAddressDistrictId,
        "current_profession": currentProfession,
        "gst_no": gstNo,
        "products": products,
        "pincode": pincode,
        "pan_no": panNo,
        "is_pan_verified": isPanVerified,
        "aadhaar_no": aadhaarNo,
        "slab": slab,
      };
}
