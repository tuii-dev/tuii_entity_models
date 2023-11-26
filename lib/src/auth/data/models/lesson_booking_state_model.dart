import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:tuiicore/core/enums/lesson_delivery_type.dart';

class LessonBookingStateModel extends Equatable {
  final String? studentId;
  final String? subjectName;
  final int? lessonMins;
  final LessonDeliveryType? lessonDelivery;

  const LessonBookingStateModel({
    this.studentId,
    this.subjectName,
    this.lessonMins,
    this.lessonDelivery,
  });

  @override
  List<Object?> get props => [
        studentId,
        subjectName,
        lessonMins,
        lessonDelivery,
      ];

  LessonBookingStateModel copyWith({
    String? studentId,
    String? subjectName,
    int? lessonMins,
    LessonDeliveryType? lessonDelivery,
  }) {
    return LessonBookingStateModel(
      studentId: studentId ?? this.studentId,
      subjectName: subjectName ?? this.subjectName,
      lessonMins: lessonMins ?? this.lessonMins,
      lessonDelivery: lessonDelivery ?? this.lessonDelivery,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'subjectName': subjectName,
      'lessonMins': lessonMins,
      'lessonDelivery': lessonDelivery?.toMap(),
    };
  }

  factory LessonBookingStateModel.fromMap(Map<String, dynamic> map) {
    const staticType = LessonDeliveryType.unknown;

    return LessonBookingStateModel(
      studentId: map['studentId'],
      subjectName: map['subjectName'],
      lessonMins: map['lessonMins']?.toInt(),
      lessonDelivery: map['lessonDelivery'] != null
          ? staticType.fromMap(map['lessonDelivery'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonBookingStateModel.fromJson(String source) =>
      LessonBookingStateModel.fromMap(json.decode(source));
}
