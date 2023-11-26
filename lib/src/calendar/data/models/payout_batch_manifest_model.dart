import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/calendar/data/models/lesson_booking_identifier_model.dart';
import 'package:tuiicore/core/common/common.dart';
import 'package:tuiicore/core/enums/payout_status_type.dart';

class PayoutBatchManifestModel extends Equatable {
  final String? id;
  final String? batchKey;
  final String? batchDayIdentifier;
  final String? executionKey;
  final DateTime? batchRunDate;
  final String? tutorId;
  final String? stripeAccountId;
  final List<LessonBookingIdentifierModel>? lessonBookingIdentifiers;
  final String? currencyCode;
  final String? failureCode;
  final String? failureMessage;
  final Map<String, dynamic>? stripePayout;
  final double? totalAmount;
  final DateTime? scheduledDate;
  final DateTime? arrivaldDate;
  final String? currencySymbol;
  final PayoutStatusType? status;

  const PayoutBatchManifestModel({
    this.id,
    this.batchKey,
    this.batchDayIdentifier,
    this.executionKey,
    this.batchRunDate,
    this.tutorId,
    this.stripeAccountId,
    this.lessonBookingIdentifiers,
    this.currencyCode,
    this.failureCode,
    this.failureMessage,
    this.stripePayout,
    this.totalAmount,
    this.scheduledDate,
    this.arrivaldDate,
    this.currencySymbol,
    this.status,
  });

  PayoutBatchManifestModel copyWith({
    String? id,
    String? batchKey,
    String? batchDayIdentifier,
    String? executionKey,
    DateTime? batchRunDate,
    String? tutorId,
    String? stripeAccountId,
    List<LessonBookingIdentifierModel>? lessonBookingIdentifiers,
    String? currencyCode,
    String? failureCode,
    String? failureMessage,
    Map<String, dynamic>? stripePayout,
    double? totalAmount,
    DateTime? scheduledDate,
    DateTime? arrivaldDate,
    String? currencySymbol,
    PayoutStatusType? status,
  }) {
    return PayoutBatchManifestModel(
      id: id ?? this.id,
      batchKey: batchKey ?? this.batchKey,
      batchDayIdentifier: batchDayIdentifier ?? this.batchDayIdentifier,
      executionKey: executionKey ?? this.executionKey,
      batchRunDate: batchRunDate ?? this.batchRunDate,
      tutorId: tutorId ?? this.tutorId,
      stripeAccountId: stripeAccountId ?? this.stripeAccountId,
      lessonBookingIdentifiers:
          lessonBookingIdentifiers ?? this.lessonBookingIdentifiers,
      currencyCode: currencyCode ?? this.currencyCode,
      failureCode: failureCode ?? this.failureCode,
      failureMessage: failureMessage ?? this.failureMessage,
      stripePayout: stripePayout ?? this.stripePayout,
      totalAmount: totalAmount ?? this.totalAmount,
      scheduledDate: scheduledDate ?? this.scheduledDate,
      arrivaldDate: arrivaldDate ?? this.arrivaldDate,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'batchKey': batchKey,
      'batchDayIdentifier': batchDayIdentifier,
      'executionKey': executionKey,
      'batchRunDate': batchRunDate?.millisecondsSinceEpoch,
      'tutorId': tutorId,
      'stripeAccountId': stripeAccountId,
      'lessonBookingIdentifiers':
          lessonBookingIdentifiers?.map((x) => x.toMap()).toList(),
      'currencyCode': currencyCode,
      'failureCode': failureCode,
      'failureMessage': failureMessage,
      'stripePayout': stripePayout,
      'totalAmount': totalAmount,
      'scheduledDate': scheduledDate?.millisecondsSinceEpoch,
      'arrivaldDate': arrivaldDate?.millisecondsSinceEpoch,
      'currencySymbol': currencySymbol,
      'status': status?.toMap(),
    };
  }

  factory PayoutBatchManifestModel.fromMap(Map<String, dynamic> map) {
    return PayoutBatchManifestModel(
        id: map['id'],
        batchKey: map['batchKey'],
        batchDayIdentifier: map['batchDayIdentifier'],
        executionKey: map['executionKey'],
        batchRunDate: map['batchRunDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['batchRunDate'])
            : null,
        tutorId: map['tutorId'],
        stripeAccountId: map['stripeAccountId'],
        lessonBookingIdentifiers: map['lessonBookingIdentifiers'] != null
            ? List<LessonBookingIdentifierModel>.from(
                map['lessonBookingIdentifiers']
                    ?.map((x) => LessonBookingIdentifierModel.fromMap(x)))
            : null,
        currencyCode: map['currencyCode'],
        failureCode: map['failureCode'],
        failureMessage: map['failureMessage'],
        stripePayout: map['stripePayout'] != null
            ? Map<String, dynamic>.from(map['stripePayout'])
            : null,
        totalAmount: map['stripePayout'] != null
            ? (map['stripePayout']['amount']?.toDouble()) / 100
            : null,
        scheduledDate: map['stripePayout'] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                map['stripePayout']['created'] * 1000)
            : null,
        arrivaldDate: map['stripePayout'] != null
            ? DateTime.fromMillisecondsSinceEpoch(
                map['stripePayout']['arrival_date'] * 1000)
            : null,
        currencySymbol: map['currencyCode'] != null
            ? getCurrencySymbol(map['currencyCode'])
            : "\$",
        status: PayoutStatusType.unknown.fromMap(map['status']));
  }

  String toJson() => json.encode(toMap());

  factory PayoutBatchManifestModel.fromJson(String source) =>
      PayoutBatchManifestModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PayoutBatchManifestModel(id: $id, batchKey: $batchKey, batchDayIdentifier: $batchDayIdentifier, batchRunDate: $batchRunDate, tutorId: $tutorId, stripeAccountId: $stripeAccountId, lessonBookingIdentifiers: $lessonBookingIdentifiers, currencyCode: $currencyCode, failureCode: $failureCode, failureMessage: $failureMessage, stripePayout: $stripePayout, amount: $totalAmount, scheduledDate: $scheduledDate, arrivaldDate: $arrivaldDate, currencySymbol: $currencySymbol)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      batchKey,
      batchDayIdentifier,
      executionKey,
      batchRunDate,
      tutorId,
      stripeAccountId,
      lessonBookingIdentifiers,
      currencyCode,
      failureCode,
      failureMessage,
      stripePayout,
      totalAmount,
      scheduledDate,
      arrivaldDate,
      currencySymbol,
      status,
    ];
  }
}
