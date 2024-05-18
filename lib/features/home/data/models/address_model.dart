// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel{
  String address;
  String city;
  String postalCode;
  String state;
  CoordinatesModel coordinates;

  AddressModel(
      this.address, this.city, this.postalCode, this.state, this.coordinates);

  factory AddressModel.fromJson(Map<String,dynamic> json) => _$AddressModelFromJson(json);
}

@JsonSerializable()
class CoordinatesModel{
  double lat;
  double lng;

  CoordinatesModel(this.lat, this.lng);

  factory CoordinatesModel.fromJson(Map<String,dynamic> json) => _$CoordinatesModelFromJson(json);
}
