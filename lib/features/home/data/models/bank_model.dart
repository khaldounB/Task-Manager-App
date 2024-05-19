// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'bank_model.g.dart';

@JsonSerializable()
class BankModel{
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  BankModel(this.cardExpire, this.cardNumber, this.cardType, this.currency,
      this.iban);

  factory BankModel.fromJson(Map<String,dynamic> json) => _$BankModelFromJson(json);
}
