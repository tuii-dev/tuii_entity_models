import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/auth/data/models/tutor_availability_time_segment_model.dart';

class TutorDayAvailabilityModel extends Equatable {
  final int index;
  final String label;
  final List<TutorAvailabilityTimeSegmentModel> timeSegments;

  const TutorDayAvailabilityModel({
    required this.index,
    required this.label,
    required this.timeSegments,
  }) : super();

  TutorDayAvailabilityModel copyWith({
    int? index,
    String? label,
    List<TutorAvailabilityTimeSegmentModel>? timeSegments,
  }) {
    return TutorDayAvailabilityModel(
      index: index ?? this.index,
      label: label ?? this.label,
      timeSegments: timeSegments ?? this.timeSegments,
    );
  }

  @override
  List<Object> get props => [index, label, timeSegments];

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'label': label,
      'timeSegments': timeSegments.map((x) => x.toMap()).toList(),
    };
  }

  factory TutorDayAvailabilityModel.fromMap(Map<String, dynamic> map) {
    return TutorDayAvailabilityModel(
      index: map['index']?.toInt() ?? 0,
      label: map['label'] ?? '',
      timeSegments: List<TutorAvailabilityTimeSegmentModel>.from(
          map['timeSegments']
              ?.map((x) => TutorAvailabilityTimeSegmentModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TutorDayAvailabilityModel.fromJson(String source) =>
      TutorDayAvailabilityModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'TutorDayAvailabilityModel(index: $index, label: $label, timeSegments: $timeSegments)';
}
