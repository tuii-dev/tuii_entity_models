import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TutorAvailabilityTimeSegmentModel extends Equatable {
  final TimeOfDay fromTime;
  final TimeOfDay toTime;

  const TutorAvailabilityTimeSegmentModel({
    required this.fromTime,
    required this.toTime,
  }) : super();

  static TimeOfDay timeOfDayFromString(String val) {
    List<String> parts = val.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  static String timeOfDayToString(TimeOfDay val) {
    String _addLeadingZeroIfNeeded(int value) {
      if (value < 10) {
        return '0$value';
      }
      return value.toString();
    }

    final String hourLabel = _addLeadingZeroIfNeeded(val.hour);
    final String minuteLabel = _addLeadingZeroIfNeeded(val.minute);

    return '$hourLabel:$minuteLabel';
  }

  TutorAvailabilityTimeSegmentModel copyWith({
    TimeOfDay? fromTime,
    TimeOfDay? toTime,
  }) {
    return TutorAvailabilityTimeSegmentModel(
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
    );
  }

  @override
  List<Object> get props => [fromTime, toTime];

  Map<String, dynamic> toMap() {
    return {
      'fromTime': TutorAvailabilityTimeSegmentModel.timeOfDayToString(fromTime),
      'toTime': TutorAvailabilityTimeSegmentModel.timeOfDayToString(toTime),
    };
  }

  factory TutorAvailabilityTimeSegmentModel.fromMap(Map<String, dynamic> map) {
    return TutorAvailabilityTimeSegmentModel(
      fromTime: TutorAvailabilityTimeSegmentModel.timeOfDayFromString(
          map['fromTime']),
      toTime:
          TutorAvailabilityTimeSegmentModel.timeOfDayFromString(map['toTime']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TutorAvailabilityTimeSegmentModel.fromJson(String source) =>
      TutorAvailabilityTimeSegmentModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'TutorAvailabilityTimeSegmentModel(fromTime: $fromTime, toTime: $toTime)';
}
