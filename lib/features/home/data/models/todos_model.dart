// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'todo_model.dart';

part 'todos_model.g.dart';

@JsonSerializable()
class ToDosModel{
  List<ToDoModel>? todos;
  int? total;
  int? limit;

  ToDosModel(this.todos, this.total, this.limit);

  factory ToDosModel.fromJson(Map<String,dynamic> json) => _$ToDosModelFromJson(json);
}
