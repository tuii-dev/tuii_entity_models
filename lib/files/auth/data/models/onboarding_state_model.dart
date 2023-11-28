import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuiientitymodels/files/auth/data/models/child_registration_model.dart';
import 'package:tuiientitymodels/files/auth/data/models/external_comms_config_model.dart';
import 'package:tuiientitymodels/files/auth/data/models/profile_completion_model.dart';
import 'package:tuiientitymodels/files/auth/data/models/subject_delivery_mode_model.dart';
import 'package:tuiientitymodels/files/auth/data/models/subject_lesson_length_model.dart';
import 'package:tuiientitymodels/files/auth/data/models/subject_rate_model.dart';

class OnboardingStateModel extends Equatable {
  // State management for tutor
  final List<String>? subjectTags;
  final List<SubjectDeliveryModeModel>? subjectDeliveryModes;
  final List<SubjectLessonLengthModel>? subjectLessonLengths;
  final List<SubjectRateModel>? subjectRates;

  //State management for parent
  final List<ChildRegistrationModel>? children;

  // Profile completion tracking
  final ProfileCompletionModel? profileCompletion;

  // External Comms Config
  final ExternalCommsConfigurationModel? externalCommsConfig;

  const OnboardingStateModel({
    this.subjectTags,
    this.subjectDeliveryModes,
    this.subjectLessonLengths,
    this.subjectRates,
    this.children,
    this.profileCompletion,
    this.externalCommsConfig,
  });

  OnboardingStateModel copyWith({
    List<String>? subjectTags,
    List<SubjectDeliveryModeModel>? subjectDeliveryModes,
    List<SubjectLessonLengthModel>? subjectLessonLengths,
    List<SubjectRateModel>? subjectRates,
    List<ChildRegistrationModel>? children,
    ProfileCompletionModel? profileCompletion,
    ExternalCommsConfigurationModel? externalCommsConfig,
  }) {
    return OnboardingStateModel(
      subjectTags: subjectTags ?? this.subjectTags,
      subjectDeliveryModes: subjectDeliveryModes ?? this.subjectDeliveryModes,
      subjectLessonLengths: subjectLessonLengths ?? this.subjectLessonLengths,
      subjectRates: subjectRates ?? this.subjectRates,
      children: children ?? this.children,
      profileCompletion: profileCompletion ?? this.profileCompletion,
      externalCommsConfig: externalCommsConfig ?? this.externalCommsConfig,
    );
  }

  @override
  List<Object?> get props => [
        subjectTags,
        subjectDeliveryModes,
        subjectLessonLengths,
        subjectRates,
        children,
        profileCompletion,
        externalCommsConfig,
      ];

  Map<String, dynamic> toMap() {
    return {
      'subjectTags': subjectTags,
      'subjectDeliveryModes':
          subjectDeliveryModes?.map((x) => x.toMap()).toList(),
      'subjectLessonLengths':
          subjectLessonLengths?.map((x) => x.toMap()).toList(),
      'subjectRates': subjectRates?.map((x) => x.toMap()).toList(),
      'children': children?.map((x) => x.toMap()).toList(),
      'profileCompletion': profileCompletion?.toMap(),
      'externalCommsConfig': externalCommsConfig?.toMap(),
    };
  }

  factory OnboardingStateModel.fromMap(Map<String, dynamic> map) {
    return OnboardingStateModel(
      subjectTags: List<String>.from(map['subjectTags'] ?? []),
      subjectDeliveryModes: map['subjectDeliveryModes'] != null
          ? List<SubjectDeliveryModeModel>.from(map['subjectDeliveryModes']
              ?.map((x) => SubjectDeliveryModeModel.fromMap(x)))
          : null,
      subjectLessonLengths: map['subjectLessonLengths'] != null
          ? List<SubjectLessonLengthModel>.from(map['subjectLessonLengths']
              ?.map((x) => SubjectLessonLengthModel.fromMap(x)))
          : null,
      subjectRates: map['subjectRates'] != null
          ? List<SubjectRateModel>.from(
              map['subjectRates']?.map((x) => SubjectRateModel.fromMap(x)))
          : null,
      children: map['children'] != null
          ? List<ChildRegistrationModel>.from(
              map['children']?.map((x) => ChildRegistrationModel.fromMap(x)))
          : [],
      profileCompletion: map['profileCompletion'] != null
          ? ProfileCompletionModel.fromMap(map['profileCompletion'])
          : null,
      externalCommsConfig: map['externalCommsConfig'] != null
          ? ExternalCommsConfigurationModel.fromMap(map['externalCommsConfig'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingStateModel.fromJson(String source) =>
      OnboardingStateModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OnboardingStateModel(subjectTags: $subjectTags, subjectDeliveryModes: $subjectDeliveryModes, subjectLessonLengths: $subjectLessonLengths, subjectRates: $subjectRates)';
  }
}
