import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/classroom/data/models/classroom_model.dart';
import 'package:tuii_entity_models/src/classroom/data/models/parent_tutor_connection_model.dart';

class ParentHomeModel extends Equatable {
  final String? id;
  final String? parentId;
  final List<ParentTutorConnectionModel>? tutorConnections;
  final List<ClassroomModel>? classrooms;

  const ParentHomeModel({
    this.id,
    this.parentId,
    this.tutorConnections,
    this.classrooms,
  });

  @override
  List<Object?> get props => [id, parentId, tutorConnections, classrooms];

  ParentHomeModel copyWith({
    String? id,
    String? parentId,
    List<ParentTutorConnectionModel>? tutorConnections,
    List<ClassroomModel>? classrooms,
  }) {
    return ParentHomeModel(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      tutorConnections: tutorConnections ?? this.tutorConnections,
      classrooms: classrooms ?? this.classrooms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parentId': parentId,
      'tutorConnections': tutorConnections?.map((x) => x.toMap()).toList(),
      'classrooms': classrooms?.map((x) => x.toMap()).toList(),
    };
  }

  factory ParentHomeModel.fromMap(Map<String, dynamic> map) {
    return ParentHomeModel(
      id: map['id'],
      parentId: map['parentId'],
      tutorConnections: map['tutorConnections'] != null
          ? List<ParentTutorConnectionModel>.from(map['tutorConnections']
              ?.map((x) => ParentTutorConnectionModel.fromMap(x)))
          : [],
      classrooms: map['classrooms'] != null
          ? List<ClassroomModel>.from(
              map['classrooms']?.map((x) => ClassroomModel.fromMap(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ParentHomeModel.fromJson(String source) =>
      ParentHomeModel.fromMap(json.decode(source));
}
