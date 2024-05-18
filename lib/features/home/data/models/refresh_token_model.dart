// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_model.g.dart';

@JsonSerializable()
class RefreshTokenModel{
  String token;

  RefreshTokenModel(this.token);

  factory RefreshTokenModel.fromJson(Map<String,dynamic> json) => _$RefreshTokenModelFromJson(json);
}
