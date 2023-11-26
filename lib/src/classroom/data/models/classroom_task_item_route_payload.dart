import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/classroom/data/models/classroom_model.dart';
import 'package:tuii_entity_models/src/classroom/data/models/resource_model.dart';
import 'package:tuii_entity_models/src/classroom/data/models/subject_model.dart';
import 'package:tuii_entity_models/src/classroom/data/models/task_model.dart';

import 'package:tuiicore/core/enums/lesson_object_exposure_type.dart';

class ClassroomTaskItemRoutePayload extends Equatable {
  final String? userId;
  final String? classroomId;
  final List<ResourceModel>? serverResources;
  final ClassroomModel? classroom;
  final SubjectModel? subject;
  final String? fontFamily;
  final bool? isNewTask;
  final TaskModel? task;
  final bool? exposureObjectActivated;
  final String? exposureObjectId;
  final ClassroomObjectExposureType? exposureType;
  final bool? isLessonInitialized;
  final bool? isTutor;

  const ClassroomTaskItemRoutePayload({
    this.userId,
    this.classroomId,
    this.serverResources,
    this.classroom,
    this.subject,
    this.fontFamily,
    this.isNewTask,
    this.task,
    this.exposureObjectActivated,
    this.exposureObjectId,
    this.exposureType,
    this.isLessonInitialized,
    this.isTutor,
  });

  ClassroomTaskItemRoutePayload copyWith({
    String? userId,
    String? classroomId,
    List<ResourceModel>? serverResources,
    ClassroomModel? classroom,
    SubjectModel? subject,
    String? fontFamily,
    bool? isNewTask,
    TaskModel? task,
    bool? exposureObjectActivated,
    String? exposureObjectId,
    ClassroomObjectExposureType? exposureType,
    bool? isLessonInitialized,
    bool? isTutor,
  }) {
    return ClassroomTaskItemRoutePayload(
      userId: userId ?? this.userId,
      classroomId: classroomId ?? this.classroomId,
      serverResources: serverResources ?? this.serverResources,
      classroom: classroom ?? this.classroom,
      subject: subject ?? this.subject,
      fontFamily: fontFamily ?? this.fontFamily,
      isNewTask: isNewTask ?? this.isNewTask,
      task: task ?? this.task,
      exposureObjectActivated:
          exposureObjectActivated ?? this.exposureObjectActivated,
      exposureObjectId: exposureObjectId ?? this.exposureObjectId,
      exposureType: exposureType ?? this.exposureType,
      isLessonInitialized: isLessonInitialized ?? this.isLessonInitialized,
      isTutor: isTutor ?? this.isTutor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'classroomId': classroomId,
      'serverResources': serverResources?.map((x) => x.toMap()).toList(),
      'classroom': classroom?.toMap(),
      'subject': subject?.toMap(),
      'fontFamily': fontFamily,
      'isNewTask': isNewTask,
      'task': task?.toMap(),
      'exposureObjectActivated': exposureObjectActivated,
      'exposureObjectId': exposureObjectId,
      'exposureType': exposureType?.toMap(),
      'isLessonInitialized': isLessonInitialized,
      'isTutor': isTutor,
    };
  }

  factory ClassroomTaskItemRoutePayload.fromMap(Map<String, dynamic> map) {
    const staticClassroomObjectExposureType =
        ClassroomObjectExposureType.unknown;

    return ClassroomTaskItemRoutePayload(
      userId: map['userId'],
      classroomId: map['classroomId'],
      serverResources: map['serverResources'] != null
          ? List<ResourceModel>.from(
              map['serverResources']?.map((x) => ResourceModel.fromMap(x)))
          : null,
      classroom: map['classroom'] != null
          ? ClassroomModel.fromMap(map['classroom'])
          : null,
      subject:
          map['subject'] != null ? SubjectModel.fromMap(map['subject']) : null,
      fontFamily: map['fontFamily'],
      isNewTask: map['isNewTask'],
      task: map['task'] != null ? TaskModel.fromMap(map['task']) : null,
      exposureObjectActivated: map['exposureObjectActivated'],
      exposureObjectId: map['exposureObjectId'],
      exposureType:
          staticClassroomObjectExposureType.fromMap(map['exposureType']),
      isLessonInitialized: map['isLessonInitialized'],
      isTutor: map['isTutor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassroomTaskItemRoutePayload.fromJson(String source) =>
      ClassroomTaskItemRoutePayload.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClassroomTaskItemRoutePayload(userId: $userId, classroomId: $classroomId, serverResources: $serverResources, classroom: $classroom, subject: $subject, fontFamily: $fontFamily, isNewTask: $isNewTask, task: $task, exposureObjectActivated: $exposureObjectActivated, exposureObjectId: $exposureObjectId, exposureType: $exposureType, isLessonInitialized: $isLessonInitialized, isTutor: $isTutor)';
  }

  @override
  List<Object?> get props {
    return [
      userId,
      classroomId,
      serverResources,
      classroom,
      subject,
      fontFamily,
      isNewTask,
      task,
      exposureObjectActivated,
      exposureObjectId,
      exposureType,
      isLessonInitialized,
      isTutor,
    ];
  }
}
