import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tuii_entity_models/src/auth/data/models/user_model.dart';
import 'package:tuii_entity_models/src/calendar/data/models/lesson_booking_line_item_model.dart';
import 'package:tuii_entity_models/src/calendar/data/models/lesson_booking_model.dart';
import 'package:tuii_entity_models/src/classroom/data/models/classroom_model.dart';
import 'package:tuii_entity_models/src/classroom/data/models/lesson_model.dart';
import 'package:tuii_entity_models/src/classroom/data/models/subject_model.dart';

import 'package:tuiicore/core/common/tutor_lesson_index_model.dart';
import 'package:tuiicore/core/enums/enums.dart';
import 'package:tuiicore/core/enums/lesson_appointment_type.dart';
import 'package:tuiicore/core/models/lesson_time_segment_configuration.dart';
import 'package:tuiicore/core/common/discount_description_model.dart';

class LessonAppointment extends Equatable {
  final DateTime startTime;
  final DateTime endTime;
  final String subject;
  final Color color;
  final String startTimeZone;
  final String endTimeZone;

  final ClassroomModel classroom;
  final SubjectModel subjectModel;
  final LessonModel lesson;
  final LessonIndexModel lessonIndex;
  final UserModel student;

  // New Booking Stuff
  final bool isEditable;
  final double? costOfLesson;
  final double? discountedCostOfLesson;
  final String? stripePriceId;
  final bool? lessonRecurs;
  final int? numberOfLessons;
  final LessonRecurringFrequencyType? lessonRecurringFrequencyType;
  final LessonTimeSegmentConfiguration? timeSegment;
  final String? bookingId;

  // Unconfirmed Booking Stuff
  final bool isUnconfirmed;
  // final LessonBookingStatusType? unconfirmedStatusType;

  final bool? isRefunded;
  final bool? isPendingRefund;
  final bool? isDisputed;
  final String? paidBookingId;
  final String? refundBookingId;
  final bool? isRescheduled;

  // Payouts
  final bool? isPaidOut;
  final DateTime? payoutDate;

  final bool? isPendingPayOut;
  final DateTime? scheduledPayoutDate;

  final bool? payOutFailed;
  final DateTime? payOutFailureDate;

  final String? batchManifestId;

  // Lesson Booking for routes on unconfirmed appointments
  final LessonBookingModel? lessonBooking;

  final LessonAppointmentType? appointmentType;
  final String? newSessionUuid;
  final bool? isPendingSubsequentApproval;
  final bool? saveSubsequentApprovalStatus;
  final AttendanceStatusType? attendanceStatus;
  final DiscountDescriptionModel? discountDescription;
  final bool? hasChanged;

  const LessonAppointment({
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.color,
    required this.startTimeZone,
    required this.endTimeZone,
    required this.classroom,
    required this.subjectModel,
    required this.lesson,
    required this.lessonIndex,
    required this.student,

    // New Booking Stuff
    this.isEditable = false,
    this.costOfLesson,
    this.discountedCostOfLesson,
    this.stripePriceId,
    this.lessonRecurs,
    this.numberOfLessons,
    this.lessonRecurringFrequencyType,
    this.timeSegment,
    this.bookingId,

    // Unconfirmed Booking Stuff
    this.isUnconfirmed = false,
    this.isRefunded = false,
    this.isPendingRefund = false,
    this.isDisputed = false,

    // Payout Stuff
    this.isPaidOut,
    this.payoutDate,
    this.isPendingPayOut,
    this.scheduledPayoutDate,
    this.payOutFailed,
    this.payOutFailureDate,
    this.batchManifestId,
    this.paidBookingId,
    this.refundBookingId,
    this.isRescheduled = false,
    this.lessonBooking,
    this.appointmentType = LessonAppointmentType.confirmed,
    this.newSessionUuid,
    this.isPendingSubsequentApproval = false,
    this.saveSubsequentApprovalStatus = false,
    this.attendanceStatus,
    this.discountDescription,
    this.hasChanged = false,
    // this.unconfirmedStatusType,
  });

  @override
  List<Object?> get props {
    return [
      startTime,
      endTime,
      subject,
      color,
      startTimeZone,
      endTimeZone,

      classroom,
      subjectModel,
      lesson,
      lessonIndex,
      student,

      isEditable,
      costOfLesson,
      discountedCostOfLesson,
      stripePriceId,
      lessonRecurs,
      numberOfLessons,
      lessonRecurringFrequencyType,
      timeSegment,
      bookingId,

      isUnconfirmed,
      isRefunded,
      isPendingRefund,
      isDisputed,
      paidBookingId,
      refundBookingId,
      isRescheduled,
      lessonBooking,

      isPaidOut,
      payoutDate,
      isPendingPayOut,
      scheduledPayoutDate,
      payOutFailed,
      payOutFailureDate,
      batchManifestId,

      appointmentType,
      newSessionUuid,
      isPendingSubsequentApproval,
      saveSubsequentApprovalStatus,
      attendanceStatus,
      discountDescription,
      hasChanged,
      // unconfirmedStatusType,
    ];
  }

  LessonAppointment copyWith({
    DateTime? startTime,
    DateTime? endTime,
    String? subject,
    Color? color,
    String? startTimeZone,
    String? endTimeZone,
    ClassroomModel? classroom,
    SubjectModel? subjectModel,
    LessonModel? lesson,
    LessonIndexModel? lessonIndex,
    UserModel? student,
    bool? isEditable,
    double? costOfLesson,
    double? discountedCostOfLesson,
    String? stripePriceId,
    bool? lessonRecurs,
    int? numberOfLessons,
    LessonRecurringFrequencyType? lessonRecurringFrequencyType,
    LessonTimeSegmentConfiguration? timeSegment,
    String? bookingId,
    bool? isUnconfirmed,
    bool? isRefunded,
    bool? isPendingRefund,
    bool? isDisputed,
    bool? isPaidOut,
    DateTime? payoutDate,
    bool? isPendingPayOut,
    DateTime? scheduledPayoutDate,
    bool? payOutFailed,
    DateTime? payOutFailureDate,
    String? batchManifestId,
    String? paidBookingId,
    String? refundBookingId,
    bool? isRescheduled,
    LessonBookingModel? lessonBooking,
    LessonAppointmentType? appointmentType,
    String? newSessionUuid,
    bool? isPendingSubsequentApproval,
    bool? saveSubsequentApprovalStatus,
    AttendanceStatusType? attendanceStatus,
    DiscountDescriptionModel? discountDescription,
    bool? hasChanged,
    // LessonBookingStatusType? unconfirmedStatusType,
  }) {
    return LessonAppointment(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      subject: subject ?? this.subject,
      color: color ?? this.color,
      startTimeZone: startTimeZone ?? this.startTimeZone,
      endTimeZone: endTimeZone ?? this.endTimeZone,
      classroom: classroom ?? this.classroom,
      subjectModel: subjectModel ?? this.subjectModel,
      lesson: lesson ?? this.lesson,
      lessonIndex: lessonIndex ?? this.lessonIndex,
      student: student ?? this.student,
      isEditable: isEditable ?? this.isEditable,
      costOfLesson: costOfLesson ?? this.costOfLesson,
      discountedCostOfLesson:
          discountedCostOfLesson ?? this.discountedCostOfLesson,
      stripePriceId: stripePriceId ?? this.stripePriceId,
      lessonRecurs: lessonRecurs ?? this.lessonRecurs,
      numberOfLessons: numberOfLessons ?? this.numberOfLessons,
      lessonRecurringFrequencyType:
          lessonRecurringFrequencyType ?? this.lessonRecurringFrequencyType,
      timeSegment: timeSegment ?? this.timeSegment,
      bookingId: bookingId ?? this.bookingId,
      isUnconfirmed: isUnconfirmed ?? this.isUnconfirmed,
      isRefunded: isRefunded ?? this.isRefunded,
      isPendingRefund: isPendingRefund ?? this.isPendingRefund,
      isDisputed: isDisputed ?? this.isDisputed,
      isPaidOut: isPaidOut ?? this.isPaidOut,
      payoutDate: payoutDate ?? this.payoutDate,
      isPendingPayOut: isPendingPayOut ?? this.isPendingPayOut,
      scheduledPayoutDate: scheduledPayoutDate ?? this.scheduledPayoutDate,
      payOutFailed: payOutFailed ?? this.payOutFailed,
      payOutFailureDate: payOutFailureDate ?? this.payOutFailureDate,
      batchManifestId: batchManifestId ?? this.batchManifestId,
      paidBookingId: paidBookingId ?? this.paidBookingId,
      refundBookingId: refundBookingId ?? this.refundBookingId,
      isRescheduled: isRescheduled ?? this.isRescheduled,
      lessonBooking: lessonBooking ?? this.lessonBooking,
      appointmentType: appointmentType ?? this.appointmentType,
      newSessionUuid: newSessionUuid ?? this.newSessionUuid,
      isPendingSubsequentApproval:
          isPendingSubsequentApproval ?? this.isPendingSubsequentApproval,
      saveSubsequentApprovalStatus:
          saveSubsequentApprovalStatus ?? this.saveSubsequentApprovalStatus,
      attendanceStatus: attendanceStatus ?? this.attendanceStatus,
      discountDescription: discountDescription ?? this.discountDescription,
      hasChanged: hasChanged ?? this.hasChanged,
    );
  }

  LessonAppointment removeDiscount() {
    return LessonAppointment(
      startTime: startTime,
      endTime: endTime,
      subject: subject,
      color: color,
      startTimeZone: startTimeZone,
      endTimeZone: endTimeZone,
      classroom: classroom,
      subjectModel: subjectModel,
      lesson: lesson,
      lessonIndex: lessonIndex,
      student: student,
      isEditable: isEditable,
      costOfLesson: costOfLesson,
      stripePriceId: stripePriceId,
      lessonRecurs: lessonRecurs,
      numberOfLessons: numberOfLessons,
      lessonRecurringFrequencyType: lessonRecurringFrequencyType,
      timeSegment: timeSegment,
      bookingId: bookingId,
      isUnconfirmed: isUnconfirmed,
      isRefunded: isRefunded,
      isPendingRefund: isPendingRefund,
      isDisputed: isDisputed,
      isPaidOut: isPaidOut,
      payoutDate: payoutDate,
      isPendingPayOut: isPendingPayOut,
      scheduledPayoutDate: scheduledPayoutDate,
      payOutFailed: payOutFailed,
      payOutFailureDate: payOutFailureDate,
      batchManifestId: batchManifestId,
      paidBookingId: paidBookingId,
      refundBookingId: refundBookingId,
      isRescheduled: isRescheduled,
      lessonBooking: lessonBooking,
      appointmentType: appointmentType,
      newSessionUuid: newSessionUuid,
      isPendingSubsequentApproval: isPendingSubsequentApproval,
      saveSubsequentApprovalStatus: saveSubsequentApprovalStatus,
      attendanceStatus: attendanceStatus,
      hasChanged: hasChanged,
    );
  }

  LessonAppointment clone() {
    return LessonAppointment(
      startTime: startTime,
      endTime: endTime,
      subject: subject,
      color: color,
      startTimeZone: startTimeZone,
      endTimeZone: endTimeZone,
      classroom: classroom,
      subjectModel: subjectModel,
      lesson: lesson.clone(),
      lessonIndex: lessonIndex.clone(),
      student: student,
      isEditable: isEditable,
      costOfLesson: costOfLesson,
      discountedCostOfLesson: discountedCostOfLesson,
      stripePriceId: stripePriceId,
      lessonRecurs: lessonRecurs,
      numberOfLessons: numberOfLessons,
      lessonRecurringFrequencyType: lessonRecurringFrequencyType,
      timeSegment: timeSegment,
      bookingId: bookingId,
      isUnconfirmed: isUnconfirmed,
      isRefunded: isRefunded,
      isPendingRefund: isPendingRefund,
      isDisputed: isDisputed,
      isPaidOut: isPaidOut,
      payoutDate: payoutDate,
      isPendingPayOut: isPendingPayOut,
      scheduledPayoutDate: scheduledPayoutDate,
      payOutFailed: payOutFailed,
      payOutFailureDate: payOutFailureDate,
      batchManifestId: batchManifestId,
      paidBookingId: paidBookingId,
      refundBookingId: refundBookingId,
      isRescheduled: isRescheduled,
      lessonBooking: lessonBooking,
      appointmentType: appointmentType,
      newSessionUuid: '',
      isPendingSubsequentApproval: isPendingSubsequentApproval,
      saveSubsequentApprovalStatus: saveSubsequentApprovalStatus,
      attendanceStatus: attendanceStatus,
      discountDescription: discountDescription,
      hasChanged: hasChanged,
      // unconfirmedStatusType: unconfirmedStatusType,
    );
  }

  LessonBookingLineItemModel toLineItem() {
    return LessonBookingLineItemModel(
      bookingId: bookingId,
      subject: subjectModel.name,
      deliveryMode: (lessonIndex.lessonDelivery as LessonDeliveryType).display,
      lengthText: timeSegment!.displayText,
      costOfLesson: costOfLesson,
      discountedCostOfLesson: discountedCostOfLesson,
      stripePriceId: stripePriceId,
      discountDescription: discountDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'startTime': startTime.toUtc().millisecondsSinceEpoch,
      'endTime': endTime.toUtc().millisecondsSinceEpoch,
      'subject': subject,
      'color': color.value,
      'startTimeZone': startTimeZone,
      'endTimeZone': endTimeZone,
      'classroom': classroom.toMap(),
      'subjectModel': subjectModel.toMap(),
      'lesson': lesson.toMap(),
      'lessonIndex': lessonIndex.toMap(),
      'student': student.toMap(),
      'isEditable': isEditable,
      'costOfLesson': costOfLesson,
      'discountedCostOfLesson': discountedCostOfLesson,
      'stripePriceId': stripePriceId,
      'lessonRecurs': lessonRecurs,
      'numberOfLessons': numberOfLessons,
      'lessonRecurringFrequencyType': lessonRecurringFrequencyType?.toMap(),
      'timeSegment': timeSegment?.toMap(),
      'bookingId': bookingId,
      'isUnconfirmed': isUnconfirmed,
      'isRefunded': isRefunded,
      'isPendingRefund': isPendingRefund,
      'isDisputed': isDisputed,
      'isPaidOut': isPaidOut,
      'payoutDate': payoutDate?.toUtc().millisecondsSinceEpoch,
      'isPendingPayOut': isPendingPayOut,
      'scheduledPayoutDate':
          scheduledPayoutDate?.toUtc().millisecondsSinceEpoch,
      'payOutFailed': payOutFailed,
      'payOutFailureDate': payOutFailureDate?.toUtc().millisecondsSinceEpoch,
      'batchManifestId': batchManifestId,
      'paidBookingId': paidBookingId,
      'refundBookingId': refundBookingId,
      'isRescheduled': isRescheduled,
      'isPendingSubsequentApproval': isPendingSubsequentApproval ?? false,
      'discountDescription': discountDescription?.toMap(),
      // 'unconfirmedStatusType': unconfirmedStatusType?.toMap(),
    };
  }

  factory LessonAppointment.fromMap(Map<String, dynamic> map) {
    const recurringStaticType = LessonRecurringFrequencyType.unknown;
    // const bookingStatusStaticType = LessonBookingStatusType.unknown;
    return LessonAppointment(
      startTime:
          DateTime.fromMillisecondsSinceEpoch(map['startTime']).toLocal(),
      endTime: DateTime.fromMillisecondsSinceEpoch(map['endTime']).toLocal(),
      subject: map['subject'] ?? '',
      color: Color(map['color']),
      startTimeZone: map['startTimeZone'] ?? '',
      endTimeZone: map['endTimeZone'] ?? '',
      classroom: ClassroomModel.fromMap(map['classroom']),
      subjectModel: SubjectModel.fromMap(map['subjectModel']),
      lesson: LessonModel.fromMap(map['lesson']),
      lessonIndex: LessonIndexModel.fromMap(map['lessonIndex']),
      student: UserModel.fromMap(map['student']),
      isEditable: map['isEditable'] ?? false,
      costOfLesson: map['costOfLesson']?.toDouble(),
      discountedCostOfLesson: map['discountedCostOfLesson']?.toDouble(),
      stripePriceId: map['stripePriceId'] ?? '',
      lessonRecurs: map['lessonRecurs'],
      numberOfLessons: map['numberOfLessons']?.toInt(),
      lessonRecurringFrequencyType: map['lessonRecurringFrequencyType'] != null
          ? recurringStaticType.fromMap(map['lessonRecurringFrequencyType'])
          : null,
      timeSegment: map['timeSegment'] != null
          ? LessonTimeSegmentConfiguration.fromMap(map['timeSegment'])
          : null,
      bookingId: map['bookingId'],
      isUnconfirmed: map['isUnconfirmed'] ?? false,
      isRefunded: map['isRefunded'] ?? false,
      isPendingRefund: map['isPendingRefund'] ?? false,
      isDisputed: map['isDisputed'] ?? false,
      isPaidOut: map['isPaidOut'] ?? false,
      payoutDate: map['payoutDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['payoutDate']).toLocal()
          : null,
      isPendingPayOut: map['isPendingPayOut'] ?? false,
      scheduledPayoutDate: map['scheduledPayoutDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['scheduledPayoutDate'])
              .toLocal()
          : null,
      payOutFailed: map['payOutFailed'],
      payOutFailureDate: map['payOutFailureDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['payOutFailureDate'])
              .toLocal()
          : null,
      batchManifestId: map['batchManifestId'],
      paidBookingId: map['paidBookingId'],
      refundBookingId: map['refundBookingId'],
      isRescheduled: map['isRescheduled'] ?? false,
      isPendingSubsequentApproval: map['isPendingSubsequentApproval'] ?? false,
      discountDescription: map['discountDescription'] != null
          ? DiscountDescriptionModel.fromMap(map['discountDescription'])
          : null,
      // unconfirmedStatusType:
      //     bookingStatusStaticType.fromMap(map['unconfirmedStatusType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonAppointment.fromJson(String source) =>
      LessonAppointment.fromMap(json.decode(source));
}
