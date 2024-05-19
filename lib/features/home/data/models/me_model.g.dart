// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeModel _$MeModelFromJson(Map<String, dynamic> json) => MeModel(
      (json['id'] as num?)?.toInt(),
      json['username'] as String?,
      json['email'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['maidenName'] as String?,
      (json['age'] as num?)?.toInt(),
      json['gender'] as String?,
      json['image'] as String?,
      json['phone'] as String?,
      json['birthDate'] as String?,
      json['bloodGroup'] as String?,
      json['eyeColor'] as String?,
      json['macAddress'] as String?,
      json['university'] as String?,
      json['domain'] as String?,
      json['ip'] as String?,
      json['ein'] as String?,
      json['ssn'] as String?,
      json['userAgent'] as String?,
      json['password'] as String?,
      (json['height'] as num?)?.toDouble(),
      (json['weight'] as num?)?.toDouble(),
      json['hair'] == null
          ? null
          : HairModel.fromJson(json['hair'] as Map<String, dynamic>),
      json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      json['bank'] == null
          ? null
          : BankModel.fromJson(json['bank'] as Map<String, dynamic>),
      json['company'] == null
          ? null
          : CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
      json['crypto'] == null
          ? null
          : CryptoModel.fromJson(json['crypto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeModelToJson(MeModel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'maidenName': instance.maidenName,
      'age': instance.age,
      'gender': instance.gender,
      'image': instance.image,
      'phone': instance.phone,
      'birthDate': instance.birthDate,
      'bloodGroup': instance.bloodGroup,
      'eyeColor': instance.eyeColor,
      'macAddress': instance.macAddress,
      'university': instance.university,
      'domain': instance.domain,
      'ip': instance.ip,
      'ein': instance.ein,
      'ssn': instance.ssn,
      'userAgent': instance.userAgent,
      'password': instance.password,
      'height': instance.height,
      'weight': instance.weight,
      'hair': instance.hair,
      'address': instance.address,
      'bank': instance.bank,
      'company': instance.company,
      'crypto': instance.crypto,
    };
