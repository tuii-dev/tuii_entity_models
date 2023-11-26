import 'dart:convert';

import 'package:equatable/equatable.dart';

class TutorUnavailabilitySegmentModel extends Equatable {
  final String label;
  final DateTime fromDate;
  final DateTime toDate;

  const TutorUnavailabilitySegmentModel({
    required this.label,
    required this.fromDate,
    required this.toDate,
  });

  TutorUnavailabilitySegmentModel copyWith({
    String? label,
    DateTime? fromDate,
    DateTime? toDate,
  }) {
    return TutorUnavailabilitySegmentModel(
      label: label ?? this.label,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
    );
  }

  @override
  List<Object> get props => [label, fromDate, toDate];

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'fromDate': fromDate.toUtc().millisecondsSinceEpoch,
      'toDate': toDate.toUtc().millisecondsSinceEpoch,
    };
  }

  factory TutorUnavailabilitySegmentModel.fromMap(Map<String, dynamic> map) {
    return TutorUnavailabilitySegmentModel(
      label: map['label'] ?? '',
      fromDate: DateTime.fromMillisecondsSinceEpoch(map['fromDate']).toLocal(),
      toDate: DateTime.fromMillisecondsSinceEpoch(map['toDate']).toLocal(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TutorUnavailabilitySegmentModel.fromJson(String source) =>
      TutorUnavailabilitySegmentModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'TutorUnavailabilitySegmentModel(label: $label, fromDate: $fromDate, toDate: $toDate)';
}
