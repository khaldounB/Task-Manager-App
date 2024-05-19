// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'address_model.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel{
  String? department;
  String? name;
  String? title;
  AddressModel? address;

  CompanyModel(this.department, this.name, this.title, this.address);

  factory CompanyModel.fromJson(Map<String,dynamic> json) => _$CompanyModelFromJson(json);
}
