import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuiicore/core/enums/tuii_role_type.dart';

class ExternalCommsConfigurationModel extends Equatable {
  final TutorExternalCommsConfigurationModel? tutorConfig;
  final LearnerExternalCommsConfigurationModel? learnerConfig;

  const ExternalCommsConfigurationModel({
    this.tutorConfig,
    this.learnerConfig,
  });

  factory ExternalCommsConfigurationModel.initial(TuiiRoleType roleType) {
    if (roleType == TuiiRoleType.tutor) {
      return ExternalCommsConfigurationModel(
          tutorConfig: TutorExternalCommsConfigurationModel.initial());
    } else {
      return ExternalCommsConfigurationModel(
          learnerConfig: LearnerExternalCommsConfigurationModel.initial());
    }
  }

  ExternalCommsConfigurationModel copyWith({
    TutorExternalCommsConfigurationModel? tutorConfig,
    LearnerExternalCommsConfigurationModel? learnerConfig,
  }) {
    return ExternalCommsConfigurationModel(
      tutorConfig: tutorConfig ?? this.tutorConfig,
      learnerConfig: learnerConfig ?? this.learnerConfig,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tutorConfig': tutorConfig?.toMap(),
      'learnerConfig': learnerConfig?.toMap(),
    };
  }

  factory ExternalCommsConfigurationModel.fromMap(Map<String, dynamic> map) {
    return ExternalCommsConfigurationModel(
      tutorConfig: map['tutorConfig'] != null
          ? TutorExternalCommsConfigurationModel.fromMap(map['tutorConfig'])
          : null,
      learnerConfig: map['learnerConfig'] != null
          ? LearnerExternalCommsConfigurationModel.fromMap(map['learnerConfig'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExternalCommsConfigurationModel.fromJson(String source) =>
      ExternalCommsConfigurationModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ExternalCommsConfigurationModel(tutorConfig: $tutorConfig, learnerConfig: $learnerConfig)';

  @override
  List<Object?> get props => [tutorConfig, learnerConfig];
}

class TutorExternalCommsConfigurationModel extends Equatable {
  final bool? receiveConnectionRequestReceivedEmail;
  final bool? receiveBookingAcceptedPaymentReceivedEmail;
  final bool? receiveBookingRejectedEmail;
  final bool? receiveRefundRequestedEmail;
  final bool? receiveRescheduleAcceptedEmail;
  final bool? receiveRescheduleRejectedEmail;

  const TutorExternalCommsConfigurationModel({
    this.receiveConnectionRequestReceivedEmail,
    this.receiveBookingAcceptedPaymentReceivedEmail,
    this.receiveBookingRejectedEmail,
    this.receiveRefundRequestedEmail,
    this.receiveRescheduleAcceptedEmail,
    this.receiveRescheduleRejectedEmail,
  });

  factory TutorExternalCommsConfigurationModel.initial() {
    return const TutorExternalCommsConfigurationModel(
      receiveConnectionRequestReceivedEmail: true,
      receiveBookingAcceptedPaymentReceivedEmail: true,
      receiveBookingRejectedEmail: true,
      receiveRefundRequestedEmail: true,
      receiveRescheduleAcceptedEmail: true,
      receiveRescheduleRejectedEmail: true,
    );
  }

  TutorExternalCommsConfigurationModel copyWith({
    bool? receiveConnectionRequestReceivedEmail,
    bool? receiveBookingAcceptedPaymentReceivedEmail,
    bool? receiveBookingRejectedEmail,
    bool? receiveRefundRequestedEmail,
    bool? receiveRescheduleAcceptedEmail,
    bool? receiveRescheduleRejectedEmail,
  }) {
    return TutorExternalCommsConfigurationModel(
      receiveConnectionRequestReceivedEmail:
          receiveConnectionRequestReceivedEmail ??
              this.receiveConnectionRequestReceivedEmail,
      receiveBookingAcceptedPaymentReceivedEmail:
          receiveBookingAcceptedPaymentReceivedEmail ??
              this.receiveBookingAcceptedPaymentReceivedEmail,
      receiveBookingRejectedEmail:
          receiveBookingRejectedEmail ?? this.receiveBookingRejectedEmail,
      receiveRefundRequestedEmail:
          receiveRefundRequestedEmail ?? this.receiveRefundRequestedEmail,
      receiveRescheduleAcceptedEmail:
          receiveRescheduleAcceptedEmail ?? this.receiveRescheduleAcceptedEmail,
      receiveRescheduleRejectedEmail:
          receiveRescheduleRejectedEmail ?? this.receiveRescheduleRejectedEmail,
    );
  }

  TutorExternalCommsConfigurationModel clone() {
    return TutorExternalCommsConfigurationModel(
      receiveConnectionRequestReceivedEmail:
          receiveConnectionRequestReceivedEmail,
      receiveBookingAcceptedPaymentReceivedEmail:
          receiveBookingAcceptedPaymentReceivedEmail,
      receiveBookingRejectedEmail: receiveBookingRejectedEmail,
      receiveRefundRequestedEmail: receiveRefundRequestedEmail,
      receiveRescheduleAcceptedEmail: receiveRescheduleAcceptedEmail,
      receiveRescheduleRejectedEmail: receiveRescheduleRejectedEmail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'receiveConnectionRequestReceivedEmail':
          receiveConnectionRequestReceivedEmail,
      'receiveBookingAcceptedPaymentReceivedEmail':
          receiveBookingAcceptedPaymentReceivedEmail,
      'receiveBookingRejectedEmail': receiveBookingRejectedEmail,
      'receiveRefundRequestedEmail': receiveRefundRequestedEmail,
      'receiveRescheduleAcceptedEmail': receiveRescheduleAcceptedEmail,
      'receiveRescheduleRejectedEmail': receiveRescheduleRejectedEmail,
    };
  }

  factory TutorExternalCommsConfigurationModel.fromMap(
      Map<String, dynamic> map) {
    return TutorExternalCommsConfigurationModel(
      receiveConnectionRequestReceivedEmail:
          map['receiveConnectionRequestReceivedEmail'] ?? true,
      receiveBookingAcceptedPaymentReceivedEmail:
          map['receiveBookingAcceptedPaymentReceivedEmail'] ?? true,
      receiveBookingRejectedEmail: map['receiveBookingRejectedEmail'] ?? true,
      receiveRefundRequestedEmail: map['receiveRefundRequestedEmail'] ?? true,
      receiveRescheduleAcceptedEmail:
          map['receiveRescheduleAcceptedEmail'] ?? true,
      receiveRescheduleRejectedEmail:
          map['receiveRescheduleRejectedEmail'] ?? true,
    );
  }

  String toJson() => json.encode(toMap());

  factory TutorExternalCommsConfigurationModel.fromJson(String source) =>
      TutorExternalCommsConfigurationModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'TutorExternalCommsConfigurationModel(receiveBookingAcceptedPaymentReceivedEmail: $receiveBookingAcceptedPaymentReceivedEmail, receiveBookingRejectedEmail: $receiveBookingRejectedEmail)';

  @override
  List<Object?> get props => [
        receiveConnectionRequestReceivedEmail,
        receiveBookingAcceptedPaymentReceivedEmail,
        receiveBookingRejectedEmail,
        receiveRefundRequestedEmail,
        receiveRescheduleAcceptedEmail,
        receiveRescheduleRejectedEmail
      ];
}

class LearnerExternalCommsConfigurationModel extends Equatable {
  final bool? receiveConnectionRequestAcceptedEmail;
  final bool? receiveConnectionRequestRejectedEmail;
  final bool? receiveBookingRequestEmail;
  final bool? receivePaymentSuccessfulEmail;
  final bool? receiveRefundAcceptedEmail;
  final bool? receiveRefundRejectedEmail;
  final bool? receiveLessonRescheduledEmail;
  final bool? receiveRefundReceivedEmail;

  const LearnerExternalCommsConfigurationModel({
    this.receiveConnectionRequestAcceptedEmail,
    this.receiveConnectionRequestRejectedEmail,
    this.receiveBookingRequestEmail,
    this.receivePaymentSuccessfulEmail,
    this.receiveRefundAcceptedEmail,
    this.receiveRefundRejectedEmail,
    this.receiveLessonRescheduledEmail,
    this.receiveRefundReceivedEmail,
  });

  factory LearnerExternalCommsConfigurationModel.initial() {
    return const LearnerExternalCommsConfigurationModel(
      receiveConnectionRequestAcceptedEmail: true,
      receiveConnectionRequestRejectedEmail: true,
      receiveBookingRequestEmail: true,
      receivePaymentSuccessfulEmail: true,
      receiveRefundAcceptedEmail: true,
      receiveRefundRejectedEmail: true,
      receiveLessonRescheduledEmail: true,
      receiveRefundReceivedEmail: true,
    );
  }

  LearnerExternalCommsConfigurationModel copyWith({
    bool? receiveConnectionRequestAcceptedEmail,
    bool? receiveConnectionRequestRejectedEmail,
    bool? receiveBookingRequestEmail,
    bool? receivePaymentSuccessfulEmail,
    bool? receiveRefundAcceptedEmail,
    bool? receiveRefundRejectedEmail,
    bool? receiveLessonRescheduledEmail,
    bool? receiveRefundReceivedEmail,
  }) {
    return LearnerExternalCommsConfigurationModel(
      receiveConnectionRequestAcceptedEmail:
          receiveConnectionRequestAcceptedEmail ??
              this.receiveConnectionRequestAcceptedEmail,
      receiveConnectionRequestRejectedEmail:
          receiveConnectionRequestRejectedEmail ??
              this.receiveConnectionRequestRejectedEmail,
      receiveBookingRequestEmail:
          receiveBookingRequestEmail ?? this.receiveBookingRequestEmail,
      receivePaymentSuccessfulEmail:
          receivePaymentSuccessfulEmail ?? this.receivePaymentSuccessfulEmail,
      receiveRefundAcceptedEmail:
          receiveRefundAcceptedEmail ?? this.receiveRefundAcceptedEmail,
      receiveRefundRejectedEmail:
          receiveRefundRejectedEmail ?? this.receiveRefundRejectedEmail,
      receiveLessonRescheduledEmail:
          receiveLessonRescheduledEmail ?? this.receiveLessonRescheduledEmail,
      receiveRefundReceivedEmail:
          receiveRefundReceivedEmail ?? this.receiveRefundReceivedEmail,
    );
  }

  LearnerExternalCommsConfigurationModel clone() {
    return LearnerExternalCommsConfigurationModel(
      receiveConnectionRequestAcceptedEmail:
          receiveConnectionRequestAcceptedEmail,
      receiveConnectionRequestRejectedEmail:
          receiveConnectionRequestRejectedEmail,
      receiveBookingRequestEmail: receiveBookingRequestEmail,
      receivePaymentSuccessfulEmail: receivePaymentSuccessfulEmail,
      receiveRefundAcceptedEmail: receiveRefundAcceptedEmail,
      receiveRefundRejectedEmail: receiveRefundRejectedEmail,
      receiveLessonRescheduledEmail: receiveLessonRescheduledEmail,
      receiveRefundReceivedEmail: receiveRefundReceivedEmail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'receiveConnectionRequestAcceptedEmail':
          receiveConnectionRequestAcceptedEmail,
      'receiveConnectionRequestRejectedEmail':
          receiveConnectionRequestRejectedEmail,
      'receiveBookingRequestEmail': receiveBookingRequestEmail,
      'receivePaymentSuccessfulEmail': receivePaymentSuccessfulEmail,
      'receiveRefundAcceptedEmail': receiveRefundAcceptedEmail,
      'receiveRefundRejectedEmail': receiveRefundRejectedEmail,
      'receiveLessonRescheduledEmail': receiveLessonRescheduledEmail,
      'receiveRefundReceivedEmail': receiveRefundReceivedEmail,
    };
  }

  factory LearnerExternalCommsConfigurationModel.fromMap(
      Map<String, dynamic> map) {
    return LearnerExternalCommsConfigurationModel(
      receiveConnectionRequestAcceptedEmail:
          map['receiveConnectionRequestAcceptedEmail'],
      receiveConnectionRequestRejectedEmail:
          map['receiveConnectionRequestRejectedEmail'],
      receiveBookingRequestEmail: map['receiveBookingRequestEmail'],
      receivePaymentSuccessfulEmail: map['receivePaymentSuccessfulEmail'],
      receiveRefundAcceptedEmail: map['receiveRefundAcceptedEmail'],
      receiveRefundRejectedEmail: map['receiveRefundRejectedEmail'],
      receiveLessonRescheduledEmail: map['receiveLessonRescheduledEmail'],
      receiveRefundReceivedEmail: map['receiveRefundReceivedEmail'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LearnerExternalCommsConfigurationModel.fromJson(String source) =>
      LearnerExternalCommsConfigurationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LearnerExternalCommsConfigurationModel(receiveBookingRequestEmail: $receiveBookingRequestEmail, receivePaymentSuccessfulEmail: $receivePaymentSuccessfulEmail, receiveRefundAcceptedEmail: $receiveRefundAcceptedEmail, receiveRefundRejectedEmail: $receiveRefundRejectedEmail)';
  }

  @override
  List<Object?> get props => [
        receiveConnectionRequestAcceptedEmail,
        receiveConnectionRequestRejectedEmail,
        receiveBookingRequestEmail,
        receivePaymentSuccessfulEmail,
        receiveRefundAcceptedEmail,
        receiveRefundRejectedEmail,
        receiveLessonRescheduledEmail,
        receiveRefundReceivedEmail,
      ];
}
