import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/classroom/data/models/classroom_model.dart';
import 'package:tuii_entity_models/src/classroom/data/models/resource_model.dart';
import 'package:tuii_entity_models/src/classroom/data/models/subject_model.dart';
import 'package:tuiicore/core/enums/lesson_object_exposure_type.dart';

import 'package:tuiicore/core/enums/tuii_role_type.dart';

class ClassroomResourceItemRoutePayload extends Equatable {
  final String? userId;
  final TuiiRoleType? roleType;
  final String? classroomId;
  final String? subjectId;
  final List<String>? filterResourceIds;
  final bool? yieldFromClassroom;
  final List<ResourceModel>? classroomResources;
  final ClassroomModel? classroom;
  final SubjectModel? subject;
  final String? fontFamily;
  final bool? isNewResource;
  final bool? canEdit;
  final ResourceModel? resource;
  final bool? exposureObjectActivated;
  final String? exposureObjectId;
  final ClassroomObjectExposureType? exposureType;
  final bool? isLessonInitialized;
  final bool? isStudent;
  final bool? isMp3Resource;

  const ClassroomResourceItemRoutePayload({
    this.userId,
    this.roleType,
    this.classroomId,
    this.subjectId,
    this.filterResourceIds,
    this.yieldFromClassroom,
    this.classroomResources,
    this.classroom,
    this.subject,
    this.fontFamily,
    this.isNewResource,
    this.canEdit,
    this.resource,
    this.exposureObjectActivated,
    this.exposureObjectId,
    this.exposureType,
    this.isLessonInitialized,
    this.isStudent,
    this.isMp3Resource = false,
  });

  ClassroomResourceItemRoutePayload copyWith({
    String? userId,
    TuiiRoleType? roleType,
    String? classroomId,
    String? subjectId,
    List<String>? filterResourceIds,
    bool? yieldFromClassroom,
    List<ResourceModel>? classroomResources,
    ClassroomModel? classroom,
    SubjectModel? subject,
    String? fontFamily,
    bool? isNewResource,
    bool? canEdit,
    ResourceModel? resource,
    bool? exposureObjectActivated,
    String? exposureObjectId,
    ClassroomObjectExposureType? exposureType,
    bool? isLessonInitialized,
    bool? isStudent,
    bool? isMp3Resource,
  }) {
    return ClassroomResourceItemRoutePayload(
      userId: userId ?? this.userId,
      roleType: roleType ?? this.roleType,
      classroomId: classroomId ?? this.classroomId,
      subjectId: subjectId ?? this.subjectId,
      filterResourceIds: filterResourceIds ?? this.filterResourceIds,
      yieldFromClassroom: yieldFromClassroom ?? this.yieldFromClassroom,
      classroomResources: classroomResources ?? this.classroomResources,
      classroom: classroom ?? this.classroom,
      subject: subject ?? this.subject,
      fontFamily: fontFamily ?? this.fontFamily,
      isNewResource: isNewResource ?? this.isNewResource,
      canEdit: canEdit ?? this.canEdit,
      resource: resource ?? this.resource,
      exposureObjectActivated:
          exposureObjectActivated ?? this.exposureObjectActivated,
      exposureObjectId: exposureObjectId ?? this.exposureObjectId,
      exposureType: exposureType ?? this.exposureType,
      isLessonInitialized: isLessonInitialized ?? this.isLessonInitialized,
      isStudent: isStudent ?? this.isStudent,
      isMp3Resource: isMp3Resource ?? this.isMp3Resource,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'roleType': roleType?.toMap(),
      'classroomId': classroomId,
      'subjectId': subjectId,
      'filterResourceIds': filterResourceIds,
      'yieldFromClassroom': yieldFromClassroom,
      'classroomResources': classroomResources?.map((x) => x.toMap()).toList(),
      'classroom': classroom?.toMap(),
      'subject': subject?.toMap(),
      'fontFamily': fontFamily,
      'isNewResource': isNewResource,
      'canEdit': canEdit,
      'resource': resource?.toMap(),
      'exposureObjectActivated': exposureObjectActivated,
      'exposureObjectId': exposureObjectId,
      'exposureType': exposureType?.toMap(),
      'isLessonInitialized': isLessonInitialized,
      'isStudent': isStudent,
      'isMp3Resource': isMp3Resource
    };
  }

  factory ClassroomResourceItemRoutePayload.fromMap(Map<String, dynamic> map) {
    const staticRoleType = TuiiRoleType.unknown;
    const staticClassroomObjectExposureType =
        ClassroomObjectExposureType.unknown;

    return ClassroomResourceItemRoutePayload(
      userId: map['userId'],
      roleType: staticRoleType.fromMap(map['roleType']),
      classroomId: map['classroomId'],
      subjectId: map['subjectId'],
      filterResourceIds: List<String>.from(map['filterResourceIds']),
      yieldFromClassroom: map['yieldFromClassroom'],
      classroomResources: map['classroomResources'] != null
          ? List<ResourceModel>.from(
              map['classroomResources']?.map((x) => ResourceModel.fromMap(x)))
          : null,
      classroom: map['classroom'] != null
          ? ClassroomModel.fromMap(map['classroom'])
          : null,
      subject:
          map['subject'] != null ? SubjectModel.fromMap(map['subject']) : null,
      fontFamily: map['fontFamily'],
      isNewResource: map['isNewResource'],
      canEdit: map['canEdit'],
      resource: map['resource'] != null
          ? ResourceModel.fromMap(map['resource'])
          : null,
      exposureObjectActivated: map['exposureObjectActivated'],
      exposureObjectId: map['exposureObjectId'],
      exposureType:
          staticClassroomObjectExposureType.fromMap(map['exposureType']),
      isLessonInitialized: map['isLessonInitialized'],
      isStudent: map['isStudent'],
      isMp3Resource: map['isMp3Resource'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassroomResourceItemRoutePayload.fromJson(String source) =>
      ClassroomResourceItemRoutePayload.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClassroomResourceItemRoutePayload(userId: $userId, roleType: $roleType, classroomId: $classroomId, subjectId: $subjectId, filterResourceIds: $filterResourceIds, yieldFromClassroom: $yieldFromClassroom, classroomResources: $classroomResources, classroom: $classroom, subject: $subject, fontFamily: $fontFamily, isNewResource: $isNewResource, canEdit: $canEdit, exposureObjectActivated: $exposureObjectActivated, exposureObjectId: $exposureObjectId, exposureType: $exposureType, isLessonInitialized: $isLessonInitialized, isStudent: $isStudent)';
  }

  @override
  List<Object?> get props {
    return [
      userId,
      roleType,
      classroomId,
      subjectId,
      filterResourceIds,
      yieldFromClassroom,
      classroomResources,
      classroom,
      subject,
      fontFamily,
      isNewResource,
      canEdit,
      resource,
      exposureObjectActivated,
      exposureObjectId,
      exposureType,
      isLessonInitialized,
      isStudent,
      isMp3Resource,
    ];
  }
}
