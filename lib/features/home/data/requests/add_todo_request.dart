// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'add_todo_request.g.dart';

@JsonSerializable()
class AddToDoRequest{
  String todo;
  bool completed;
  int userId;

  AddToDoRequest(this.todo, this.completed, this.userId);

  Map<String,dynamic> toJson() => _$AddToDoRequestToJson(this);
}
