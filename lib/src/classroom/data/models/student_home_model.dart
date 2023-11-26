import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/classroom/data/models/classroom_model.dart';

class StudentHomeModel extends Equatable {
  final String? id;
  final String? studentId;
  final List<ClassroomModel>? classrooms;

  const StudentHomeModel({
    this.id,
    this.studentId,
    this.classrooms,
  });

  @override
  List<Object?> get props => [id, studentId, classrooms];

  StudentHomeModel copyWith({
    String? id,
    String? studentId,
    List<ClassroomModel>? classrooms,
  }) {
    return StudentHomeModel(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      classrooms: classrooms ?? this.classrooms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentId': studentId,
      'classrooms': classrooms?.map((x) => x.toMap()).toList(),
    };
  }

  factory StudentHomeModel.fromMap(Map<String, dynamic> map) {
    return StudentHomeModel(
      id: map['id'],
      studentId: map['studentId'],
      classrooms: map['classrooms'] != null
          ? List<ClassroomModel>.from(
              map['classrooms']?.map((x) => ClassroomModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentHomeModel.fromJson(String source) =>
      StudentHomeModel.fromMap(json.decode(source));
}
