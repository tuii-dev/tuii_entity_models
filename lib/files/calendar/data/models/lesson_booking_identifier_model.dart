import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuiientitymodels/files/calendar/data/models/lesson_booking_payout_model.dart';

class LessonBookingIdentifierModel extends Equatable {
  final String? id;
  final String? subjectName;
  final double? paidOutAmount;
  final String? studentCustodianId;
  final bool? studentHasCustodian;
  final String? studentId;
  final String? studentEmail;
  final String? studentName;
  final String? studentProfileImageUrl;
  final List<LessonBookingPayoutModel>? payoutLineItems;

  const LessonBookingIdentifierModel({
    this.id,
    this.subjectName,
    this.paidOutAmount,
    this.studentCustodianId,
    this.studentHasCustodian,
    this.studentId,
    this.studentEmail,
    this.studentName,
    this.studentProfileImageUrl,
    this.payoutLineItems,
  });

  LessonBookingIdentifierModel copyWith({
    String? id,
    String? subjectName,
    double? paidOutAmount,
    String? studentCustodianId,
    bool? studentHasCustodian,
    String? studentId,
    String? studentEmail,
    String? studentName,
    String? studentProfileImageUrl,
    List<LessonBookingPayoutModel>? payoutLineItems,
  }) {
    return LessonBookingIdentifierModel(
      id: id ?? this.id,
      subjectName: subjectName ?? this.subjectName,
      paidOutAmount: paidOutAmount ?? this.paidOutAmount,
      studentCustodianId: studentCustodianId ?? this.studentCustodianId,
      studentHasCustodian: studentHasCustodian ?? this.studentHasCustodian,
      studentId: studentId ?? this.studentId,
      studentEmail: studentEmail ?? this.studentEmail,
      studentName: studentName ?? this.studentName,
      studentProfileImageUrl:
          studentProfileImageUrl ?? this.studentProfileImageUrl,
      payoutLineItems: payoutLineItems ?? this.payoutLineItems,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subjectName': subjectName,
      'paidOutAmount': paidOutAmount,
      'studentCustodianId': studentCustodianId,
      'studentHasCustodian': studentHasCustodian,
      'studentId': studentId,
      'studentEmail': studentEmail,
      'studentName': studentName,
      'studentProfileImageUrl': studentProfileImageUrl,
      'payoutLineItems': payoutLineItems?.map((x) => x.toMap()).toList(),
    };
  }

  factory LessonBookingIdentifierModel.fromMap(Map<String, dynamic> map) {
    return LessonBookingIdentifierModel(
      id: map['id'],
      subjectName: map['subjectName'],
      paidOutAmount: map['paidOutAmount']?.toDouble(),
      studentCustodianId: map['studentCustodianId'],
      studentHasCustodian: map['studentHasCustodian'],
      studentId: map['studentId'],
      studentEmail: map['studentEmail'],
      studentName: map['studentName'],
      studentProfileImageUrl: map['studentProfileImageUrl'],
      payoutLineItems: map['payoutLineItems'] != null
          ? List<LessonBookingPayoutModel>.from(map['payoutLineItems']
              ?.map((x) => LessonBookingPayoutModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonBookingIdentifierModel.fromJson(String source) =>
      LessonBookingIdentifierModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LessonBookingIdentifierModel(id: $id, subjectName: $subjectName, paidOutAmount: $paidOutAmount, studentCustodianId: $studentCustodianId, studentHasCustodian: $studentHasCustodian, studentId: $studentId, studentEmail: $studentEmail, studentName: $studentName, studentProfileImageUrl: $studentProfileImageUrl, payoutLineItems: $payoutLineItems)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      subjectName,
      paidOutAmount,
      studentCustodianId,
      studentHasCustodian,
      studentId,
      studentEmail,
      studentName,
      studentProfileImageUrl,
      payoutLineItems,
    ];
  }
}
