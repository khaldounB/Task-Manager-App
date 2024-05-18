// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

// Project imports:
import '../../../../core/constants/server/end_points.dart';
import '../../../../core/logic/interceptor/interceptor.dart';
import '../../data/models/todo_model.dart';
import '../../data/models/todos_model.dart';
import '../../data/requests/add_todo_request.dart';
import '../services/todo_services.dart';

class ToDoRepo {
  static final ToDoRepo _instance = ToDoRepo._internal();
  static final _dio = Dio()..interceptors.add(ApplicationInterceptor());
  factory ToDoRepo() {
    return _instance;
  }

  ToDoRepo._internal();

  static final ToDoServices _ToDoServices =
      ToDoServices(_dio, baseUrl: EndPoints.api);

  Future<T> retry<T>(
    Future<T> Function() apiCall, {
    int maxRetries = 3,
    Duration delay = const Duration(seconds: 0),
  }) async {
    int retryCount = 0;

    Future<T> tryApiCall() async {
      try {
        return await apiCall();
      } catch (error) {
        debugPrint('Error Handling: $error');

        if (retryCount < maxRetries) {
          await Future.delayed(delay);
          retryCount++;
          return tryApiCall();
        } else {
          rethrow;
        }
      }
    }

    return tryApiCall();
  }

  Future<HttpResponse<ToDosModel>> getToDos() async =>
      await retry(() async => await _ToDoServices.getAllToDos());

  Future<HttpResponse<ToDoModel>> addToDos(AddToDoRequest request) async =>
      await retry(() async => await _ToDoServices.addToDo(request));

  Future<HttpResponse<ToDoModel>> updateToDo(int id) async =>
      await retry(() async => await _ToDoServices.updateToDo(id));

  Future<HttpResponse<ToDoModel>> deleteToDo(int id) async =>
      await retry(() async => await _ToDoServices.deleteToDo(id));
}
