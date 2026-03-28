// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToDoListModelImpl _$$ToDoListModelImplFromJson(Map<String, dynamic> json) =>
    _$ToDoListModelImpl(
      userId: (json['userId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$$ToDoListModelImplToJson(_$ToDoListModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
