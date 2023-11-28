import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tuiicore/core/enums/enums.dart';
import 'package:tuiicore/core/models/reminder_schedule_model.dart';

class TaskModel extends Equatable {
  final String? id;
  final String? classroomId;
  final String? subjectId;
  final TaskItemType? type;
  final String? title;
  final String? description;
  final TaskStatusType? status;
  final List<String>? linkedResourceIds;
  final List<ReminderType>? notificationTypes;
  final ReminderScheduleModel? notificationSchedule;
  final DateTime? addedToClassroomDate;
  final DateTime? dueDate;
  final int? engagementViews;
  final int? engagementMinutes;
  final bool? pinned;
  final int? pinnedIndex;
  final bool? supportsResourceDrop;
  final ClassroomObjectExposureType? exposureType;
  final String? exposureObjectId;
  final bool? exposureObjectActivated;
  final Key? sortKey;
  final bool isNewTask;
  final bool isEmpty;

  const TaskModel({
    this.id,
    this.classroomId,
    this.subjectId,
    this.type,
    this.title,
    this.description,
    this.status,
    this.linkedResourceIds,
    this.notificationTypes,
    this.notificationSchedule,
    this.addedToClassroomDate,
    this.dueDate,
    this.engagementViews,
    this.engagementMinutes,
    this.pinned,
    this.pinnedIndex,
    this.supportsResourceDrop,
    this.exposureType,
    this.exposureObjectId,
    this.exposureObjectActivated,
    this.sortKey,
    this.isEmpty = false,
    this.isNewTask = false,
  });

  factory TaskModel.empty() {
    return const TaskModel(isEmpty: true);
  }

  @override
  List<Object?> get props => [
        id,
        classroomId,
        subjectId,
        type,
        title,
        description,
        status,
        linkedResourceIds,
        notificationTypes,
        notificationSchedule,
        dueDate,
        addedToClassroomDate,
        engagementViews,
        engagementMinutes,
        pinned,
        pinnedIndex,
        supportsResourceDrop,
        exposureType,
        exposureObjectId,
        exposureObjectActivated,
        sortKey,
        isNewTask,
        isEmpty,
      ];

  TaskModel copyWith({
    String? id,
    String? classroomId,
    String? subjectId,
    TaskItemType? type,
    String? title,
    String? description,
    TaskStatusType? status,
    List<String>? linkedResourceIds,
    List<ReminderType>? notificationTypes,
    ReminderScheduleModel? notificationSchedule,
    DateTime? addedToClassroomDate,
    DateTime? dueDate,
    int? engagementViews,
    int? engagementMinutes,
    bool? pinned,
    int? pinnedIndex,
    bool? supportsResourceDrop,
    ClassroomObjectExposureType? exposureType,
    String? exposureObjectId,
    bool? exposureObjectActivated,
    Key? sortKey,
  }) {
    return TaskModel(
      id: id ?? this.id,
      classroomId: classroomId ?? this.classroomId,
      subjectId: subjectId ?? this.subjectId,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      linkedResourceIds: linkedResourceIds ?? this.linkedResourceIds,
      notificationTypes: notificationTypes ?? this.notificationTypes,
      notificationSchedule: notificationSchedule ?? this.notificationSchedule,
      addedToClassroomDate: addedToClassroomDate ?? this.addedToClassroomDate,
      dueDate: dueDate ?? this.dueDate,
      engagementViews: engagementViews ?? this.engagementViews,
      engagementMinutes: engagementMinutes ?? this.engagementMinutes,
      pinned: pinned ?? this.pinned,
      pinnedIndex: pinnedIndex ?? this.pinnedIndex,
      supportsResourceDrop: supportsResourceDrop ?? this.supportsResourceDrop,
      exposureType: exposureType ?? this.exposureType,
      exposureObjectId: exposureObjectId ?? this.exposureObjectId,
      exposureObjectActivated:
          exposureObjectActivated ?? this.exposureObjectActivated,
      sortKey: sortKey ?? this.sortKey,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'classroomId': classroomId,
      'subjectId': subjectId,
      'type': type?.toMap(),
      'title': title,
      'description': description,
      'status': status?.toMap(),
      'linkedResourceIds': linkedResourceIds,
      'notificationTypes': notificationTypes != null
          ? notificationTypes!.map((x) => x.toMap()).toList()
          : [],
      'notificationSchedule': notificationSchedule?.toMap(),
      'addedToClassroomDate':
          addedToClassroomDate?.toUtc().millisecondsSinceEpoch ??
              DateTime.now().toUtc().millisecondsSinceEpoch,
      'dueDate': dueDate?.toUtc().millisecondsSinceEpoch,
      'engagementViews': engagementViews,
      'engagementMinutes': engagementMinutes,
      'pinned': pinned ?? false,
      'pinnedIndex': pinnedIndex ?? -1,
      'supportsResourceDrop': supportsResourceDrop,
      'exposureType': exposureType?.toMap(),
      'exposureObjectId': exposureObjectId,
      'exposureObjectActivated': exposureObjectActivated,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    const staticTaskItemType = TaskItemType.unknown;
    const staticReminderType = ReminderType.unknown;
    const staticTaskStatusType = TaskStatusType.unknown;
    const staticLessonObjectExposureType = ClassroomObjectExposureType.unknown;
    TaskModel task = TaskModel(
      id: map['id'],
      classroomId: map['classroomId'],
      subjectId: map['subjectId'],
      type: staticTaskItemType.fromMap(map['type']),
      title: map['title'],
      description: map['description'],
      status: staticTaskStatusType.fromMap(map['status']),
      linkedResourceIds: List<String>.from(map['linkedResourceIds'] ?? []),
      notificationTypes: map['notificationTypes'] != null
          ? List<ReminderType>.from(map['notificationTypes']
              ?.map((x) => staticReminderType.fromMap(x)))
          : [],
      notificationSchedule: map['notificationSchedule'] != null
          ? ReminderScheduleModel.fromMap(map['notificationSchedule'])
          : null,
      addedToClassroomDate: DateTime.fromMillisecondsSinceEpoch(
              map['addedToClassroomDate'] ??
                  DateTime.now().toUtc().millisecondsSinceEpoch)
          .toLocal(),
      dueDate: map['dueDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dueDate']).toLocal()
          : null,
      engagementViews:
          map['engagementViews'] != null ? map['engagementViews'].toInt() : 0,
      engagementMinutes: map['engagementMinutes'] != null
          ? map['engagementMinutes'].toInt()
          : 0,
      pinned: map['pinned'] ?? false,
      pinnedIndex: map['pinnedIndex']?.toInt() ?? -1,
      supportsResourceDrop: map['supportsResourceDrop'] ?? true,
      exposureType: staticLessonObjectExposureType.fromMap(map['exposureType']),
      exposureObjectId: map['exposureObjectId'],
      exposureObjectActivated: map['exposureObjectActivated'],
    );

    // Temp
    if (task.type == TaskItemType.quiz) {
      task = task.copyWith(supportsResourceDrop: false);
    }
    return task;
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));
}
