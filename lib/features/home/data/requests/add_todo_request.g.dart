// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_todo_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToDoRequest _$AddToDoRequestFromJson(Map<String, dynamic> json) =>
    AddToDoRequest(
      json['todo'] as String,
      json['completed'] as bool,
      (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$AddToDoRequestToJson(AddToDoRequest instance) =>
    <String, dynamic>{
      'todo': instance.todo,
      'completed': instance.completed,
      'userId': instance.userId,
    };
