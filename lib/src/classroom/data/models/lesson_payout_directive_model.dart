import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuiicore/core/enums/payout_type.dart';

class PayoutDirectiveModel extends Equatable {
  final String? id;
  final PayoutType? payoutType;
  final String? tutorId;
  final String? tutorEmail;
  final String? tutorFirstName;
  final String? tutorLastName;
  final String? stripeAccountId;
  final String? tutorCountryCode;
  final String? tutorCurrencyCode;
  final String? tutorCurrencySymbol;
  final String? classroomId;
  final String? subjectId;
  final String? lessonId;
  final String? lessonBookingId;
  final String? bookingId;
  final int? executionKey; // YYYYMMDD
  final int? maxAttempts;
  final int? numberOfAttempts;
  final List<String>? logs;
  final bool? processed;
  final bool? payoutOutFailed;

  const PayoutDirectiveModel({
    this.id,
    this.payoutType,
    this.tutorId,
    this.tutorEmail,
    this.tutorFirstName,
    this.tutorLastName,
    this.stripeAccountId,
    this.tutorCountryCode,
    this.tutorCurrencyCode,
    this.tutorCurrencySymbol,
    this.classroomId,
    this.subjectId,
    this.lessonId,
    this.lessonBookingId,
    this.bookingId,
    this.executionKey,
    this.maxAttempts,
    this.numberOfAttempts,
    this.logs,
    this.processed,
    this.payoutOutFailed,
  });

  PayoutDirectiveModel copyWith({
    String? id,
    PayoutType? payoutType,
    String? tutorId,
    String? tutorEmail,
    String? tutorFirstName,
    String? tutorLastName,
    String? stripeAccountId,
    String? tutorCountryCode,
    String? tutorCurrencyCode,
    String? tutorCurrencySymbol,
    String? classroomId,
    String? subjectId,
    String? lessonId,
    String? lessonBookingId,
    String? bookingId,
    int? executionKey,
    int? maxAttempts,
    int? numberOfAttempts,
    List<String>? logs,
    bool? processed,
    bool? payoutOutFailed,
  }) {
    return PayoutDirectiveModel(
      id: id ?? this.id,
      payoutType: payoutType ?? this.payoutType,
      tutorId: tutorId ?? this.tutorId,
      tutorEmail: tutorEmail ?? this.tutorEmail,
      tutorFirstName: tutorFirstName ?? this.tutorFirstName,
      tutorLastName: tutorLastName ?? this.tutorLastName,
      stripeAccountId: stripeAccountId ?? this.stripeAccountId,
      tutorCountryCode: tutorCountryCode ?? this.tutorCountryCode,
      tutorCurrencyCode: tutorCurrencyCode ?? this.tutorCurrencyCode,
      tutorCurrencySymbol: tutorCurrencySymbol ?? this.tutorCurrencySymbol,
      classroomId: classroomId ?? this.classroomId,
      subjectId: subjectId ?? this.subjectId,
      lessonId: lessonId ?? this.lessonId,
      lessonBookingId: lessonBookingId ?? this.lessonBookingId,
      bookingId: bookingId ?? this.bookingId,
      executionKey: executionKey ?? this.executionKey,
      maxAttempts: maxAttempts ?? this.maxAttempts,
      numberOfAttempts: numberOfAttempts ?? this.numberOfAttempts,
      logs: logs ?? this.logs,
      processed: processed ?? this.processed,
      payoutOutFailed: payoutOutFailed ?? this.payoutOutFailed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'payoutType': payoutType?.toMap(),
      'tutorId': tutorId,
      'tutorEmail': tutorEmail,
      'tutorFirstName': tutorFirstName,
      'tutorLastName': tutorLastName,
      'stripeAccountId': stripeAccountId,
      'tutorCountryCode': tutorCountryCode,
      'tutorCurrencyCode': tutorCurrencyCode,
      'tutorCurrencySymbol': tutorCurrencySymbol,
      'classroomId': classroomId,
      'subjectId': subjectId,
      'lessonId': lessonId,
      'lessonBookingId': lessonBookingId,
      'bookingId': bookingId,
      'executionKey': executionKey,
      'maxAttempts': maxAttempts,
      'numberOfAttempts': numberOfAttempts,
      'logs': logs,
      'processed': processed,
      'payoutOutFailed': payoutOutFailed,
    };
  }

  factory PayoutDirectiveModel.fromMap(Map<String, dynamic> map) {
    const staticType = PayoutType.unknown;
    return PayoutDirectiveModel(
      id: map['id'],
      payoutType: staticType.fromMap(map['payoutType']),
      tutorId: map['tutorId'],
      tutorEmail: map['tutorEmail'],
      tutorFirstName: map['tutorFirstName'],
      tutorLastName: map['tutorLastName'],
      stripeAccountId: map['stripeAccountId'],
      tutorCountryCode: map['tutorCountryCode'],
      tutorCurrencyCode: map['tutorCurrencyCode'],
      tutorCurrencySymbol: map['tutorCurrencySymbol'],
      classroomId: map['classroomId'],
      subjectId: map['subjectId'],
      lessonId: map['lessonId'],
      lessonBookingId: map['lessonBookingId'],
      bookingId: map['bookingId'],
      executionKey: map['executionKey']?.toInt(),
      maxAttempts: map['maxAttempts']?.toInt(),
      numberOfAttempts: map['numberOfAttempts']?.toInt(),
      logs: List<String>.from(map['logs']),
      processed: map['processed'] ?? false,
      payoutOutFailed: map['payoutOutFailed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory PayoutDirectiveModel.fromJson(String source) =>
      PayoutDirectiveModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LessonPayoutDirectiveModel(id: $id, classroomId: $classroomId, lessonId: $lessonId, executionKey: $executionKey, maxAttempts: $maxAttempts, logs: $logs)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      payoutType,
      tutorId,
      tutorEmail,
      tutorFirstName,
      tutorLastName,
      stripeAccountId,
      tutorCountryCode,
      tutorCurrencyCode,
      tutorCurrencySymbol,
      classroomId,
      subjectId,
      lessonId,
      lessonBookingId,
      bookingId,
      executionKey,
      maxAttempts,
      numberOfAttempts,
      logs,
      processed,
      payoutOutFailed,
    ];
  }
}
