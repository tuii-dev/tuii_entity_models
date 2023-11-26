import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:tuiicore/core/enums/enums.dart';
import 'package:tuiicore/core/enums/lesson_workflow_type.dart';

class LessonModel extends Equatable {
  final String? id;
  final String? lessonBookingId;
  final String? bookingId;
  final bool? studentHasCustodian;
  final String? studentCustodianId;
  final DateTime? startDate;
  final LessonDeliveryType? lessonDelivery;
  final bool? lessonPaidOut;
  final DateTime? lessonPaidOutDate;
  final bool? lessonPendingPayOut;
  final DateTime? scheduledPayOutDate;
  final bool? lessonPayOutFailed;
  final DateTime? lessonPayOutFailureDate;
  final String? batchManifestId;
  final bool? lessonStarted;
  final bool? lessonCanceled;
  final bool? lessonRefunded;
  final bool? lessonDisputed;
  final bool? lessonCompleted;
  final String? lessonTitle;
  final String? lessonDescription;
  final String? lessonDescriptionDocument;
  final String? lessonCategory;
  final int? lessonLength;
  final double? costOfLesson;
  final String? stripePriceId;
  final String? subjectId;
  final String? subjectName;
  final bool? supportsResourceDrop;
  final List<String>? linkedTaskIds;
  final List<String>? linkedResourceIds;
  final AttendanceStatusType? attendanceStatusType;
  final RtcChannelType? rtcChannelType;
  final RtcProviderType? rtcProviderType;
  final String? rtcConferenceLink;
  final String? zoomStartUrl;
  final String? zoomJoinUrl;
  final dynamic zoomMeetingId;
  final bool? isHydrated;
  final bool? isPendingSubsequentApproval;
  final List<LessonWorkflowType>? currentWorkflows;
  List<String>? linkedTaskResourceIds;

  LessonModel({
    this.id,
    this.lessonBookingId,
    this.bookingId,
    this.studentHasCustodian,
    this.studentCustodianId,
    this.startDate,
    this.lessonDelivery,
    this.lessonPaidOut = false,
    this.lessonPaidOutDate,
    this.lessonPendingPayOut = false,
    this.scheduledPayOutDate,
    this.lessonPayOutFailed = false,
    this.lessonPayOutFailureDate,
    this.batchManifestId,
    this.lessonStarted,
    this.lessonCanceled,
    this.lessonRefunded = false,
    this.lessonDisputed = false,
    this.lessonCompleted,
    this.lessonTitle,
    this.lessonDescription,
    this.lessonDescriptionDocument,
    this.lessonCategory,
    this.lessonLength,
    this.costOfLesson,
    this.stripePriceId,
    this.subjectId,
    this.subjectName,
    this.supportsResourceDrop,
    this.linkedTaskIds,
    this.linkedResourceIds,
    this.linkedTaskResourceIds = const [],
    this.attendanceStatusType,
    this.rtcChannelType,
    this.rtcProviderType,
    this.rtcConferenceLink,
    this.zoomStartUrl,
    this.zoomJoinUrl,
    this.zoomMeetingId,
    this.isHydrated = true,
    this.isPendingSubsequentApproval = false,
    this.currentWorkflows = const [],
  });

  @override
  List<Object?> get props {
    return [
      id,
      lessonBookingId,
      bookingId,
      studentHasCustodian,
      studentCustodianId,
      startDate,
      lessonDelivery,
      lessonPaidOut,
      lessonPaidOutDate,
      lessonPendingPayOut,
      scheduledPayOutDate,
      lessonPayOutFailed,
      lessonPayOutFailureDate,
      batchManifestId,
      lessonStarted,
      lessonCanceled,
      lessonRefunded,
      lessonDisputed,
      lessonCompleted,
      lessonTitle,
      lessonDescription,
      lessonDescriptionDocument,
      lessonCategory,
      lessonLength,
      costOfLesson,
      stripePriceId,
      subjectId,
      subjectName,
      supportsResourceDrop,
      linkedTaskIds,
      linkedResourceIds,
      linkedTaskResourceIds,
      attendanceStatusType,
      rtcChannelType,
      rtcProviderType,
      rtcConferenceLink,
      zoomStartUrl,
      zoomJoinUrl,
      zoomMeetingId,
      isPendingSubsequentApproval,
      currentWorkflows,
    ];
  }

  LessonModel copyWith({
    String? id,
    String? lessonBookingId,
    String? bookingId,
    bool? studentHasCustodian,
    String? studentCustodianId,
    DateTime? startDate,
    LessonDeliveryType? lessonDelivery,
    bool? lessonPaidOut,
    DateTime? lessonPaidOutDate,
    bool? lessonPendingPayOut,
    DateTime? scheduledPayOutDate,
    bool? lessonPayOutFailed,
    DateTime? lessonPayOutFailureDate,
    String? batchManifestId,
    bool? lessonStarted,
    bool? lessonCanceled,
    bool? lessonRefunded,
    bool? lessonDisputed,
    bool? lessonCompleted,
    String? lessonTitle,
    String? lessonDescription,
    String? lessonDescriptionDocument,
    String? lessonCategory,
    int? lessonLength,
    double? costOfLesson,
    String? subjectId,
    String? stripePriceId,
    String? subjectName,
    bool? supportsResourceDrop,
    List<String>? linkedTaskIds,
    List<String>? linkedResourceIds,
    List<String>? linkedTaskResourceIds,
    AttendanceStatusType? attendanceStatusType,
    RtcChannelType? rtcChannelType,
    RtcProviderType? rtcProviderType,
    String? rtcConferenceLink,
    String? zoomStartUrl,
    String? zoomJoinUrl,
    dynamic zoomMeetingId,
    bool? isPendingSubsequentApproval,
    List<LessonWorkflowType>? currentWorkflows,
  }) {
    return LessonModel(
      id: id ?? this.id,
      lessonBookingId: lessonBookingId ?? this.lessonBookingId,
      bookingId: bookingId ?? this.bookingId,
      studentHasCustodian: studentHasCustodian ?? this.studentHasCustodian,
      studentCustodianId: studentCustodianId ?? this.studentCustodianId,
      startDate: startDate ?? this.startDate,
      lessonDelivery: lessonDelivery ?? this.lessonDelivery,
      lessonPaidOut: lessonPaidOut ?? this.lessonPaidOut,
      lessonPaidOutDate: lessonPaidOutDate ?? this.lessonPaidOutDate,
      lessonPendingPayOut: lessonPendingPayOut ?? this.lessonPendingPayOut,
      scheduledPayOutDate: scheduledPayOutDate ?? this.scheduledPayOutDate,
      lessonPayOutFailed: lessonPayOutFailed ?? this.lessonPayOutFailed,
      lessonPayOutFailureDate:
          lessonPayOutFailureDate ?? this.lessonPayOutFailureDate,
      batchManifestId: batchManifestId ?? this.batchManifestId,
      lessonStarted: lessonStarted ?? this.lessonStarted,
      lessonCanceled: lessonCanceled ?? this.lessonCanceled,
      lessonRefunded: lessonRefunded ?? this.lessonRefunded,
      lessonDisputed: lessonDisputed ?? this.lessonDisputed,
      lessonCompleted: lessonCompleted ?? this.lessonCompleted,
      lessonTitle: lessonTitle ?? this.lessonTitle,
      lessonDescription: lessonDescription ?? this.lessonDescription,
      lessonDescriptionDocument:
          lessonDescriptionDocument ?? this.lessonDescriptionDocument,
      lessonCategory: lessonCategory ?? this.lessonCategory,
      lessonLength: lessonLength ?? this.lessonLength,
      costOfLesson: costOfLesson ?? this.costOfLesson,
      stripePriceId: stripePriceId ?? this.stripePriceId,
      subjectId: subjectId ?? this.subjectId,
      subjectName: subjectName ?? this.subjectName,
      supportsResourceDrop: supportsResourceDrop ?? this.supportsResourceDrop,
      linkedTaskIds: linkedTaskIds ?? this.linkedTaskIds,
      linkedResourceIds: linkedResourceIds ?? this.linkedResourceIds,
      linkedTaskResourceIds:
          linkedTaskResourceIds ?? this.linkedTaskResourceIds,
      attendanceStatusType: attendanceStatusType ?? this.attendanceStatusType,
      rtcChannelType: rtcChannelType ?? this.rtcChannelType,
      rtcProviderType: rtcProviderType ?? this.rtcProviderType,
      rtcConferenceLink: rtcConferenceLink ?? this.rtcConferenceLink,
      zoomStartUrl: zoomStartUrl ?? this.zoomStartUrl,
      zoomJoinUrl: zoomJoinUrl ?? this.zoomJoinUrl,
      zoomMeetingId: zoomMeetingId ?? this.zoomMeetingId,
      isPendingSubsequentApproval:
          isPendingSubsequentApproval ?? this.isPendingSubsequentApproval,
      currentWorkflows: currentWorkflows ?? this.currentWorkflows,
    );
  }

  LessonModel clone() {
    return LessonModel(
      id: id,
      lessonBookingId: lessonBookingId,
      bookingId: bookingId,
      studentHasCustodian: studentHasCustodian,
      studentCustodianId: studentCustodianId,
      startDate: startDate,
      lessonDelivery: lessonDelivery,
      lessonPaidOut: lessonPaidOut,
      lessonPaidOutDate: lessonPaidOutDate,
      lessonPendingPayOut: lessonPendingPayOut,
      scheduledPayOutDate: scheduledPayOutDate,
      lessonPayOutFailed: lessonPayOutFailed,
      lessonPayOutFailureDate: lessonPayOutFailureDate,
      batchManifestId: batchManifestId,
      lessonStarted: lessonStarted,
      lessonCanceled: lessonCanceled,
      lessonRefunded: lessonRefunded,
      lessonDisputed: lessonDisputed,
      lessonCompleted: lessonCompleted,
      lessonTitle: lessonTitle,
      lessonDescription: lessonDescription,
      lessonDescriptionDocument: lessonDescriptionDocument,
      lessonCategory: lessonCategory,
      lessonLength: lessonLength,
      costOfLesson: costOfLesson,
      stripePriceId: stripePriceId,
      subjectId: subjectId,
      subjectName: subjectName,
      supportsResourceDrop: supportsResourceDrop,
      linkedTaskIds: linkedTaskIds,
      linkedResourceIds: linkedResourceIds,
      linkedTaskResourceIds: linkedTaskResourceIds,
      attendanceStatusType: attendanceStatusType,
      rtcChannelType: rtcChannelType,
      rtcProviderType: rtcProviderType,
      rtcConferenceLink: rtcConferenceLink,
      zoomStartUrl: zoomStartUrl,
      zoomJoinUrl: zoomJoinUrl,
      zoomMeetingId: zoomMeetingId,
      isPendingSubsequentApproval: isPendingSubsequentApproval,
      currentWorkflows: currentWorkflows,
    );
  }

  LessonModel resetPayoutStatus(bool? isCompleted) {
    return LessonModel(
      id: id,
      attendanceStatusType: AttendanceStatusType.pending,
      lessonBookingId: lessonBookingId,
      bookingId: bookingId,
      studentHasCustodian: studentHasCustodian,
      studentCustodianId: studentCustodianId,
      startDate: startDate,
      lessonDelivery: lessonDelivery,
      lessonPaidOut: false,
      lessonPendingPayOut: false,
      lessonPayOutFailed: false,
      batchManifestId: batchManifestId,
      lessonStarted: lessonStarted,
      lessonCanceled: lessonCanceled,
      lessonRefunded: lessonRefunded,
      lessonDisputed: lessonDisputed,
      lessonCompleted: isCompleted ?? lessonCompleted,
      lessonTitle: lessonTitle,
      lessonDescription: lessonDescription,
      lessonDescriptionDocument: lessonDescriptionDocument,
      lessonCategory: lessonCategory,
      lessonLength: lessonLength,
      costOfLesson: costOfLesson,
      stripePriceId: stripePriceId,
      subjectId: subjectId,
      subjectName: subjectName,
      supportsResourceDrop: supportsResourceDrop,
      linkedTaskIds: linkedTaskIds,
      linkedResourceIds: linkedResourceIds,
      linkedTaskResourceIds: linkedTaskResourceIds,
      rtcChannelType: rtcChannelType,
      rtcProviderType: rtcProviderType,
      rtcConferenceLink: rtcConferenceLink,
      zoomStartUrl: zoomStartUrl,
      zoomJoinUrl: zoomJoinUrl,
      zoomMeetingId: zoomMeetingId,
      isPendingSubsequentApproval: isPendingSubsequentApproval,
      currentWorkflows: currentWorkflows,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lessonBookingId': lessonBookingId ?? '',
      'bookingId': bookingId ?? '',
      'studentHasCustodian': studentHasCustodian,
      'studentCustodianId': studentCustodianId,
      'startDate': startDate?.toUtc().millisecondsSinceEpoch,
      'lessonDelivery': lessonDelivery?.toMap(),
      'lessonPaidOut': lessonPaidOut,
      'lessonPaidOutDate': lessonPaidOutDate?.toUtc().millisecondsSinceEpoch,
      'lessonPendingPayOut': lessonPendingPayOut,
      'scheduledPayOutDate':
          scheduledPayOutDate?.toUtc().millisecondsSinceEpoch,
      'lessonPayOutFailed': lessonPayOutFailed,
      'lessonPayOutFailureDate':
          lessonPayOutFailureDate?.toUtc().millisecondsSinceEpoch,
      'batchManifestId': batchManifestId,
      'lessonStarted': lessonStarted,
      'lessonCanceled': lessonCanceled,
      'lessonRefunded': lessonRefunded ?? false,
      'lessonDisputed': lessonDisputed ?? false,
      'lessonCompleted': lessonCompleted,
      'lessonTitle': lessonTitle,
      'lessonDescription': lessonDescription ?? '',
      'lessonDescriptionDocument': lessonDescriptionDocument ?? '',
      'lessonCategory': lessonCategory ?? '',
      'lessonLength': lessonLength ?? 60,
      'costOfLesson': costOfLesson ?? 50,
      'stripePriceId': stripePriceId ?? '',
      'subjectId': subjectId ?? '',
      'subjectName': subjectName ?? '',
      'supportsResourceDrop': supportsResourceDrop ?? true,
      'linkedTaskIds': linkedTaskIds,
      'linkedResourceIds': linkedResourceIds,
      'attendanceStatusType': attendanceStatusType != null
          ? attendanceStatusType!.toMap()
          : AttendanceStatusType.pending.toMap(),
      'rtcChannelType': rtcChannelType != null
          ? rtcChannelType!.toMap()
          : RtcChannelType.video.toMap(),
      'rtcProviderType': rtcProviderType != null
          ? rtcProviderType!.toMap()
          : RtcProviderType.zoom.toMap(),
      'rtcConferenceLink': rtcConferenceLink,
      'zoomStartUrl': zoomStartUrl,
      'zoomJoinUrl': zoomJoinUrl,
      'zoomMeetingId': zoomMeetingId,
      'isPendingSubsequentApproval': isPendingSubsequentApproval ?? false,
      'currentWorkflows': currentWorkflows != null
          ? currentWorkflows!.map((cw) => cw.toMap()).toList()
          : [],
    };
  }

  factory LessonModel.fromMap(Map<String, dynamic> map) {
    const staticLessonDeliveryType = LessonDeliveryType.unknown;
    const staticAttendanceStatusType = AttendanceStatusType.unknown;
    const staticRtcChannelType = RtcChannelType.video;
    const staticRtcProviderType = RtcProviderType.zoom;
    const staticLessonWorkflowType = LessonWorkflowType.unknown;

    return LessonModel(
      id: map['id'],
      lessonBookingId: map['lessonBookingId'],
      bookingId: map['bookingId'],
      studentHasCustodian: map['studentHasCustodian'] ?? false,
      studentCustodianId: map['studentCustodianId'] ?? '',
      startDate: map['startDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['startDate']).toLocal()
          : DateTime.parse('1970-01-01'),
      lessonDelivery: staticLessonDeliveryType.fromMap(map['lessonDelivery']),
      lessonPaidOut: map['lessonPaidOut'],
      lessonPaidOutDate: map['lessonPaidOutDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lessonPaidOutDate'])
              .toLocal()
          : null,
      lessonPendingPayOut: map['lessonPendingPayOut'],
      scheduledPayOutDate: map['scheduledPayOutDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['scheduledPayOutDate'])
              .toLocal()
          : null,
      lessonPayOutFailed: map['lessonPayOutFailed'],
      lessonPayOutFailureDate: map['lessonPayOutFailureDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lessonPayOutFailureDate'])
              .toLocal()
          : null,
      batchManifestId: map['batchManifestId'],
      lessonStarted: map['lessonStarted'],
      lessonCanceled: map['lessonCanceled'],
      lessonRefunded: map['lessonRefunded'] ?? false,
      lessonDisputed: map['lessonDisputed'] ?? false,
      lessonCompleted: map['lessonCompleted'],
      lessonTitle: map['lessonTitle'],
      lessonDescription: map['lessonDescription'] ?? '',
      lessonDescriptionDocument: map['lessonDescriptionDocument'] ?? '',
      lessonCategory: map['lessonCategory'] ?? '',
      lessonLength: map['lessonLength'] ?? 60,
      costOfLesson: map['costOfLesson'] ?? 50,
      stripePriceId: map['stripePriceId'] ?? '',
      subjectId: map['subjectId'] ?? '',
      subjectName: map['subjectName'] ?? '',
      supportsResourceDrop: map['supportsResourceDrop'] ?? true,
      linkedTaskIds: List<String>.from(map['linkedTaskIds'] ?? []),
      linkedResourceIds: List<String>.from(map['linkedResourceIds'] ?? []),
      attendanceStatusType:
          staticAttendanceStatusType.fromMap(map['attendanceStatusType']),
      rtcChannelType: staticRtcChannelType.fromMap(map['rtcChannelType']),
      rtcProviderType: staticRtcProviderType.fromMap(map['rtcProviderType']),
      rtcConferenceLink: map['rtcConferenceLink'],
      zoomStartUrl: map['zoomStartUrl'],
      zoomJoinUrl: map['zoomJoinUrl'],
      zoomMeetingId: map['zoomMeetingId'],
      isPendingSubsequentApproval: map['isPendingSubsequentApproval'] ?? false,
      currentWorkflows: List<LessonWorkflowType>.from(
          (map['currentWorkflows'] ?? [])
              .map((cw) => staticLessonWorkflowType.fromMap(cw))),
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonModel.fromJson(String source) =>
      LessonModel.fromMap(json.decode(source));

  List<String> updateLinkedTaskResourceIds(List<String> ids) {
    linkedTaskResourceIds = ids;
    return linkedTaskResourceIds!;
  }
}
