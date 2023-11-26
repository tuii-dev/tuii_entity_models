import 'dart:convert';

import 'package:equatable/equatable.dart';

class SubjectDeliveryModeModel extends Equatable {
  final String subject;
  final bool homeVisit;
  final bool studio;
  final bool virtual;

  const SubjectDeliveryModeModel({
    required this.subject,
    required this.homeVisit,
    required this.studio,
    required this.virtual,
  });

  @override
  List<Object> get props => [subject, homeVisit, studio, virtual];

  SubjectDeliveryModeModel copyWith({
    String? subject,
    bool? homeVisit,
    bool? studio,
    bool? virtual,
  }) {
    return SubjectDeliveryModeModel(
      subject: subject ?? this.subject,
      homeVisit: homeVisit ?? this.homeVisit,
      studio: studio ?? this.studio,
      virtual: virtual ?? this.virtual,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'homeVisit': homeVisit,
      'studio': studio,
      'virtual': virtual,
    };
  }

  factory SubjectDeliveryModeModel.fromMap(Map<String, dynamic> map) {
    return SubjectDeliveryModeModel(
      subject: map['subject'] ?? '',
      homeVisit: map['homeVisit'] ?? false,
      studio: map['studio'] ?? false,
      virtual: map['virtual'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectDeliveryModeModel.fromJson(String source) =>
      SubjectDeliveryModeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubjectDeliveryModeModel(subject: $subject, homeVisit: $homeVisit, studio: $studio, virtual: $virtual)';
  }
}
