import 'package:flutter/widgets.dart';
import 'package:todolist/data/models/to_do_list_model/to_do_list_model.dart';
import 'package:todolist/data/repositories/to_do_list_repository/to_do_list_repository_impl.dart';

class ToDoVm with ChangeNotifier {
  List<ToDoListModel>? _toDoList;
  List<ToDoListModel>? get toDoList => _toDoList;
  bool _isListFetched = false;
  bool get isListFetched => _isListFetched;
  Status _status = Status.all;
  Status get status => _status;
  Sorting _sorting = Sorting.none;
  Sorting get sorting => _sorting;
  int _totalCount = 0;
  int get totalCount => _totalCount;

  Future<void> fetchToDoList({
    String searchText = '',
    Status statusValue = Status.all,
    Sorting sortValue = Sorting.none,
  }) async {
    try {
      _toDoList = null;
      dynamic getToDoList = await ToDoListRepositoryImpl().apiCalls
          .getToDoList();
      if (getToDoList is List) {
        _status = statusValue;
        _sorting = sortValue;
        _toDoList = getToDoList
            .map((json) => ToDoListModel.fromJson(json as Map<String, dynamic>))
            .toList();
        if (toDoList != null && (toDoList?.length ?? 0) > 0) {
          _totalCount = _toDoList!.length;
          if (searchText.isNotEmpty) {
            _toDoList = toDoList!
                .where((item) => item.title!.startsWith(searchText))
                .toList();
          }
          switch (statusValue) {
            case Status.all:
              _toDoList = toDoList!;
            case Status.pending:
              _toDoList = toDoList!
                  .where((item) => item.completed == false)
                  .toList();
            case Status.completed:
              _toDoList = toDoList!
                  .where((item) => item.completed == true)
                  .toList();
          }
          switch (sortValue) {
            case Sorting.none:
              _toDoList = toDoList!;
            case Sorting.az:
              _toDoList!.sort(
                (a, b) =>
                    a.title!.toLowerCase().compareTo(b.title!.toLowerCase()),
              );
            case Sorting.za:
              _toDoList!.sort(
                (a, b) =>
                    b.title!.toLowerCase().compareTo(a.title!.toLowerCase()),
              );
            case Sorting.firstCompleted:
              _toDoList!.sort((a, b) {
                int cmp = a.userId!.compareTo(b.userId!);
                if (cmp == 0) {
                  return a.id!.compareTo(b.id!);
                }
                return cmp;
              });
            case Sorting.lastCompleted:
              _toDoList!.sort((a, b) {
                int cmp = b.userId!.compareTo(a.userId!);
                if (cmp == 0) {
                  return b.id!.compareTo(a.id!);
                }
                return cmp;
              });
          }
        }
      }
      if (_toDoList != null) {
        _isListFetched = true;
      }
    } finally {
      notifyListeners();
    }
  }

  static String returnStatus(Status status) {
    switch (status) {
      case Status.pending:
        return "Pending";
      case Status.completed:
        return "Completed";
      case Status.all:
        return "All";
    }
  }

  static String returnSorting(Sorting sort) {
    switch (sort) {
      case Sorting.az:
        return "A-Z";
      case Sorting.za:
        return "Z-A";
      case Sorting.firstCompleted:
        return "First Completed";
      case Sorting.lastCompleted:
        return "Last Completed";
      case Sorting.none:
        return "None";
    }
  }
}

enum Status { pending, completed, all }

enum Sorting { az, za, firstCompleted, lastCompleted, none }
