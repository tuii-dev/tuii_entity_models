import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuiientitymodels/files/classroom/data/models/classroom_model.dart';

class TutorHomeModel extends Equatable {
  final String? id;
  final String? tutorId;
  final List<ClassroomModel>? classrooms;

  const TutorHomeModel({
    this.id,
    this.tutorId,
    this.classrooms,
  });

  @override
  List<Object?> get props => [id, tutorId, classrooms];

  TutorHomeModel copyWith({
    String? id,
    String? tutorId,
    List<ClassroomModel>? classrooms,
  }) {
    return TutorHomeModel(
      id: id ?? this.id,
      tutorId: tutorId ?? this.tutorId,
      classrooms: classrooms ?? this.classrooms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tutorId': tutorId,
      'classrooms': classrooms?.map((x) => x.toMap()).toList(),
    };
  }

  factory TutorHomeModel.fromMap(Map<String, dynamic> map) {
    return TutorHomeModel(
      id: map['id'],
      tutorId: map['tutorId'],
      classrooms: map['classrooms'] != null
          ? List<ClassroomModel>.from(
              map['classrooms']?.map((x) => ClassroomModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TutorHomeModel.fromJson(String source) =>
      TutorHomeModel.fromMap(json.decode(source));
}
