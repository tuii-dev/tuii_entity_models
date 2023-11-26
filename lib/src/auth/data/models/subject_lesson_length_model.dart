import 'dart:convert';

import 'package:equatable/equatable.dart';

class SubjectLessonLengthModel extends Equatable {
  final String subject;
  final List<int> lengthsInMins;
  final bool? isNew;

  const SubjectLessonLengthModel({
    required this.subject,
    required this.lengthsInMins,
    this.isNew = false,
  });

  @override
  List<Object?> get props => [subject, lengthsInMins, isNew];

  SubjectLessonLengthModel copyWith({
    String? subject,
    List<int>? lengthsInMins,
    bool? isNew,
  }) {
    return SubjectLessonLengthModel(
      subject: subject ?? this.subject,
      lengthsInMins: lengthsInMins ?? this.lengthsInMins,
      isNew: isNew ?? this.isNew,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'lengthsInMins': lengthsInMins,
    };
  }

  factory SubjectLessonLengthModel.fromMap(Map<String, dynamic> map) {
    return SubjectLessonLengthModel(
      subject: map['subject'] ?? '',
      lengthsInMins: List<int>.from(map['lengthsInMins'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectLessonLengthModel.fromJson(String source) =>
      SubjectLessonLengthModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'SubjectLessonLengthModel(subject: $subject, lengthsInMins: $lengthsInMins)';
}
