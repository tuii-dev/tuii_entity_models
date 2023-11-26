import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/auth/data/models/tutor_unavailability_segment_model.dart';

class TutorUnavailabilityModel extends Equatable {
  final List<TutorUnavailabilitySegmentModel> unavailabilitySegments;

  const TutorUnavailabilityModel({
    required this.unavailabilitySegments,
  });

  @override
  List<Object> get props => [unavailabilitySegments];

  TutorUnavailabilityModel copyWith({
    List<TutorUnavailabilitySegmentModel>? unavailabilitySegments,
  }) {
    return TutorUnavailabilityModel(
      unavailabilitySegments:
          unavailabilitySegments ?? this.unavailabilitySegments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'unavailabilitySegments':
          unavailabilitySegments.map((x) => x.toMap()).toList(),
    };
  }

  factory TutorUnavailabilityModel.fromMap(Map<String, dynamic> map) {
    return TutorUnavailabilityModel(
      unavailabilitySegments: List<TutorUnavailabilitySegmentModel>.from(
          map['unavailabilitySegments']
              ?.map((x) => TutorUnavailabilitySegmentModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TutorUnavailabilityModel.fromJson(String source) =>
      TutorUnavailabilityModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'TutorUnavailabilityModel(unavailabilitySegments: $unavailabilitySegments)';
}
