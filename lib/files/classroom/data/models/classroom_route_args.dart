import 'package:equatable/equatable.dart';
import 'package:tuiientitymodels/files/classroom/data/models/classroom_model.dart';
import 'package:tuiientitymodels/files/classroom/data/models/subject_model.dart';

class ClassroomRouteArgs extends Equatable {
  final ClassroomModel classroom;
  final SubjectModel subject;

  const ClassroomRouteArgs({
    required this.classroom,
    required this.subject,
  });

  @override
  List<Object> get props => [classroom, subject];

  ClassroomRouteArgs copyWith({
    ClassroomModel? classroom,
    SubjectModel? subject,
  }) {
    return ClassroomRouteArgs(
      classroom: classroom ?? this.classroom,
      subject: subject ?? this.subject,
    );
  }
}
