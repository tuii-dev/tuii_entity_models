import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuiientitymodels/files/auth/data/models/global_subject_model.dart';
import 'package:tuiientitymodels/files/classroom/data/models/subject_model.dart';

import 'package:tuiicore/core/enums/tuii_role_type.dart';

class GlobalUserSubjectModel extends Equatable {
  final String? id;
  final String? key;
  final List<String>? searchTags;
  final String? subjectId;
  final String? subjectName;
  final String? userId;
  final TuiiRoleType? userPrimaryRole;

  const GlobalUserSubjectModel({
    this.id,
    this.key,
    this.searchTags,
    this.subjectId,
    this.subjectName,
    this.userId,
    this.userPrimaryRole,
  });

  factory GlobalUserSubjectModel.init(
      String userId, TuiiRoleType role, GlobalSubjectModel subject) {
    return GlobalUserSubjectModel(
      key: subject.key,
      searchTags: subject.searchTags,
      subjectId: subject.id,
      subjectName: subject.name,
      userId: userId,
      userPrimaryRole: role,
    );
  }

  SubjectModel toSubjectModel() {
    return SubjectModel(
      subjectId: subjectId,
      name: subjectName,
      key: key,
    );
  }

  GlobalUserSubjectModel copyWith({
    String? id,
    String? key,
    List<String>? searchTags,
    String? subjectId,
    String? subjectName,
    String? userId,
    TuiiRoleType? userPrimaryRole,
  }) {
    return GlobalUserSubjectModel(
      id: id ?? this.id,
      key: key ?? this.key,
      searchTags: searchTags ?? this.searchTags,
      subjectId: subjectId ?? this.subjectId,
      subjectName: subjectName ?? this.subjectName,
      userId: userId ?? this.userId,
      userPrimaryRole: userPrimaryRole ?? this.userPrimaryRole,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'key': key,
      'searchTags': searchTags,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'userId': userId,
      'userPrimaryRole': userPrimaryRole?.toMap(),
    };
  }

  factory GlobalUserSubjectModel.fromMap(Map<String, dynamic> map) {
    const staticType = TuiiRoleType.unknown;
    return GlobalUserSubjectModel(
      id: map['id'],
      key: map['key'],
      searchTags: List<String>.from(map['searchTags']),
      subjectId: map['subjectId'],
      subjectName: map['subjectName'],
      userId: map['userId'],
      userPrimaryRole: staticType.fromMap(map['userPrimaryRole']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GlobalUserSubjectModel.fromJson(String source) =>
      GlobalUserSubjectModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GlobalUserSubjectModel(id: $id, searchTags: $searchTags, subjectId: $subjectId, subjectName: $subjectName, userId: $userId, userPrimaryRole: $userPrimaryRole)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      key,
      searchTags,
      subjectId,
      subjectName,
      userId,
      userPrimaryRole,
    ];
  }
}
