// To parse this JSON data, do
//
//     final leadDetailsResponseModel = leadDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

LeadDetailsResponseModel leadDetailsResponseModelFromJson(String str) =>
    LeadDetailsResponseModel.fromJson(json.decode(str));

String leadDetailsResponseModelToJson(LeadDetailsResponseModel data) =>
    json.encode(data.toJson());

class LeadDetailsResponseModel {
  bool? status;
  String? message;
  LeadsDetails? data;

  LeadDetailsResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory LeadDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      LeadDetailsResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : LeadsDetails.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class LeadsDetails {
  int? id;
  dynamic districtPartnerId;
  int? captureId;
  int? regionalPartnerId;
  int? productId;
  dynamic loanReferenceNo;
  String? status;
  String? remarks;
  int? approvedLoanAmount;
  int? disbursedLoanAmount;
  bool? isAssign;
  bool? isCompleted;
  bool? isDisbursed;
  String? assignDate;
  String? conclusionDate;
  String? createdAt;
  String? updatedAt;
  LeadDetails? leadDetails;
  Product? product;
  dynamic userCommission;

  LeadsDetails({
    this.id,
    this.districtPartnerId,
    this.captureId,
    this.regionalPartnerId,
    this.productId,
    this.loanReferenceNo,
    this.status,
    this.remarks,
    this.approvedLoanAmount,
    this.disbursedLoanAmount,
    this.isAssign,
    this.isCompleted,
    this.isDisbursed,
    this.assignDate,
    this.conclusionDate,
    this.createdAt,
    this.updatedAt,
    this.leadDetails,
    this.product,
    this.userCommission,
  });

  factory LeadsDetails.fromJson(Map<String, dynamic> json) => LeadsDetails(
        id: json["id"],
        districtPartnerId: json["district_partner_id"],
        captureId: json["capture_id"],
        regionalPartnerId: json["regional_partner_id"],
        productId: json["product_id"],
        loanReferenceNo: json["loan_reference_no"],
        status: json["status"],
        remarks: json["remarks"],
        approvedLoanAmount: json["approved_loan_amount"],
        disbursedLoanAmount: json["disbursed_loan_amount"],
        isAssign: json["is_assign"],
        isCompleted: json["is_completed"],
        isDisbursed: json["is_disbursed"],
        assignDate: json["assign_date"],
        conclusionDate: json["conclusion_date"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        leadDetails: json["lead_details"] == null
            ? null
            : LeadDetails.fromJson(json["lead_details"]),
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        userCommission: json["user_commission"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "district_partner_id": districtPartnerId,
        "capture_id": captureId,
        "regional_partner_id": regionalPartnerId,
        "product_id": productId,
        "loan_reference_no": loanReferenceNo,
        "status": status,
        "remarks": remarks,
        "approved_loan_amount": approvedLoanAmount,
        "disbursed_loan_amount": disbursedLoanAmount,
        "is_assign": isAssign,
        "is_completed": isCompleted,
        "is_disbursed": isDisbursed,
        "assign_date": assignDate,
        "conclusion_date": conclusionDate,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "lead_details": leadDetails?.toJson(),
        "product": product?.toJson(),
        "user_commission": userCommission,
      };
}

class LeadDetails {
  int? id;
  int? leadId;
  int? productId;
  String? customerName;
  String? contactNo;
  String? alternateContactNo;
  String? email;
  int? bankId;
  String? loanType;
  String? pincode;
  int? stateId;
  int? districtId;
  dynamic fatherName;
  dynamic motherName;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic occupation;
  dynamic companyName;
  dynamic loanAmount;
  dynamic address;
  dynamic tenure;
  dynamic salary;
  dynamic gender;
  dynamic test;
  dynamic test2;
  dynamic textTest1;
  dynamic textTest2;

  LeadDetails({
    this.id,
    this.leadId,
    this.productId,
    this.customerName,
    this.contactNo,
    this.alternateContactNo,
    this.email,
    this.bankId,
    this.loanType,
    this.pincode,
    this.stateId,
    this.districtId,
    this.fatherName,
    this.motherName,
    this.createdAt,
    this.updatedAt,
    this.occupation,
    this.companyName,
    this.loanAmount,
    this.address,
    this.tenure,
    this.salary,
    this.gender,
    this.test,
    this.test2,
    this.textTest1,
    this.textTest2,
  });

  factory LeadDetails.fromJson(Map<String, dynamic> json) => LeadDetails(
        id: json["id"],
        leadId: json["lead_id"],
        productId: json["product_id"],
        customerName: json["customer_name"],
        contactNo: json["contact_no"],
        alternateContactNo: json["alternate_contact_no"],
        email: json["email"],
        bankId: json["bank_id"],
        loanType: json["loan_type"],
        pincode: json["pincode"],
        stateId: json["state_id"],
        districtId: json["district_id"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        occupation: json["occupation"],
        companyName: json["company_name"],
        loanAmount: json["loan_amount"],
        address: json["address"],
        tenure: json["tenure"],
        salary: json["salary"],
        gender: json["gender"],
        test: json["test"],
        test2: json["test2"],
        textTest1: json["text_test1"],
        textTest2: json["text_test2"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lead_id": leadId,
        "product_id": productId,
        "customer_name": customerName,
        "contact_no": contactNo,
        "alternate_contact_no": alternateContactNo,
        "email": email,
        "bank_id": bankId,
        "loan_type": loanType,
        "pincode": pincode,
        "state_id": stateId,
        "district_id": districtId,
        "father_name": fatherName,
        "mother_name": motherName,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "occupation": occupation,
        "company_name": companyName,
        "loan_amount": loanAmount,
        "address": address,
        "tenure": tenure,
        "salary": salary,
        "gender": gender,
        "test": test,
        "test2": test2,
        "text_test1": textTest1,
        "text_test2": textTest2,
      };
}

class Product {
  int? id;
  String? name;
  String? icon;
  bool? hasEligibilityCriteria;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Product({
    this.id,
    this.name,
    this.icon,
    this.hasEligibilityCriteria,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
