// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDosModel _$ToDosModelFromJson(Map<String, dynamic> json) => ToDosModel(
      (json['todos'] as List<dynamic>)
          .map((e) => ToDoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['total'] as num).toInt(),
      (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$ToDosModelToJson(ToDosModel instance) =>
    <String, dynamic>{
      'todos': instance.todos,
      'total': instance.total,
      'limit': instance.limit,
    };
