// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import '../../../../core/constants/server/end_points.dart';
import '../../data/models/me_model.dart';
import '../../data/models/refresh_token_model.dart';
import '../../data/models/todo_model.dart';
import '../../data/models/todos_model.dart';
import '../../data/requests/add_todo_request.dart';

part 'todo_services.g.dart';

@RestApi(baseUrl: EndPoints.api)
abstract class ToDoServices{
  factory ToDoServices(Dio dio, {String baseUrl}) =
  _ToDoServices;
  
  @GET(EndPoints.getAllToDo)
  Future<HttpResponse<ToDosModel>> getAllToDos(@Path('id') int id, @Path('limit') int limit, @Path('skip') int skip);
  
  @POST(EndPoints.addToDo)
  Future<HttpResponse<ToDoModel>> addToDo(@Body() AddToDoRequest request);
  
  @PUT(EndPoints.toDo)
  Future<HttpResponse<ToDoModel>> updateToDo(@Path('id') int id);

  @DELETE(EndPoints.toDo)
  Future<HttpResponse<ToDoModel>> deleteToDo(@Path('id') int id);
}
