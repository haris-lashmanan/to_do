import 'package:flutter/cupertino.dart';
import 'package:todolist/data/models/to_do_list_model/to_do_list_model.dart';
import 'package:todolist/data/networks/api_calls.dart';
import 'package:todolist/data/repositories/to_do_list_repository/to_do_list_repository.dart';

class ToDoListRepositoryImpl implements ToDoListRepository {
  ApiCalls apiCalls = ApiCalls();
  @override
  Future<ToDoListModel?> fetchToDoList() async {
    try {
      dynamic todoList = await apiCalls.getToDoList();
      ToDoListModel? todoListValue = ToDoListModel.fromJson(todoList);
      return todoListValue;
    } on Exception catch (e) {
      debugPrint('Exception: $e');
      return null;
    }
  }
}
