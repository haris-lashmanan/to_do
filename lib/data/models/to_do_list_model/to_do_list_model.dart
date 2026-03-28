// To parse this JSON data, do
//
//     final toDoListModel = toDoListModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_do_list_model.freezed.dart';
part 'to_do_list_model.g.dart';

ToDoListModel toDoListModelFromJson(String str) =>
    ToDoListModel.fromJson(json.decode(str));

String toDoListModelToJson(ToDoListModel data) => json.encode(data.toJson());

@freezed
class ToDoListModel with _$ToDoListModel {
  const factory ToDoListModel({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) = _ToDoListModel;

  factory ToDoListModel.fromJson(Map<String, dynamic> json) =>
      _$ToDoListModelFromJson(json);
}
