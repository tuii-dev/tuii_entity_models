import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/calendar/data/models/lesson_booking_cost_structure_model.dart';
import 'package:tuii_entity_models/src/calendar/data/models/lesson_booking_refund_state_model.dart';
import 'package:tuii_entity_models/src/calendar/data/models/lesson_booking_stripe_checkout_info_model.dart';
import 'package:tuii_entity_models/src/calendar/data/models/lesson_booking_stripe_payment_info_model.dart';
import 'package:tuii_entity_models/src/home/domain/entities/lesson_appointment.dart';

import 'package:tuiicore/core/enums/lesson_booking_refund_type.dart';
import 'package:tuiicore/core/enums/lesson_booking_status_type.dart';
import 'package:tuiicore/core/enums/tuii_role_type.dart';
import 'package:tuiicore/core/models/stripe_dynamic_line_item.dart';
import 'package:tuiicore/core/common/lesson_booking_audit_entry_model.dart';

class LessonBookingModel extends Equatable {
  final String? id;
  final DateTime creationDate;
  final DateTime lastUpdatedDate;
  final String tutorId;
  final String tutorEmail;
  final String tutorName;
  final String tutorProfileImageUrl;
  final String tutorAccountId;
  final bool tutorSendPaymentReceivedEmail;
  final String studentId;
  final String studentEmail;
  final String initiatorId;
  final String studentName;
  final String studentProfileImageUrl;
  final bool studentHasCustodian;

  final String subjectName;
  final double totalAmount;
  final LessonBookingStatusType status;
  final List<LessonAppointment> lessonBookings;
  final List<StripeDynamicLineItem> additionalCosts;
  final LessonBookingCostStructure costStructure;
  final bool? originalAcceptance;
  final DateTime? originalAcceptanceDate;
  final List<LessonBookingAuditEntryModel>? auditEntries;

  final LessonBookingStripeCheckoutInfoModel? stripeCheckoutInfo;
  final LessonBookingStripePaymentInfoModel? stripePaymentInfo;

  // Student Parent Stuff
  final String? studentCustodianId;

  // Refund Stuff

  // Parent Child Fields
  final bool? hasAssociatedRefundBooking;
  // Full Refund or Lesson Refund
  final LessonBookingRefundType? refundBookingType;
  final List<String>? refundBookingIds;
  final List<String>? refundLessonBookingIds;
  final List<String>? refundAdditionalCostIds;
  final LessonBookingStatusType? refundStatus;

  // Refund Child Fields
  final bool isRefundBooking;
  final TuiiRoleType refundInitiatorRoleType;
  final String? paidBookingId;
  final String? paidLessonBookingId;
  final String? paidAdditionalCostId;

  final String? disputeNumber;
  final bool? restrictDispute;

  // Refund adjustment state
  final LessonBookingRefundAdjustmentStateModel? refundAdjustmentState;

  const LessonBookingModel({
    this.id,
    required this.creationDate,
    required this.lastUpdatedDate,
    required this.tutorId,
    required this.tutorEmail,
    required this.tutorName,
    required this.tutorProfileImageUrl,
    required this.tutorAccountId,
    required this.tutorSendPaymentReceivedEmail,
    required this.studentId,
    required this.studentEmail,
    required this.initiatorId,
    required this.studentName,
    required this.studentProfileImageUrl,
    required this.studentHasCustodian,
    required this.subjectName,
    required this.totalAmount,
    required this.status,
    required this.lessonBookings,
    required this.additionalCosts,
    required this.costStructure,
    this.studentCustodianId,
    this.originalAcceptance,
    this.originalAcceptanceDate,
    this.auditEntries,
    this.stripeCheckoutInfo,
    this.stripePaymentInfo,
    this.hasAssociatedRefundBooking,
    this.refundBookingType,
    this.refundBookingIds,
    this.refundLessonBookingIds,
    this.refundAdditionalCostIds,
    this.refundStatus,
    this.isRefundBooking = false,
    this.refundInitiatorRoleType = TuiiRoleType.student,
    this.paidBookingId,
    this.paidLessonBookingId,
    this.paidAdditionalCostId,
    this.disputeNumber,
    this.restrictDispute,
    this.refundAdjustmentState,
  });

  LessonBookingModel copyWith({
    String? id,
    DateTime? creationDate,
    DateTime? lastUpdatedDate,
    String? tutorId,
    String? tutorEmail,
    String? tutorName,
    String? tutorProfileImageUrl,
    String? tutorAccountId,
    bool? tutorSendPaymentReceivedEmail,
    String? studentId,
    String? studentEmail,
    String? initiatorId,
    String? studentName,
    String? studentProfileImageUrl,
    bool? studentHasCustodian,
    String? studentCustodianId,
    String? subjectName,
    double? totalAmount,
    LessonBookingStatusType? status,
    List<LessonAppointment>? lessonBookings,
    List<StripeDynamicLineItem>? additionalCosts,
    LessonBookingCostStructure? costStructure,
    bool? originalAcceptance,
    DateTime? originalAcceptanceDate,
    List<LessonBookingAuditEntryModel>? auditEntries,
    LessonBookingStripeCheckoutInfoModel? stripeCheckoutInfo,
    LessonBookingStripePaymentInfoModel? stripePaymentInfo,
    bool? hasAssociatedRefundBooking,
    LessonBookingRefundType? refundBookingType,
    List<String>? refundBookingIds,
    List<String>? refundLessonBookingIds,
    List<String>? refundAdditionalCostIds,
    LessonBookingStatusType? refundStatus,
    bool? isRefundBooking,
    TuiiRoleType? refundInitiatorRoleType,
    String? paidBookingId,
    String? paidLessonBookingId,
    String? paidAdditionalCostId,
    String? disputeNumber,
    bool? restrictDispute,
    LessonBookingRefundAdjustmentStateModel? refundAdjustmentState,
  }) {
    return LessonBookingModel(
      id: id ?? this.id,
      creationDate: creationDate ?? this.creationDate,
      lastUpdatedDate: lastUpdatedDate ?? this.lastUpdatedDate,
      tutorId: tutorId ?? this.tutorId,
      tutorEmail: tutorEmail ?? this.tutorEmail,
      tutorName: tutorName ?? this.tutorName,
      tutorProfileImageUrl: tutorProfileImageUrl ?? this.tutorProfileImageUrl,
      tutorAccountId: tutorAccountId ?? this.tutorAccountId,
      tutorSendPaymentReceivedEmail:
          tutorSendPaymentReceivedEmail ?? this.tutorSendPaymentReceivedEmail,
      studentId: studentId ?? this.studentId,
      studentEmail: studentEmail ?? this.studentEmail,
      initiatorId: initiatorId ?? this.initiatorId,
      studentName: studentName ?? this.studentName,
      studentProfileImageUrl:
          studentProfileImageUrl ?? this.studentProfileImageUrl,
      studentHasCustodian: studentHasCustodian ?? this.studentHasCustodian,
      studentCustodianId: studentCustodianId ?? this.studentCustodianId,
      subjectName: subjectName ?? this.subjectName,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      lessonBookings: lessonBookings ?? this.lessonBookings,
      additionalCosts: additionalCosts ?? this.additionalCosts,
      costStructure: costStructure ?? this.costStructure,
      originalAcceptance: originalAcceptance ?? this.originalAcceptance,
      originalAcceptanceDate:
          originalAcceptanceDate ?? this.originalAcceptanceDate,
      auditEntries: auditEntries ?? this.auditEntries,
      stripeCheckoutInfo: stripeCheckoutInfo ?? this.stripeCheckoutInfo,
      stripePaymentInfo: stripePaymentInfo ?? this.stripePaymentInfo,
      hasAssociatedRefundBooking:
          hasAssociatedRefundBooking ?? this.hasAssociatedRefundBooking,
      refundBookingType: refundBookingType ?? this.refundBookingType,
      refundBookingIds: refundBookingIds ?? this.refundBookingIds,
      refundLessonBookingIds:
          refundLessonBookingIds ?? this.refundLessonBookingIds,
      refundAdditionalCostIds:
          refundAdditionalCostIds ?? this.refundAdditionalCostIds,
      refundStatus: refundStatus ?? this.refundStatus,
      isRefundBooking: isRefundBooking ?? this.isRefundBooking,
      refundInitiatorRoleType:
          refundInitiatorRoleType ?? this.refundInitiatorRoleType,
      paidBookingId: paidBookingId ?? this.paidBookingId,
      paidLessonBookingId: paidLessonBookingId ?? this.paidLessonBookingId,
      paidAdditionalCostId: paidAdditionalCostId ?? this.paidAdditionalCostId,
      disputeNumber: disputeNumber ?? this.disputeNumber,
      restrictDispute: restrictDispute ?? this.restrictDispute,
      refundAdjustmentState:
          refundAdjustmentState ?? this.refundAdjustmentState,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'creationDate': creationDate.toUtc().millisecondsSinceEpoch,
      'lastUpdatedDate': lastUpdatedDate.toUtc().millisecondsSinceEpoch,
      'tutorId': tutorId,
      'tutorEmail': tutorEmail,
      'tutorName': tutorName,
      'tutorProfileImageUrl': tutorProfileImageUrl,
      'tutorAccountId': tutorAccountId,
      'tutorSendPaymentReceivedEmail': tutorSendPaymentReceivedEmail,
      'studentId': studentId,
      'studentEmail': studentEmail,
      'initiatorId': initiatorId,
      'studentName': studentName,
      'studentProfileImageUrl': studentProfileImageUrl,
      'studentHasCustodian': studentHasCustodian,
      'studentCustodianId': studentCustodianId,
      'subjectName': subjectName,
      'totalAmount': totalAmount,
      'status': status.toMap(),
      'lessonBookings': lessonBookings.map((x) => x.toMap()).toList(),
      'additionalCosts': additionalCosts.map((x) => x.toMap()).toList(),
      'costStructure': costStructure.toMap(),
      'originalAcceptance': originalAcceptance,
      'originalAcceptanceDate':
          originalAcceptanceDate?.toUtc().millisecondsSinceEpoch,
      'auditEntries': auditEntries?.map((x) => x.toMap()).toList(),
      // 'stripeCheckoutInfo': stripeCheckoutInfo?.toMap(),
      // 'stripePaymentInfo': stripePaymentInfo?.toMap(),
      'hasAssociatedRefundBooking': hasAssociatedRefundBooking,
      'refundBookingType': refundBookingType?.toMap(),
      'refundBookingIds': refundBookingIds ?? [],
      'refundLessonBookingIds': refundLessonBookingIds ?? [],
      'refundAdditionalCostIds': refundAdditionalCostIds ?? [],
      'refundStatus': refundStatus?.toMap(),
      'isRefundBooking': isRefundBooking,
      'refundInitiatorRoleType': refundInitiatorRoleType.toMap(),
      'paidBookingId': paidBookingId,
      'paidLessonBookingId': paidLessonBookingId,
      'paidAdditionalCostId': paidAdditionalCostId,
      'disputeNumber': disputeNumber,
      'restrictDispute': restrictDispute ?? false,
      'refundAdjustmentState': refundAdjustmentState?.toMap(),
    };
  }

  Map<String, dynamic> toMapWithStripeInfo() {
    return {
      'id': id,
      'creationDate': creationDate.toUtc().millisecondsSinceEpoch,
      'lastUpdatedDate': lastUpdatedDate.toUtc().millisecondsSinceEpoch,
      'tutorId': tutorId,
      'tutorEmail': tutorEmail,
      'tutorName': tutorName,
      'tutorProfileImageUrl': tutorProfileImageUrl,
      'tutorAccountId': tutorAccountId,
      'tutorSendPaymentReceivedEmail': tutorSendPaymentReceivedEmail,
      'studentId': studentId,
      'studentEmail': studentEmail,
      'initiatorId': initiatorId,
      'studentName': studentName,
      'studentProfileImageUrl': studentProfileImageUrl,
      'studentHasCustodian': studentHasCustodian,
      'studentCustodianId': studentCustodianId,
      'subjectName': subjectName,
      'totalAmount': totalAmount,
      'status': status.toMap(),
      'lessonBookings': lessonBookings.map((x) => x.toMap()).toList(),
      'additionalCosts': additionalCosts.map((x) => x.toMap()).toList(),
      'costStructure': costStructure.toMap(),
      'originalAcceptance': originalAcceptance,
      'originalAcceptanceDate':
          originalAcceptanceDate?.toUtc().millisecondsSinceEpoch,
      'auditEntries': auditEntries?.map((x) => x.toMap()).toList(),
      'stripeCheckoutInfo': stripeCheckoutInfo?.toMap(),
      'stripePaymentInfo': stripePaymentInfo?.toMap(),
      'hasAssociatedRefundBooking': hasAssociatedRefundBooking,
      'refundBookingType': refundBookingType?.toMap(),
      'refundBookingIds': refundBookingIds ?? [],
      'refundLessonBookingIds': refundLessonBookingIds ?? [],
      'refundAdditionalCostIds': refundAdditionalCostIds ?? [],
      'refundStatus': refundStatus?.toMap(),
      'isRefundBooking': isRefundBooking,
      'refundInitiatorRoleType': refundInitiatorRoleType.toMap(),
      'paidBookingId': paidBookingId,
      'paidLessonBookingId': paidLessonBookingId,
      'paidAdditionalCostId': paidAdditionalCostId,
      'disputeNumber': disputeNumber,
      'restrictDispute': restrictDispute ?? false,
      'refundAdjustmentState': refundAdjustmentState?.toMap(),
    };
  }

  factory LessonBookingModel.fromMap(Map<String, dynamic> map) {
    const staticStatusType = LessonBookingStatusType.unknown;
    const staticRefundType = LessonBookingRefundType.unknown;
    const staticRoleType = TuiiRoleType.unknown;

    return LessonBookingModel(
      id: map['id'],
      creationDate:
          DateTime.fromMillisecondsSinceEpoch(map['creationDate']).toLocal(),
      lastUpdatedDate:
          DateTime.fromMillisecondsSinceEpoch(map['lastUpdatedDate']).toLocal(),
      tutorId: map['tutorId'] ?? '',
      tutorEmail: map['tutorEmail'],
      tutorName: map['tutorName'] ?? '',
      tutorProfileImageUrl: map['tutorProfileImageUrl'] ?? '',
      tutorAccountId: map['tutorAccountId'] ?? '',
      tutorSendPaymentReceivedEmail:
          map['tutorSendPaymentReceivedEmail'] ?? true,
      studentId: map['studentId'] ?? '',
      studentEmail: map['studentEmail'] ?? '',
      initiatorId: map['initiatorId'] ?? '',
      studentName: map['studentName'] ?? '',
      studentProfileImageUrl: map['studentProfileImageUrl'] ?? '',
      studentHasCustodian: map['studentHasCustodian'] ?? false,
      studentCustodianId: map['studentCustodianId'],
      subjectName: map['subjectName'] ?? '',
      totalAmount: map['totalAmount']?.toDouble() ?? 0.0,
      status: staticStatusType.fromMap(map['status']),
      lessonBookings: List<LessonAppointment>.from(
          map['lessonBookings']?.map((x) => LessonAppointment.fromMap(x))),
      additionalCosts: map['additionalCosts'] != null
          ? List<StripeDynamicLineItem>.from(map['additionalCosts']
              .map((x) => StripeDynamicLineItem.fromMap(x)))
          : [],
      costStructure: LessonBookingCostStructure.fromMap(map['costStructure']),
      originalAcceptance: map['originalAcceptance'],
      originalAcceptanceDate: map['originalAcceptanceDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['originalAcceptanceDate'])
              .toLocal()
          : null,
      auditEntries: map['auditEntries'] != null
          ? List<LessonBookingAuditEntryModel>.from(map['auditEntries']
              ?.map((x) => LessonBookingAuditEntryModel.fromMap(x)))
          : null,
      stripeCheckoutInfo: map['stripeCheckoutInfo'] != null
          ? LessonBookingStripeCheckoutInfoModel.fromMap(
              map['stripeCheckoutInfo'])
          : null,
      stripePaymentInfo: map['stripePaymentInfo'] != null
          ? LessonBookingStripePaymentInfoModel.fromMap(
              map['stripePaymentInfo'])
          : null,
      hasAssociatedRefundBooking: map['hasAssociatedRefundBooking'],
      refundBookingType: map['refundBookingType'] != null
          ? staticRefundType.fromMap(map['refundBookingType'])
          : null,
      refundBookingIds: List<String>.from(map['refundBookingIds'] ?? []),
      refundLessonBookingIds:
          List<String>.from(map['refundLessonBookingIds'] ?? []),
      refundAdditionalCostIds:
          List<String>.from(map['refundAdditionalCostIds'] ?? []),
      refundStatus: map['refundStatus'] != null
          ? staticStatusType.fromMap(map['refundStatus'])
          : null,
      isRefundBooking: map['isRefundBooking'] ?? false,
      refundInitiatorRoleType:
          staticRoleType.fromMap(map['refundInitiatorRoleType']),
      paidBookingId: map['paidBookingId'],
      paidLessonBookingId: map['paidLessonBookingId'],
      paidAdditionalCostId: map['paidAdditionalCostId'],
      disputeNumber: map['disputeNumber'],
      restrictDispute: map['restrictDispute'],
      refundAdjustmentState: map['refundAdjustmentState'] != null
          ? LessonBookingRefundAdjustmentStateModel.fromMap(
              map['refundAdjustmentState'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonBookingModel.fromJson(String source) =>
      LessonBookingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LessonBookingModel(id: $id, creationDate: $creationDate, lastUpdatedDate: $lastUpdatedDate, tutorId: $tutorId, tutorName: $tutorName, tutorProfileImageUrl: $tutorProfileImageUrl, tutorAccountId: $tutorAccountId, studentId: $studentId, initiatorId: $initiatorId, studentName: $studentName, studentProfileImageUrl: $studentProfileImageUrl, subjectName: $subjectName, totalAmount: $totalAmount, status: $status, lessonBookings: $lessonBookings, costStructure: $costStructure, originalAcceptance: $originalAcceptance, originalAcceptanceDate: $originalAcceptanceDate, auditEntries: $auditEntries, stripeInfo: $stripeCheckoutInfo, hasAssociatedRefundBooking: $hasAssociatedRefundBooking, refundBookingType: $refundBookingType, refundBookingIds: $refundBookingIds, refundLessonBookingIds: $refundLessonBookingIds, refundStatus: $refundStatus, isRefundBooking: $isRefundBooking, paidBookingId: $paidBookingId, paidLessonBookingId: $paidLessonBookingId)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      creationDate,
      lastUpdatedDate,
      tutorId,
      tutorEmail,
      tutorName,
      tutorProfileImageUrl,
      tutorAccountId,
      tutorSendPaymentReceivedEmail,
      studentId,
      studentEmail,
      initiatorId,
      studentName,
      studentProfileImageUrl,
      studentHasCustodian,
      studentCustodianId,
      subjectName,
      totalAmount,
      status,
      lessonBookings,
      additionalCosts,
      costStructure,
      originalAcceptance,
      originalAcceptanceDate,
      auditEntries,
      stripeCheckoutInfo,
      hasAssociatedRefundBooking,
      refundBookingType,
      refundBookingIds,
      refundLessonBookingIds,
      refundAdditionalCostIds,
      refundStatus,
      isRefundBooking,
      refundInitiatorRoleType,
      paidBookingId,
      paidLessonBookingId,
      paidAdditionalCostId,
      disputeNumber,
      restrictDispute,
      refundAdjustmentState,
    ];
  }
}
