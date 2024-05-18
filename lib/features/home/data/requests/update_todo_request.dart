// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'update_todo_request.g.dart';

@JsonSerializable()
class UpdateTodoRequest{
  bool completed;

  UpdateTodoRequest(this.completed);

  Map<String,dynamic> toJson() => _$UpdateTodoRequestToJson(this);
}
