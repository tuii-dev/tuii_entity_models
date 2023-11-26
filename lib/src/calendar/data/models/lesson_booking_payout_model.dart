import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuiicore/core/enums/payout_type.dart';

class LessonBookingPayoutModel extends Equatable {
  final String? payoutId;
  final PayoutType?
      payoutType; // lesson or additionalCos or refundAdjustment or disputeAdjustment
  final DateTime? payoutDate;
  final String? entityTitle;
  final double? payoutTotalAmount;
  final double? payoutSubTotalAmount;
  final double? payoutTaxAmount;
  final double? platformFeesDeducted;
  final String? countryCode;
  final String? currencyCode;
  final String? currencySymbol;
  final String? lessonBookingId;
  final String? bookingId;
  final String? classroomId;
  final String? lessonId;
  final String? studentId;
  final String? studentCustodianId;
  final bool? studentHasCustodian;
  final String? studentEmail;
  final String? studentName;
  final String? studentProfileImageUrl;
  final String? batchManifestId;
  final String? batchKey;
  final Map<String, dynamic>? stripePayout;

  const LessonBookingPayoutModel({
    this.payoutId,
    this.payoutType,
    this.payoutDate,
    this.entityTitle,
    this.payoutTotalAmount,
    this.payoutSubTotalAmount,
    this.payoutTaxAmount,
    this.platformFeesDeducted,
    this.countryCode,
    this.currencyCode,
    this.currencySymbol,
    this.lessonBookingId,
    this.bookingId,
    this.classroomId,
    this.lessonId,
    this.studentId,
    this.studentCustodianId,
    this.studentHasCustodian,
    this.studentEmail,
    this.studentName,
    this.studentProfileImageUrl,
    this.batchManifestId,
    this.batchKey,
    this.stripePayout,
  });

  LessonBookingPayoutModel copyWith({
    String? payoutId,
    PayoutType? payoutType,
    DateTime? payoutDate,
    String? entityTitle,
    double? payoutTotalAmount,
    double? payoutSubTotalAmount,
    double? payoutTaxAmount,
    double? platformFeesDeducted,
    String? countryCode,
    String? currencyCode,
    String? currencySymbol,
    String? lessonBookingId,
    String? bookingId,
    String? classroomId,
    String? lessonId,
    String? studentId,
    String? studentCustodianId,
    bool? studentHasCustodian,
    String? studentEmail,
    String? studentName,
    String? studentProfileImageUrl,
    String? batchManifestId,
    String? batchKey,
    Map<String, dynamic>? stripePayout,
  }) {
    return LessonBookingPayoutModel(
      payoutId: payoutId ?? this.payoutId,
      payoutType: payoutType ?? this.payoutType,
      payoutDate: payoutDate ?? this.payoutDate,
      entityTitle: entityTitle ?? this.entityTitle,
      payoutTotalAmount: payoutTotalAmount ?? this.payoutTotalAmount,
      payoutSubTotalAmount: payoutSubTotalAmount ?? this.payoutSubTotalAmount,
      payoutTaxAmount: payoutTaxAmount ?? this.payoutTaxAmount,
      platformFeesDeducted: platformFeesDeducted ?? this.platformFeesDeducted,
      countryCode: countryCode ?? this.countryCode,
      currencyCode: currencyCode ?? this.currencyCode,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      lessonBookingId: lessonBookingId ?? this.lessonBookingId,
      bookingId: bookingId ?? this.bookingId,
      classroomId: classroomId ?? this.classroomId,
      lessonId: lessonId ?? this.lessonId,
      studentId: studentId ?? this.studentId,
      studentCustodianId: studentCustodianId ?? this.studentCustodianId,
      studentHasCustodian: studentHasCustodian ?? this.studentHasCustodian,
      studentEmail: studentEmail ?? this.studentEmail,
      studentName: studentName ?? this.studentName,
      studentProfileImageUrl:
          studentProfileImageUrl ?? this.studentProfileImageUrl,
      batchManifestId: batchManifestId ?? this.batchManifestId,
      batchKey: batchKey ?? this.batchKey,
      stripePayout: stripePayout ?? this.stripePayout,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'payoutId': payoutId,
      'payoutType': payoutType?.toMap(),
      'payoutDate': payoutDate?.millisecondsSinceEpoch,
      'entityTitle': entityTitle,
      'payoutTotalAmount': payoutTotalAmount,
      'payoutSubTotalAmount': payoutSubTotalAmount,
      'payoutTaxAmount': payoutTaxAmount,
      'platformFeesDeducted': platformFeesDeducted,
      'countryCode': countryCode,
      'currencyCode': currencyCode,
      'currencySymbol': currencySymbol,
      'lessonBookingId': lessonBookingId,
      'bookingId': bookingId,
      'classroomId': classroomId,
      'lessonId': lessonId,
      'studentId': studentId,
      'studentCustodianId': studentCustodianId,
      'studentHasCustodian': studentHasCustodian,
      'studentEmail': studentEmail,
      'studentName': studentName,
      'studentProfileImageUrl': studentProfileImageUrl,
      'batchManifestId': batchManifestId,
      'batchKey': batchKey,
      'stripePayout': stripePayout,
    };
  }

  factory LessonBookingPayoutModel.fromMap(Map<String, dynamic> map) {
    return LessonBookingPayoutModel(
      payoutId: map['payoutId'],
      payoutType: PayoutType.unknown.fromMap(map['payoutType']),
      payoutDate: map['payoutDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['payoutDate'])
          : null,
      entityTitle: map['entityTitle'],
      payoutTotalAmount: map['payoutTotalAmount']?.toDouble(),
      payoutSubTotalAmount: map['payoutSubTotalAmount']?.toDouble(),
      payoutTaxAmount: map['payoutTaxAmount']?.toDouble(),
      platformFeesDeducted: map['platformFeesDeducted']?.toDouble(),
      countryCode: map['countryCode'],
      currencyCode: map['currencyCode'],
      currencySymbol: map['currencySymbol'],
      lessonBookingId: map['lessonBookingId'],
      bookingId: map['bookingId'],
      classroomId: map['classroomId'],
      lessonId: map['lessonId'],
      studentId: map['studentId'],
      studentCustodianId: map['studentCustodianId'],
      studentHasCustodian: map['studentHasCustodian'],
      studentEmail: map['studentEmail'],
      studentName: map['studentName'],
      studentProfileImageUrl: map['studentProfileImageUrl'],
      batchManifestId: map['batchManifestId'],
      batchKey: map['batchKey'],
      stripePayout: map['stripePayout'] != null
          ? Map<String, dynamic>.from(map['stripePayout'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonBookingPayoutModel.fromJson(String source) =>
      LessonBookingPayoutModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LessonBookingPayoutModel(payoutId: $payoutId, payoutType: $payoutType, payoutDate: $payoutDate, entityTitle: $entityTitle, payoutTotalAmount: $payoutTotalAmount, payoutSubTotalAmount: $payoutSubTotalAmount, payoutTaxAmount: $payoutTaxAmount, platformFeesDeducted: $platformFeesDeducted, countryCode: $countryCode, currencyCode: $currencyCode, currencySymbol: $currencySymbol, lessonBookingId: $lessonBookingId, bookingId: $bookingId, classroomId: $classroomId, lessonId: $lessonId, studentId: $studentId, studentCustodianId: $studentCustodianId, studentHasCustodian: $studentHasCustodian, studentEmail: $studentEmail, studentName: $studentName, studentProfileImageUrl: $studentProfileImageUrl, batchManifestId: $batchManifestId, stripePayout: $stripePayout)';
  }

  @override
  List<Object?> get props {
    return [
      payoutId,
      payoutType,
      payoutDate,
      entityTitle,
      payoutTotalAmount,
      payoutSubTotalAmount,
      payoutTaxAmount,
      platformFeesDeducted,
      countryCode,
      currencyCode,
      currencySymbol,
      lessonBookingId,
      bookingId,
      classroomId,
      lessonId,
      studentId,
      studentCustodianId,
      studentHasCustodian,
      studentEmail,
      studentName,
      studentProfileImageUrl,
      batchManifestId,
      stripePayout,
    ];
  }
}
