import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tuiientitymodels/files/classroom/data/models/classroom_model.dart';
import 'package:tuiientitymodels/files/classroom/data/models/lesson_model.dart';
import 'package:tuiientitymodels/files/classroom/data/models/resource_model.dart';
import 'package:tuiientitymodels/files/classroom/data/models/task_model.dart';
import 'package:tuiicore/core/common/tutor_lesson_index_model.dart';

class HomeLessonShimHydrationBridge {
  final Future<List<LessonModel>> Function(DocumentReference<Object?>, String)
      getClassroomLessons;
  final Future<List<TaskModel>> Function(DocumentReference<Object?>, String)
      getClassroomTasks;
  final Future<List<ResourceModel>> Function(DocumentReference<Object?>, String)
      getClassroomResources;
  final Future<LessonModel> Function(LessonIndexModel) getLesson;
  final void Function(ClassroomModel) classroomCacheHydrationNotifierCallback;

  HomeLessonShimHydrationBridge({
    required this.getClassroomLessons,
    required this.getClassroomTasks,
    required this.getClassroomResources,
    required this.getLesson,
    required this.classroomCacheHydrationNotifierCallback,
  });

  Future<List<LessonModel>> getClassroomLessonsForShim(
      DocumentReference<Object?> classroomRef, String subjectId) {
    return getClassroomLessons(classroomRef, subjectId);
  }

  Future<List<TaskModel>> getClassroomTasksForShim(
      DocumentReference<Object?> classroomRef, String subjectId) {
    return getClassroomTasks(classroomRef, subjectId);
  }

  Future<List<ResourceModel>> getClassroomResourcesForShim(
      DocumentReference<Object?> classroomRef, String subjectId) {
    return getClassroomResources(classroomRef, subjectId);
  }

  Future<LessonModel> getLessonForShim(LessonIndexModel lessonIndex) {
    return getLesson(lessonIndex);
  }
}
