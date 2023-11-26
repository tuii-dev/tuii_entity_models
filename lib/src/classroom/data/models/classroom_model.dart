import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/classroom/data/models/subject_model.dart';
import 'package:tuii_entity_models/src/tuii_app/data/models/notification_model.dart';

import 'package:tuiicore/core/enums/enums.dart';

class ClassroomModel extends Equatable {
  final String? id;
  final String? tutorId;
  final String? tutorEmail;
  final String? tutorFirstName;
  final String? tutorLastName;
  final String? tutorPhoneNumber;
  final String? tutorStudioName;
  final String? tutorStudioAddress;
  final String? tutorProfileImageUrl;
  final String? tutorZoomMeetingUrl;
  final String? studentId;
  final String? studentEmail;
  final String? studentFirstName;
  final String? studentLastName;
  final DateTime? studentDateOfBirth;
  final String? studentPhoneNumber;
  final String? studentAddress;
  final String? studentNotes;
  final EnrollmentStatusType? studentEnrollmentStatus;
  final bool? studentHasCustodian;
  final String? studentCustodianId;
  final String? studentCustodianFirstName;
  final String? studentCustodianLastName;
  final String? studentCustodianPhoneNumber;
  final String? studentCustodianAddress;
  final String? profileImageUrl;
  final DateTime? nextLessonStartDate;
  final List<SubjectModel>? subjects;
  final List<String>? linkedTaskIds;
  final bool? isParentClassroom;
  final NotificationModel? notification;
  final bool isEmpty;
  final bool isHydrated;

  const ClassroomModel({
    this.id,
    this.tutorId,
    this.tutorEmail,
    this.tutorFirstName,
    this.tutorLastName,
    this.tutorPhoneNumber,
    this.tutorStudioName,
    this.tutorStudioAddress,
    this.tutorProfileImageUrl,
    this.tutorZoomMeetingUrl,
    this.studentId,
    this.studentEmail,
    this.studentFirstName,
    this.studentLastName,
    this.studentDateOfBirth,
    this.studentPhoneNumber,
    this.studentAddress,
    this.studentNotes,
    this.studentEnrollmentStatus,
    this.studentHasCustodian = false,
    this.studentCustodianId,
    this.studentCustodianFirstName,
    this.studentCustodianLastName,
    this.studentCustodianPhoneNumber,
    this.studentCustodianAddress,
    this.profileImageUrl,
    this.nextLessonStartDate,
    this.subjects,
    this.linkedTaskIds,
    this.isParentClassroom = false,
    this.notification,
    this.isEmpty = false,
    this.isHydrated = false,
  });

  factory ClassroomModel.isEmpty() {
    return const ClassroomModel(isEmpty: true);
  }

  ClassroomModel copyWith({
    String? id,
    String? tutorId,
    String? tutorEmail,
    String? tutorFirstName,
    String? tutorLastName,
    String? tutorPhoneNumber,
    String? tutorStudioName,
    String? tutorStudioAddress,
    String? tutorProfileImageUrl,
    String? tutorZoomMeetingUrl,
    String? studentId,
    String? studentEmail,
    String? studentFirstName,
    String? studentLastName,
    DateTime? studentDateOfBirth,
    String? studentPhoneNumber,
    String? studentAddress,
    String? studentNotes,
    EnrollmentStatusType? studentEnrollmentStatus,
    bool? studentHasCustodian,
    String? studentCustodianId,
    String? studentCustodianFirstName,
    String? studentCustodianLastName,
    String? studentCustodianPhoneNumber,
    String? studentCustodianAddress,
    String? profileImageUrl,
    DateTime? nextLessonStartDate,
    List<SubjectModel>? subjects,
    List<String>? linkedTaskIds,
    bool? isParentClassroom,
    NotificationModel? notification,
    bool? isEmpty,
    bool? isHydrated,
  }) {
    return ClassroomModel(
      id: id ?? this.id,
      tutorId: tutorId ?? this.tutorId,
      tutorEmail: tutorEmail ?? this.tutorEmail,
      tutorFirstName: tutorFirstName ?? this.tutorFirstName,
      tutorLastName: tutorLastName ?? this.tutorLastName,
      tutorPhoneNumber: tutorPhoneNumber ?? this.tutorPhoneNumber,
      tutorStudioName: tutorStudioName ?? this.tutorStudioName,
      tutorStudioAddress: tutorStudioAddress ?? this.tutorStudioAddress,
      tutorProfileImageUrl: tutorProfileImageUrl ?? this.tutorProfileImageUrl,
      tutorZoomMeetingUrl: tutorZoomMeetingUrl ?? this.tutorZoomMeetingUrl,
      studentId: studentId ?? this.studentId,
      studentEmail: studentEmail ?? this.studentEmail,
      studentFirstName: studentFirstName ?? this.studentFirstName,
      studentLastName: studentLastName ?? this.studentLastName,
      studentDateOfBirth: studentDateOfBirth ?? this.studentDateOfBirth,
      studentPhoneNumber: studentPhoneNumber ?? this.studentPhoneNumber,
      studentAddress: studentAddress ?? this.studentAddress,
      studentNotes: studentNotes ?? this.studentNotes,
      studentEnrollmentStatus:
          studentEnrollmentStatus ?? this.studentEnrollmentStatus,
      studentHasCustodian: studentHasCustodian ?? this.studentHasCustodian,
      studentCustodianId: studentCustodianId ?? this.studentCustodianId,
      studentCustodianFirstName:
          studentCustodianFirstName ?? this.studentCustodianFirstName,
      studentCustodianLastName:
          studentCustodianLastName ?? this.studentCustodianLastName,
      studentCustodianPhoneNumber:
          studentCustodianPhoneNumber ?? this.studentCustodianPhoneNumber,
      studentCustodianAddress:
          studentCustodianAddress ?? this.studentCustodianAddress,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      nextLessonStartDate: nextLessonStartDate ?? this.nextLessonStartDate,
      subjects: subjects ?? this.subjects,
      linkedTaskIds: linkedTaskIds ?? this.linkedTaskIds,
      isParentClassroom: isParentClassroom ?? this.isParentClassroom,
      notification: notification ?? this.notification,
      isEmpty: isEmpty ?? this.isEmpty,
      isHydrated: isHydrated ?? this.isHydrated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tutorId': tutorId,
      'tutorEmail': tutorEmail,
      'tutorFirstName': tutorFirstName,
      'tutorLastName': tutorLastName,
      'tutorPhoneNumber': tutorPhoneNumber,
      'tutorStudioName': tutorStudioName,
      'tutorStudioAddress': tutorStudioAddress,
      'tutorProfileImageUrl': tutorProfileImageUrl,
      'tutorZoomMeetingUrl': tutorZoomMeetingUrl,
      'studentId': studentId,
      'studentEmail': studentEmail,
      'studentFirstName': studentFirstName,
      'studentLastName': studentLastName,
      'studentDateOfBirth': studentDateOfBirth?.millisecondsSinceEpoch,
      'studentPhoneNumber': studentPhoneNumber,
      'studentAddress': studentAddress,
      'studentNotes': studentNotes,
      'studentEnrollmentStatus': studentEnrollmentStatus?.toMap(),
      'studentHasCustodian': studentHasCustodian,
      'studentCustodianId': studentCustodianId,
      'studentCustodianFirstName': studentCustodianFirstName,
      'studentCustodianLastName': studentCustodianLastName,
      'studentCustodianPhoneNumber': studentCustodianPhoneNumber,
      'studentCustodianAddress': studentCustodianAddress,
      'profileImageUrl': profileImageUrl,
      'nextLessonStartDate': nextLessonStartDate?.millisecondsSinceEpoch,
      'subjects': subjects?.map((x) => x.toMap()).toList(),
      'linkedTaskIds': linkedTaskIds ?? [],
      'isParentClassroom': isParentClassroom,
      'notification': notification?.toMap(),
      'isEmpty': isEmpty,
      'isHydrated': isHydrated,
    };
  }

  factory ClassroomModel.fromMap(Map<String, dynamic> map) {
    const staticType = EnrollmentStatusType.unknown;
    return ClassroomModel(
      id: map['id'],
      tutorId: map['tutorId'],
      tutorEmail: map['tutorEmail'],
      tutorFirstName: map['tutorFirstName'],
      tutorLastName: map['tutorLastName'],
      tutorPhoneNumber: map['tutorPhoneNumber'],
      tutorStudioName: map['tutorStudioName'],
      tutorStudioAddress: map['tutorStudioAddress'],
      tutorProfileImageUrl: map['tutorProfileImageUrl'],
      tutorZoomMeetingUrl: map['tutorZoomMeetingUrl'],
      studentId: map['studentId'],
      studentEmail: map['studentEmail'],
      studentFirstName: map['studentFirstName'],
      studentLastName: map['studentLastName'],
      studentDateOfBirth: map['studentDateOfBirth'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['studentDateOfBirth'])
          : null,
      studentPhoneNumber: map['studentPhoneNumber'],
      studentAddress: map['studentAddress'],
      studentNotes: map['studentNotes'],
      studentEnrollmentStatus: map['studentEnrollmentStatus'] != null
          ? staticType.fromMap(map['studentEnrollmentStatus'])
          : null,
      studentHasCustodian: map['studentHasCustodian'],
      studentCustodianId: map['studentCustodianId'],
      studentCustodianFirstName: map['studentCustodianFirstName'],
      studentCustodianLastName: map['studentCustodianLastName'],
      studentCustodianPhoneNumber: map['studentCustodianPhoneNumber'],
      studentCustodianAddress: map['studentCustodianAddress'],
      profileImageUrl: map['profileImageUrl'],
      nextLessonStartDate: map['nextLessonStartDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['nextLessonStartDate'])
          : null,
      subjects: map['subjects'] != null
          ? List<SubjectModel>.from(
              map['subjects']?.map((x) => SubjectModel.fromMap(x)))
          : null,
      linkedTaskIds: map['linkedTaskIds'] != null
          ? List<String>.from(map['linkedTaskIds'])
          : [],
      isParentClassroom: map['isParentClassroom'],
      notification: map['notification'] != null
          ? NotificationModel.fromMap(map['notification'])
          : null,
      isEmpty: map['isEmpty'] ?? false,
      isHydrated: map['isHydrated'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassroomModel.fromJson(String source) =>
      ClassroomModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClassroomModel(id: $id, tutorId: $tutorId, tutorEmail: $tutorEmail, tutorFirstName: $tutorFirstName, tutorLastName: $tutorLastName, tutorPhoneNumber: $tutorPhoneNumber, tutorStudioName: $tutorStudioName, tutorStudioAddress: $tutorStudioAddress, tutorProfileImageUrl: $tutorProfileImageUrl, tutorZoomMeetingUrl: $tutorZoomMeetingUrl, studentId: $studentId, studentEmail: $studentEmail, studentFirstName: $studentFirstName, studentLastName: $studentLastName, studentDateOfBirth: $studentDateOfBirth, studentPhoneNumber: $studentPhoneNumber, studentAddress: $studentAddress, studentNotes: $studentNotes, studentEnrollmentStatus: $studentEnrollmentStatus, studentHasCustodian: $studentHasCustodian, studentCustodianId: $studentCustodianId, studentCustodianFirstName: $studentCustodianFirstName, studentCustodianLastName: $studentCustodianLastName, studentCustodianPhoneNumber: $studentCustodianPhoneNumber, studentCustodianAddress: $studentCustodianAddress, profileImageUrl: $profileImageUrl, nextLessonStartDate: $nextLessonStartDate, subjects: $subjects, linkedTaskIds: $linkedTaskIds, isParentClassroom: $isParentClassroom, notification: $notification, isEmpty: $isEmpty, isHydrated: $isHydrated)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      tutorId,
      tutorEmail,
      tutorFirstName,
      tutorLastName,
      tutorPhoneNumber,
      tutorStudioName,
      tutorStudioAddress,
      tutorProfileImageUrl,
      tutorZoomMeetingUrl,
      studentId,
      studentEmail,
      studentFirstName,
      studentLastName,
      studentDateOfBirth,
      studentPhoneNumber,
      studentAddress,
      studentNotes,
      studentEnrollmentStatus,
      studentHasCustodian,
      studentCustodianId,
      studentCustodianFirstName,
      studentCustodianLastName,
      studentCustodianPhoneNumber,
      studentCustodianAddress,
      profileImageUrl,
      nextLessonStartDate,
      subjects,
      linkedTaskIds,
      isParentClassroom,
      notification,
      isEmpty,
      isHydrated,
    ];
  }
}
