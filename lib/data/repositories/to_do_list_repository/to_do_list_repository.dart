import 'package:todolist/data/models/to_do_list_model/to_do_list_model.dart';

abstract class ToDoListRepository {
  Future<ToDoListModel?> fetchToDoList();
}
