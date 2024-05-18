// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../../../core/constants/material_design/k_keys.dart';
import '../../../core/logic/singleton/statics.dart';
import '../data/models/me_model.dart';
import '../data/models/todo_model.dart';
import '../data/models/todos_model.dart';
import '../data/requests/add_todo_request.dart';
import '../network/repo/home_repo.dart';
import '../network/repo/todo_repo.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider({required BuildContext context}) {
    refreshToken(context: context);
  }

  final HomeRepo _homeRepo = HomeRepo();
  final ToDoRepo _toDoRepo = ToDoRepo();

  Future<void> me({required BuildContext context}) async {
    await _homeRepo.me().then((value) {
      if (value.response.statusCode == 200) {
        meModel = value.data;
      } else {
        snack.showErrorSnack(
            context: context, message: 'Something Wrong, Please Try Later');
      }
    });
  }

  Future<void> refreshToken({required BuildContext context}) async {
    await _homeRepo.refreshToken().then((value) {
      if (value.response.statusCode == 200) {
        box.saveString(key: KKeys().token, value: value.data.token);
      } else {
        context.pushReplacement('/login');
      }
    });
  }

  Future<void> getToDos({required BuildContext context}) async {
    await _toDoRepo.getToDos().then((value){
      if(value.response.statusCode == 200){
        toDosModel = value.data;
      }else{
        snack.showErrorSnack(
            context: context, message: 'Something Wrong, Please Try Later');
      }
      notifyListeners();
    });
  }

  Future<void> addToDo(
      {required BuildContext context, required AddToDoRequest request}) async {
    await _toDoRepo.addToDos(request).then((value){
      if(value.response.statusCode == 200){
        toDosModel.todos.add(value.data);
      }else{
        snack.showErrorSnack(
            context: context, message: 'Something Wrong, Please Try Later');
      }
      notifyListeners();
    });
  }

  Future<void> editToDo(
      {required BuildContext context, required int id}) async {
    await _toDoRepo.updateToDo(id).then((value){
      if(value.response.statusCode == 200){
        int index = toDosModel.todos.indexWhere((todo) => todo.id == id);
        toDosModel.todos[index] = value.data;

      }else{
        snack.showErrorSnack(
            context: context, message: 'Something Wrong, Please Try Later');
      }
      notifyListeners();
    });
  }

  Future<void> deleteToDo(
      {required BuildContext context, required int id}) async {
    await _toDoRepo.deleteToDo(id).then((value){
      if(value.response.statusCode == 200){
        int index = toDosModel.todos.indexWhere((todo) => todo.id == id);
        toDosModel.todos.removeAt(index);
      }else{
        snack.showErrorSnack(
            context: context, message: 'Something Wrong, Please Try Later');
      }
      notifyListeners();
    });
  }

  late MeModel meModel;
  late ToDosModel toDosModel;
  late ToDoModel toDoModel;
}
