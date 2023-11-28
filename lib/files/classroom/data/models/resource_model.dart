import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:tuiientitymodels/files/classroom/data/models/task_indicator_model.dart';
import 'package:tuiicore/core/enums/enums.dart';
import 'package:tuiicore/core/models/selected_file.dart';

class ResourceModel extends Equatable {
  final String? id;
  final String? classroomId;
  final String? subjectId;
  final String? tutorId;
  final String? studentId;
  final bool? studentCreated;
  final ResourceType? type;
  final String? title;
  final String? description;
  final String? thumbnailUrl;
  final String? documentUrl;
  final List<TaskIndicatorModel>? linkedTasks;
  final DateTime? creationDate;
  final DateTime? addedToClassroomDate;
  final DateTime? lastClassroomInteractionDate;
  final int? engagementViews;
  final int? engagementMinutes;
  final List<String>? tags;
  final bool? pinned;
  final int? pinnedIndex;
  final ClassroomObjectExposureType? exposureType;
  final String? exposureObjectId;
  final bool? exposureObjectActivated;
  final SelectedFile? selectedFile;
  final String? originalHash;
  final String? fileHash;
  final bool isDirty;
  final bool isNewTask;
  final bool isEmpty;

  const ResourceModel({
    this.id,
    this.classroomId,
    this.subjectId,
    this.tutorId,
    this.studentId,
    this.studentCreated,
    this.type,
    this.title,
    this.description,
    this.thumbnailUrl,
    this.documentUrl,
    this.linkedTasks,
    this.creationDate,
    this.addedToClassroomDate,
    this.lastClassroomInteractionDate,
    this.engagementViews,
    this.engagementMinutes,
    this.tags,
    this.pinned,
    this.pinnedIndex,
    this.exposureType,
    this.exposureObjectId,
    this.exposureObjectActivated,
    this.selectedFile,
    this.originalHash,
    this.fileHash,
    this.isNewTask = false,
    this.isDirty = false,
    this.isEmpty = false,
  });

  factory ResourceModel.empty() {
    return const ResourceModel(isEmpty: true);
  }

  @override
  List<Object?> get props => [
        id,
        classroomId,
        subjectId,
        tutorId,
        studentId,
        studentCreated,
        type,
        title,
        description,
        thumbnailUrl,
        documentUrl,
        linkedTasks,
        creationDate,
        addedToClassroomDate,
        lastClassroomInteractionDate,
        engagementViews,
        engagementMinutes,
        tags,
        pinned,
        pinnedIndex,
        exposureType,
        exposureObjectId,
        exposureObjectActivated,
        selectedFile,
        originalHash,
        fileHash,
        isDirty,
        isNewTask,
        isEmpty
      ];

  ResourceModel copyWith({
    String? id,
    String? classroomId,
    String? subjectId,
    String? tutorId,
    String? studentId,
    bool? studentCreated,
    ResourceType? type,
    String? title,
    String? description,
    String? thumbnailUrl,
    String? documentUrl,
    List<TaskIndicatorModel>? linkedTasks,
    DateTime? creationDate,
    DateTime? addedToClassroomDate,
    DateTime? lastClassroomInteractionDate,
    int? engagementViews,
    int? engagementMinutes,
    List<String>? tags,
    bool? pinned,
    int? pinnedIndex,
    ClassroomObjectExposureType? exposureType,
    String? exposureObjectId,
    bool? exposureObjectActivated,
    SelectedFile? selectedFile,
    String? originalHash,
    String? fileHash,
    bool? isDirty,
    bool? isNewTask,
  }) {
    return ResourceModel(
      id: id ?? this.id,
      classroomId: classroomId ?? this.classroomId,
      subjectId: subjectId ?? this.subjectId,
      tutorId: tutorId ?? this.tutorId,
      studentId: studentId ?? this.studentId,
      studentCreated: studentCreated ?? this.studentCreated,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      documentUrl: documentUrl ?? this.documentUrl,
      linkedTasks: linkedTasks ?? this.linkedTasks,
      creationDate: creationDate ?? this.creationDate,
      addedToClassroomDate: addedToClassroomDate ?? this.addedToClassroomDate,
      lastClassroomInteractionDate:
          lastClassroomInteractionDate ?? this.lastClassroomInteractionDate,
      engagementViews: engagementViews ?? this.engagementViews,
      engagementMinutes: engagementMinutes ?? this.engagementMinutes,
      tags: tags ?? this.tags,
      pinned: pinned ?? this.pinned,
      pinnedIndex: pinnedIndex ?? this.pinnedIndex,
      exposureType: exposureType ?? this.exposureType,
      exposureObjectId: exposureObjectId ?? this.exposureObjectId,
      exposureObjectActivated:
          exposureObjectActivated ?? this.exposureObjectActivated,
      selectedFile: selectedFile ?? this.selectedFile,
      originalHash: originalHash ?? this.originalHash,
      fileHash: fileHash ?? this.fileHash,
      isDirty: isDirty ?? this.isDirty,
      isNewTask: isNewTask ?? this.isNewTask,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'classroomId': classroomId,
      'subjectId': subjectId,
      'tutorId': tutorId,
      'studentId': studentId,
      'studentCreated': studentCreated,
      'type': type?.toMap(),
      'title': title,
      'description': description,
      'thumbnailUrl': thumbnailUrl,
      'documentUrl': documentUrl,
      'linkedTasks': linkedTasks != null
          ? linkedTasks!.map((task) => task.toMap()).toList()
          : [],
      'creationDate': creationDate?.toUtc().millisecondsSinceEpoch ??
          DateTime.now()
              .add(const Duration(days: -10))
              .toUtc()
              .millisecondsSinceEpoch,
      'addedToClassroomDate':
          addedToClassroomDate?.toUtc().millisecondsSinceEpoch ??
              DateTime.now().toUtc().millisecondsSinceEpoch,
      'lastClassroomInteractionDate':
          lastClassroomInteractionDate?.toUtc().millisecondsSinceEpoch ??
              DateTime.now().toUtc().millisecondsSinceEpoch,
      'engagementViews': engagementViews,
      'engagementMinutes': engagementMinutes,
      'tags': tags,
      'pinned': pinned,
      'pinnedIndex': pinnedIndex,
      'exposureType': exposureType?.toMap(),
      'exposureObjectId': exposureObjectId,
      'exposureObjectActivated': exposureObjectActivated,
      'fileHash': fileHash,
    };
  }

  factory ResourceModel.fromMap(Map<String, dynamic> map) {
    const staticResourceType = ResourceType.unknown;
    const staticLessonObjectExposureType = ClassroomObjectExposureType.unknown;
    return ResourceModel(
      id: map['id'],
      classroomId: map['classroomId'],
      subjectId: map['subjectId'],
      tutorId: map['tutorId'],
      studentId: map['studentId'],
      studentCreated: map['studentCreated'],
      type: staticResourceType.fromMap(map['type']),
      title: map['title'],
      description: map['description'],
      thumbnailUrl: map['thumbnailUrl'],
      documentUrl: map['documentUrl'],
      linkedTasks: map['linkedTasks'] != null
          ? List<TaskIndicatorModel>.from(map['linkedTasks']
              .map((map) => TaskIndicatorModel.fromMap(map))
              .toList())
          : [],
      creationDate: DateTime.fromMillisecondsSinceEpoch(map['creationDate'] ??
              DateTime.now()
                  .add(const Duration(days: -10))
                  .toUtc()
                  .millisecondsSinceEpoch)
          .toLocal(),
      addedToClassroomDate: DateTime.fromMillisecondsSinceEpoch(
              map['addedToClassroomDate'] ??
                  DateTime.now().toUtc().millisecondsSinceEpoch)
          .toLocal(),
      lastClassroomInteractionDate: DateTime.fromMillisecondsSinceEpoch(
              map['lastClassroomInteractionDate'] ??
                  DateTime.now().toUtc().millisecondsSinceEpoch)
          .toLocal(),
      engagementViews: map['engagementViews']?.toInt(),
      engagementMinutes: map['engagementMinutes']?.toInt(),
      tags: List<String>.from(map['tags']),
      pinned: map['pinned'],
      pinnedIndex: map['pinnedIndex']?.toInt(),
      exposureType: staticLessonObjectExposureType.fromMap(map['exposureType']),
      exposureObjectId: map['exposureObjectId'],
      exposureObjectActivated: map['exposureObjectActivated'],
      fileHash: map['fileHash'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResourceModel.fromJson(String source) =>
      ResourceModel.fromMap(json.decode(source));
}
