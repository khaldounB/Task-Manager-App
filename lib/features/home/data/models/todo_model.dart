// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class ToDoModel{
  int id;
  String todo;
  bool completed;
  bool? isDeleted;
  DateTime? deletedOn;

  ToDoModel(this.id, this.todo, this.completed,{this.deletedOn,this.isDeleted});

  factory ToDoModel.fromJson(Map<String,dynamic> json) => _$ToDoModelFromJson(json);
}
