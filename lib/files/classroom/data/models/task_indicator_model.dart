import 'dart:convert';

import 'package:equatable/equatable.dart';

class TaskIndicatorModel extends Equatable {
  final String? id;
  final String? title;

  const TaskIndicatorModel({
    this.id,
    this.title,
  });

  @override
  List<Object?> get props => [id, title];

  TaskIndicatorModel copyWith({
    String? id,
    String? title,
  }) {
    return TaskIndicatorModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory TaskIndicatorModel.fromMap(Map<String, dynamic> map) {
    return TaskIndicatorModel(
      id: map['id'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskIndicatorModel.fromJson(String source) =>
      TaskIndicatorModel.fromMap(json.decode(source));
}
