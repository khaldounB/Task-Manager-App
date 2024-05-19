// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel{
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;

  LoginModel(this.id, this.username, this.email, this.firstName, this.lastName,
      this.gender, this.image, this.token);

  factory LoginModel.fromJson(Map<String,dynamic> json) => _$LoginModelFromJson(json);
}
