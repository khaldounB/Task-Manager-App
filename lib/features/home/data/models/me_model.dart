// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'address_model.dart';
import 'bank_model.dart';
import 'company_model.dart';
import 'crypto_model.dart';
import 'hair_model.dart';

part 'me_model.g.dart';

@JsonSerializable()
class MeModel {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? image;
  String? phone;
  String? birthDate;
  String? bloodGroup;
  String? eyeColor;
  String? macAddress;
  String? university;
  String? domain;
  String? ip;
  String? ein;
  String? ssn;
  String? userAgent;
  String? password;
  double? height;
  double? weight;
  HairModel? hair;
  AddressModel? address;
  BankModel? bank;
  CompanyModel? company;
  CryptoModel? crypto;

  MeModel(
      this.id,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.maidenName,
      this.age,
      this.gender,
      this.image,
      this.phone,
      this.birthDate,
      this.bloodGroup,
      this.eyeColor,
      this.macAddress,
      this.university,
      this.domain,
      this.ip,
      this.ein,
      this.ssn,
      this.userAgent,
      this.password,
      this.height,
      this.weight,
      this.hair,
      this.address,
      this.bank,
      this.company,
      this.crypto);

  factory MeModel.fromJson(Map<String, dynamic> json) => _$MeModelFromJson(json);
}
