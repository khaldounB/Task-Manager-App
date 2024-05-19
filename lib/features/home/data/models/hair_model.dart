// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'hair_model.g.dart';

@JsonSerializable()
class HairModel{
  String? color;
  String? type;

  HairModel(this.color, this.type);

  factory HairModel.fromJson(Map<String,dynamic> json) => _$HairModelFromJson(json);
}
