import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuiientitymodels/files/auth/data/models/child_registration_model.dart';
import 'package:tuiientitymodels/files/classroom/data/models/subject_model.dart';

import 'package:tuiicore/core/enums/enums.dart';

class ParentTutorConnectionModel extends Equatable {
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
  final String? tutorBio;
  final List<SubjectModel>? tutorSubjects;
  final String? parentId;
  final String? parentEmail;
  final String? parentFirstName;
  final String? parentLastName;
  final EnrollmentStatusType? parentEnrollmentStatus;
  final String? profileImageUrl;
  final List<ChildRegistrationModel>? children;
  final DateTime? connectionDate;
  final bool isEmpty;

  const ParentTutorConnectionModel({
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
    this.tutorBio,
    this.tutorSubjects,
    this.parentId,
    this.parentEmail,
    this.parentFirstName,
    this.parentLastName,
    this.parentEnrollmentStatus,
    this.profileImageUrl,
    this.children,
    this.connectionDate,
    this.isEmpty = false,
  });

  ParentTutorConnectionModel copyWith({
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
    String? tutorBio,
    List<SubjectModel>? tutorSubjects,
    String? parentId,
    String? parentEmail,
    String? parentFirstName,
    String? parentLastName,
    EnrollmentStatusType? parentEnrollmentStatus,
    String? profileImageUrl,
    List<ChildRegistrationModel>? children,
    DateTime? connectionDate,
    bool? isEmpty,
  }) {
    return ParentTutorConnectionModel(
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
      tutorBio: tutorBio ?? this.tutorBio,
      tutorSubjects: tutorSubjects ?? this.tutorSubjects,
      parentId: parentId ?? this.parentId,
      parentEmail: parentEmail ?? this.parentEmail,
      parentFirstName: parentFirstName ?? this.parentFirstName,
      parentLastName: parentLastName ?? this.parentLastName,
      parentEnrollmentStatus:
          parentEnrollmentStatus ?? this.parentEnrollmentStatus,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      children: children ?? this.children,
      connectionDate: connectionDate ?? this.connectionDate,
      isEmpty: isEmpty ?? this.isEmpty,
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
      'tutorBio': tutorBio,
      'tutorSubjects': tutorSubjects?.map((x) => x.toMap()).toList(),
      'parentId': parentId,
      'parentEmail': parentEmail,
      'parentFirstName': parentFirstName,
      'parentLastName': parentLastName,
      'parentEnrollmentStatus': parentEnrollmentStatus?.toMap(),
      'profileImageUrl': profileImageUrl,
      'children': children?.map((x) => x.toMap()).toList(),
      'connectionDate': connectionDate?.millisecondsSinceEpoch,
      'isEmpty': isEmpty,
    };
  }

  factory ParentTutorConnectionModel.fromMap(Map<String, dynamic> map) {
    const staticType = EnrollmentStatusType.unknown;

    return ParentTutorConnectionModel(
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
      tutorBio: map['tutorBio'],
      tutorSubjects: map['tutorSubjects'] != null
          ? List<SubjectModel>.from(
              map['tutorSubjects']?.map((x) => SubjectModel.fromMap(x)))
          : null,
      parentId: map['parentId'],
      parentEmail: map['parentEmail'],
      parentFirstName: map['parentFirstName'],
      parentLastName: map['parentLastName'],
      parentEnrollmentStatus: map['parentEnrollmentStatus'] != null
          ? staticType.fromMap(map['parentEnrollmentStatus'])
          : null,
      profileImageUrl: map['profileImageUrl'],
      children: map['children'] != null
          ? List<ChildRegistrationModel>.from(
              map['children']?.map((x) => ChildRegistrationModel.fromMap(x)))
          : null,
      connectionDate: map['connectionDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['connectionDate'])
          : null,
      isEmpty: map['isEmpty'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParentTutorConnectionModel.fromJson(String source) =>
      ParentTutorConnectionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ParentTutorConnectionModel(id: $id, tutorId: $tutorId, tutorEmail: $tutorEmail, tutorFirstName: $tutorFirstName, tutorLastName: $tutorLastName, tutorPhoneNumber: $tutorPhoneNumber, tutorStudioName: $tutorStudioName, tutorStudioAddress: $tutorStudioAddress, tutorProfileImageUrl: $tutorProfileImageUrl, tutorZoomMeetingUrl: $tutorZoomMeetingUrl, tutorBio: $tutorBio, tutorSubjects: $tutorSubjects, parentId: $parentId, parentEmail: $parentEmail, parentFirstName: $parentFirstName, parentLastName: $parentLastName, parentEnrollmentStatus: $parentEnrollmentStatus, profileImageUrl: $profileImageUrl, children: $children, connectionDate: $connectionDate, isEmpty: $isEmpty)';
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
      tutorBio,
      tutorSubjects,
      parentId,
      parentEmail,
      parentFirstName,
      parentLastName,
      parentEnrollmentStatus,
      profileImageUrl,
      children,
      connectionDate,
      isEmpty,
    ];
  }
}
