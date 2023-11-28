import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:tuiientitymodels/files/classroom/data/models/lesson_model.dart';
import 'package:tuiientitymodels/files/classroom/data/models/resource_model.dart';
import 'package:tuiientitymodels/files/classroom/data/models/task_model.dart';

class SubjectModel extends Equatable {
  final String? subjectId;
  final String? name;
  final String? key;
  final DateTime? nextLessonStartDate;
  final List<LessonModel>? lessons;
  final List<TaskModel>? tasks;
  final List<ResourceModel>? resources;
  final bool? isInitialized;
  final bool isEmpty;

  const SubjectModel({
    this.subjectId,
    this.name,
    this.key,
    this.nextLessonStartDate,
    this.lessons,
    this.tasks,
    this.resources,
    this.isInitialized = false,
    this.isEmpty = false,
  });

  factory SubjectModel.empty() {
    return const SubjectModel(isEmpty: true);
  }

  @override
  List<Object?> get props => [
        subjectId,
        name,
        key,
        nextLessonStartDate,
        lessons,
        tasks,
        resources,
        isInitialized,
      ];

  SubjectModel copyWith(
      {String? subjectId,
      String? name,
      String? key,
      DateTime? nextLessonStartDate,
      List<LessonModel>? lessons,
      List<TaskModel>? tasks,
      List<ResourceModel>? resources,
      bool? isInitialized}) {
    return SubjectModel(
      subjectId: subjectId ?? this.subjectId,
      name: name ?? this.name,
      key: key ?? this.key,
      nextLessonStartDate: nextLessonStartDate ?? this.nextLessonStartDate,
      lessons: lessons ?? this.lessons,
      tasks: tasks ?? this.tasks,
      resources: resources ?? this.resources,
      isInitialized: isInitialized ?? this.isInitialized,
    );
  }

  SubjectModel addLesson(LessonModel lesson) {
    List<LessonModel> newLessons = [...(lessons ?? []), lesson];
    return copyWith(lessons: newLessons);
  }

  SubjectModel addTask(TaskModel task) {
    List<TaskModel> newTasks = [...(tasks ?? []), task];
    return copyWith(tasks: newTasks);
  }

  SubjectModel addResource(ResourceModel resource) {
    List<ResourceModel> newResources = [...(resources ?? []), resource];
    return copyWith(resources: newResources);
  }

  Map<String, dynamic> toMap() {
    return {
      'subjectId': subjectId,
      'name': name,
      'key': key,
      'nextLessonStartDate':
          nextLessonStartDate?.toUtc().millisecondsSinceEpoch,
      'lessons': lessons?.map((x) => x.toMap()).toList(),
      'tasks': tasks?.map((x) => x.toMap()).toList(),
      'resources': resources?.map((x) => x.toMap()).toList(),
      'isInitialized': isInitialized,
      'isEmpty': isEmpty,
    };
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      subjectId: map['subjectId'],
      name: map['name'],
      key: map['key'],
      nextLessonStartDate: map['nextLessonStartDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['nextLessonStartDate'])
              .toLocal()
          : null,
      lessons: map['lessons'] != null
          ? List<LessonModel>.from(
              map['lessons']?.map((x) => LessonModel.fromMap(x)))
          : [],
      tasks: map['tasks'] != null
          ? List<TaskModel>.from(map['tasks']?.map((x) => TaskModel.fromMap(x)))
          : [],
      resources: map['resources'] != null
          ? List<ResourceModel>.from(
              map['resources']?.map((x) => ResourceModel.fromMap(x)))
          : [],
      isInitialized: map['isInitialized'] ?? false,
      isEmpty: map['isEmpty'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectModel.fromJson(String source) =>
      SubjectModel.fromMap(json.decode(source));
}
