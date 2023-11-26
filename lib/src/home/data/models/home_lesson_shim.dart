import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/auth/data/models/user_model.dart';
import 'package:tuii_entity_models/src/classroom/data/models/classroom_model.dart';
import 'package:tuii_entity_models/src/classroom/data/models/lesson_model.dart';
import 'package:tuii_entity_models/src/classroom/data/models/subject_model.dart';
import 'package:tuii_entity_models/src/home/data/models/home_lesson_shim_hydration_bridge.dart';

import 'package:tuiicore/core/common/tutor_lesson_index_model.dart';
import 'package:tuiicore/core/models/lesson_time_segment_configuration.dart';

class HomeLessonShim extends Equatable {
  final LessonIndexModel lessonIndex;
  final ClassroomModel classroom;
  final SubjectModel subject;
  final LessonModel lesson;
  final UserModel student;
  final UserModel tutor;
  final LessonTimeSegmentConfiguration sessionTimeSegment;

  // New Classroom Routing Stuff
  final bool isHydrated;

  // New System Refactor
  final HomeLessonShimHydrationBridge hydrationBridge;

  const HomeLessonShim({
    required this.lessonIndex,
    required this.classroom,
    required this.subject,
    required this.lesson,
    required this.student,
    required this.tutor,
    required this.sessionTimeSegment,
    required this.hydrationBridge,
    this.isHydrated = false,
  });

  @override
  List<Object?> get props {
    return [
      lessonIndex,
      classroom,
      subject,
      lesson,
      student,
      tutor,
      sessionTimeSegment,
      hydrationBridge,
      isHydrated,
    ];
  }

  HomeLessonShim copyWith({
    LessonIndexModel? lessonIndex,
    ClassroomModel? classroom,
    SubjectModel? subject,
    LessonModel? lesson,
    UserModel? student,
    UserModel? tutor,
    LessonTimeSegmentConfiguration? sessionTimeSegment,
    HomeLessonShimHydrationBridge? hydrationBridge,
    bool? isHydrated,
  }) {
    return HomeLessonShim(
      lessonIndex: lessonIndex ?? this.lessonIndex,
      classroom: classroom ?? this.classroom,
      subject: subject ?? this.subject,
      lesson: lesson ?? this.lesson,
      student: student ?? this.student,
      tutor: tutor ?? this.tutor,
      sessionTimeSegment: sessionTimeSegment ?? this.sessionTimeSegment,
      hydrationBridge: hydrationBridge ?? this.hydrationBridge,
      isHydrated: isHydrated ?? this.isHydrated,
    );
  }

  Future<HomeLessonShim> hydrate() async {
    if (!isHydrated || true) {
      final subjectId = lessonIndex.subjectId!;
      List<LessonModel> lessons = await hydrationBridge
          .getClassroomLessonsForShim(lessonIndex.classroomRef!, subjectId);

      // lessons = lessons.map((l) {
      //   if (lessonIsExpired(l) && l.lessonCompleted != true) {
      //     return l.copyWith(lessonCompleted: true);

      //     //TODO: Add job
      //   } else {
      //     return l;
      //   }
      // }).toList();
      var tasks = await hydrationBridge.getClassroomTasksForShim(
          lessonIndex.classroomRef!, subjectId);
      var resources = await hydrationBridge.getClassroomResourcesForShim(
          lessonIndex.classroomRef!, subjectId);

      List<SubjectModel> subjects = List.from(classroom.subjects ?? []);
      int i = subjects.indexWhere((s) => s.subjectId == subjectId);
      final subject = subjects[i]
          .copyWith(lessons: lessons, tasks: tasks, resources: resources);
      subjects[i] = subject;

      i = lessons.indexWhere((l) => l.id == lessonIndex.lessonRef!.id);
      final lesson = lessons[i];

      final hydratedClassroom = classroom.copyWith(
          studentFirstName: student.firstName!,
          studentLastName: student.lastName!,
          studentEnrollmentStatus: student.enrollmentStatus,
          profileImageUrl: student.profileImageUrl,
          subjects: subjects,
          isHydrated: true);

      // if (tuiiClassroomCacheBloc != null) {
      //   tuiiClassroomCacheBloc!
      //       .add(UpdateCachedClassroomEvent(classroom: hydratedClassroom));
      // }
      hydrationBridge
          .classroomCacheHydrationNotifierCallback(hydratedClassroom);

      return copyWith(
        classroom: hydratedClassroom,
        subject: subject,
        lesson: lesson,
        isHydrated: true,
      );
    }
  }

  Future<HomeLessonShim> hydrateLesson() async {
    final lesson = await hydrationBridge.getLessonForShim(lessonIndex);
    return copyWith(lesson: lesson);
  }

  // Future<List<LessonModel>> _getClassroomLessonsForShim(
  //     String classroomId) async {
  //   final getClassroomLessons = sl<GetClassroomLessonsUseCase>();

  //   final lessonsEither = await getClassroomLessons(
  //       GetClassroomLessonsParams(classroomId: classroomId));
  //   return lessonsEither.fold((failure) async {
  //     throw failure;
  //   }, (lessons) async {
  //     return lessons;
  //   });
  // }

  // Future<List<TaskModel>> _getClassroomTasksForShim(
  //     DocumentReference classroomRef, String subjectId) async {
  //   final getLessonClassroomTasks = sl<GetLessonClassroomTasksUseCase>();

  //   final tasksEither = await getLessonClassroomTasks(
  //       GetLessonClassroomTasksParams(
  //           classroomRef: classroomRef, subjectId: subjectId));
  //   return tasksEither.fold((failure) async {
  //     throw failure;
  //   }, (tasks) async {
  //     return tasks;
  //   });
  // }

  // Future<List<ResourceModel>> _getClassroomResourcesForShim(
  //     DocumentReference classroomRef, String subjectId) async {
  //   final getLessonClassroomResources =
  //       sl<GetLessonClassroomResourcesUseCase>();

  //   final resourcesEither = await getLessonClassroomResources(
  //       GetLessonClassroomResourcesParams(
  //           classroomRef: classroomRef, subjectId: subjectId));
  //   return resourcesEither.fold((failure) async {
  //     throw failure;
  //   }, (resources) async {
  //     return resources;
  //   });
  // }
}
