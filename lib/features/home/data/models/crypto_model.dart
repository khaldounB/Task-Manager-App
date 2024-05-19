// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'crypto_model.g.dart';

@JsonSerializable()
class CryptoModel{
  String? coin;
  String? wallet;
  String? network;

  CryptoModel(this.coin, this.wallet, this.network);

  factory CryptoModel.fromJson(Map<String,dynamic> json) => _$CryptoModelFromJson(json);
}
