import 'package:equatable/equatable.dart';
import 'package:tuiientitymodels/files/classroom/data/models/classroom_model.dart';
import 'package:tuiientitymodels/files/classroom/data/models/lesson_model.dart';
import 'package:tuiientitymodels/files/classroom/data/models/subject_model.dart';

class ClassroomLessonRouteArgs extends Equatable {
  final ClassroomModel classroom;
  final SubjectModel subject;
  final LessonModel lesson;

  const ClassroomLessonRouteArgs({
    required this.classroom,
    required this.subject,
    required this.lesson,
  });

  @override
  List<Object> get props => [classroom, subject, lesson];

  ClassroomLessonRouteArgs copyWith({
    ClassroomModel? classroom,
    SubjectModel? subject,
    LessonModel? lesson,
  }) {
    return ClassroomLessonRouteArgs(
      classroom: classroom ?? this.classroom,
      subject: subject ?? this.subject,
      lesson: lesson ?? this.lesson,
    );
  }
}
