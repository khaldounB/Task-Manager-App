// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import '../../../core/constants/material_design/k_keys.dart';
import '../../../core/logic/singleton/statics.dart';
import '../../../core/services/authentication_services/auth_services.dart';
import '../data/models/me_model.dart';
import '../data/models/todo_model.dart';
import '../data/models/todos_model.dart';
import '../data/requests/add_todo_request.dart';
import '../network/repo/home_repo.dart';
import '../network/repo/todo_repo.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider({required BuildContext context,required bool load}) {
    load?refreshToken(context: context):null;
  }

  final HomeRepo _homeRepo = HomeRepo();
  final ToDoRepo _toDoRepo = ToDoRepo();

  TextEditingController todoController = TextEditingController();
  bool _todoError = false;


  bool get todoError => _todoError;

  set todoError(bool value) {
    _todoError = value;
    notifyListeners();
  }

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

    await _homeRepo.refreshToken().then((value)async {
      if (value.response.statusCode == 200) {
        box.saveString(key: KKeys().token, value: value.data.token!);
        await getToDos(context: context,limit: 10);
      } else if (value.response.statusCode == 401) {
        AuthServices().deleteData();
        context.pushReplacement('/login');
      } else {
        context.pushReplacement('/login');
      }
    });
  }

  Future<void> getToDos({required BuildContext context,required int limit}) async {
    await _toDoRepo.getToDos(box.getSaveData(key: KKeys().id),limit,0).then((value) {
      if (value.response.statusCode == 200) {
        if(limit == 10){
          toDosModel = value.data;
        }else{
          toDosModel.todos!.add(value.data.todos as ToDoModel);
        }

      } else if (value.response.statusCode == 401) {
        AuthServices().deleteData();
        context.pushReplacement('/login');
      } else {
        snack.showErrorSnack(
            context: context, message: 'Something Wrong, Please Try Later');
      }
      load = false;
    });
  }

  Future<void> addToDo(
      {required BuildContext context, required AddToDoRequest request}) async {
    await _toDoRepo.addToDos(request).then((value) {
      if (value.response.statusCode == 200) {
        toDosModel.todos!.add(value.data);
      } else if (value.response.statusCode == 401) {
        AuthServices().deleteData();
        context.pushReplacement('/login');
      } else {
        snack.showErrorSnack(
            context: context, message: 'Something Wrong, Please Try Later');
      }
      notifyListeners();
    });
  }

  Future<void> editToDo(
      {required BuildContext context, required int id}) async {
    await _toDoRepo.updateToDo(id).then((value) {
      if (value.response.statusCode == 200) {
        int index = toDosModel.todos!.indexWhere((todo) => todo.id == id);
        toDosModel.todos![index] = value.data;
      } else if (value.response.statusCode == 401) {
        AuthServices().deleteData();
        context.pushReplacement('/login');
      } else {
        snack.showErrorSnack(
            context: context, message: 'Something Wrong, Please Try Later');
      }
      notifyListeners();
    });
  }

  Future<void> deleteToDo(
      {required BuildContext context, required int id}) async {
    await _toDoRepo.deleteToDo(id).then((value) {
      if (value.response.statusCode == 200) {
        int index = toDosModel.todos!.indexWhere((todo) => todo.id == id);
        toDosModel.todos!.removeAt(index);
      } else if (value.response.statusCode == 401) {
        AuthServices().deleteData();
        context.pushReplacement('/login');
      } else {
        snack.showErrorSnack(
            context: context, message: 'Something Wrong, Please Try Later');
      }
      notifyListeners();
    });
  }

  late MeModel meModel;
  late ToDosModel toDosModel;
  late ToDoModel toDoModel;

  bool _load = true;

  bool get load => _load;

  set load(bool value) {
    _load = value;
    notifyListeners();
  }

  bool _loadAddNewTodo = false;

  bool get loadAddNewTodo => _loadAddNewTodo;

  set loadAddNewTodo(bool value) {
    _loadAddNewTodo = value;
    notifyListeners();
  }
}
