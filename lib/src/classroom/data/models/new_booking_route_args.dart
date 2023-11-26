import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/auth/data/models/user_model.dart';
import 'package:tuii_entity_models/src/classroom/data/models/classroom_model.dart';
import 'package:tuii_entity_models/src/classroom/data/models/lesson_model.dart';
import 'package:tuii_entity_models/src/classroom/data/models/subject_model.dart';
import 'package:tuiicore/core/common/tutor_lesson_index_model.dart';
import 'package:tuiicore/core/enums/calendar_booking_mode_type.dart';
import 'package:tuiicore/core/enums/calendar_mode_type.dart';

import 'package:tuiicore/core/enums/lesson_delivery_type.dart';
import 'package:tuiicore/core/models/lesson_time_segment_configuration.dart';

class NewBookingRouteArgs extends Equatable {
  final String uuid;
  final CalendarModeType calendarMode;
  final CalendarBookingModeType calendarBookingMode;
  final ClassroomModel classroom;
  final SubjectModel subject;
  final LessonTimeSegmentConfiguration lessonTimeSegment;
  final LessonDeliveryType lessonDelivery;
  final double costOfLesson;
  final String stripePriceId;
  final LessonModel lesson;
  final LessonIndexModel lessonIndex;
  final UserModel student;
  final UserModel tutor;
  final bool globalLoad;
  final List<SubjectModel> globalLoadSubjects;

  const NewBookingRouteArgs({
    required this.uuid,
    required this.calendarMode,
    required this.calendarBookingMode,
    required this.classroom,
    required this.subject,
    required this.lessonTimeSegment,
    required this.lessonDelivery,
    required this.costOfLesson,
    required this.stripePriceId,
    required this.lesson,
    required this.lessonIndex,
    required this.student,
    required this.tutor,
    required this.globalLoad,
    required this.globalLoadSubjects,
  });

  @override
  List<Object> get props => [
        uuid,
        calendarMode,
        calendarBookingMode,
        classroom,
        subject,
        lessonTimeSegment,
        lessonDelivery,
        costOfLesson,
        stripePriceId,
        lesson,
        lessonIndex,
        student,
        tutor,
        globalLoad,
        globalLoadSubjects,
      ];

  NewBookingRouteArgs copyWith({
    String? uuid,
    CalendarModeType? calendarMode,
    CalendarBookingModeType? calendarBookingMode,
    ClassroomModel? classroom,
    SubjectModel? subject,
    LessonTimeSegmentConfiguration? lessonTimeSegment,
    LessonDeliveryType? lessonDelivery,
    double? costOfLesson,
    String? stripePriceId,
    LessonModel? lesson,
    LessonIndexModel? lessonIndex,
    UserModel? student,
    UserModel? tutor,
    bool? globalLoad,
    List<SubjectModel>? globalLoadSubjects,
  }) {
    return NewBookingRouteArgs(
      uuid: uuid ?? this.uuid,
      calendarMode: calendarMode ?? this.calendarMode,
      calendarBookingMode: calendarBookingMode ?? this.calendarBookingMode,
      classroom: classroom ?? this.classroom,
      subject: subject ?? this.subject,
      lessonTimeSegment: lessonTimeSegment ?? this.lessonTimeSegment,
      lessonDelivery: lessonDelivery ?? this.lessonDelivery,
      costOfLesson: costOfLesson ?? this.costOfLesson,
      stripePriceId: stripePriceId ?? this.stripePriceId,
      lesson: lesson ?? this.lesson,
      lessonIndex: lessonIndex ?? this.lessonIndex,
      student: student ?? this.student,
      tutor: tutor ?? this.tutor,
      globalLoad: globalLoad ?? this.globalLoad,
      globalLoadSubjects: globalLoadSubjects ?? this.globalLoadSubjects,
    );
  }
}
