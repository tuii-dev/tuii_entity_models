import 'dart:convert';

import 'package:equatable/equatable.dart';

class ZoomAccountDetailsModel extends Equatable {
  final String? id;
  final String? picUrl;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? roleName;
  final String? personalMeetingUrl;
  final String? timezone;
  final String? createdAt;
  final String? lastLoginTime;
  final String? language;
  final String? status;

  const ZoomAccountDetailsModel({
    this.id,
    this.picUrl,
    this.firstName,
    this.lastName,
    this.email,
    this.roleName,
    this.personalMeetingUrl,
    this.timezone,
    this.createdAt,
    this.lastLoginTime,
    this.language,
    this.status,
  });

  ZoomAccountDetailsModel copyWith({
    String? id,
    String? picUrl,
    String? firstName,
    String? lastName,
    String? email,
    String? roleName,
    String? personalMeetingUrl,
    String? timezone,
    String? createdAt,
    String? lastLoginTime,
    String? language,
    String? status,
  }) {
    return ZoomAccountDetailsModel(
      id: id ?? this.id,
      picUrl: picUrl ?? this.picUrl,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      roleName: roleName ?? this.roleName,
      personalMeetingUrl: personalMeetingUrl ?? this.personalMeetingUrl,
      timezone: timezone ?? this.timezone,
      createdAt: createdAt ?? this.createdAt,
      lastLoginTime: lastLoginTime ?? this.lastLoginTime,
      language: language ?? this.language,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pic_url': picUrl,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'role_name': roleName,
      'personal_meeting_url': personalMeetingUrl,
      'timezone': timezone,
      'created_at': createdAt,
      'last_login_time': lastLoginTime,
      'language': language,
      'status': status,
    };
  }

  factory ZoomAccountDetailsModel.fromMap(Map<String, dynamic> map) {
    return ZoomAccountDetailsModel(
      id: map['id'],
      picUrl: map['pic_url'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      email: map['email'],
      roleName: map['role_name'],
      personalMeetingUrl: map['personal_meeting_url'],
      timezone: map['timezone'],
      createdAt: map['created_at'],
      lastLoginTime: map['last_login_time'],
      language: map['language'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ZoomAccountDetailsModel.fromJson(String source) =>
      ZoomAccountDetailsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ZoomAccountDetailsModel(id: $id, picUrl: $picUrl, firstName: $firstName, lastName: $lastName, email: $email, roleName: $roleName, personalMeetingUrl: $personalMeetingUrl, timezone: $timezone, createdAt: $createdAt, lastLoginTime: $lastLoginTime, language: $language, status: $status)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      picUrl,
      firstName,
      lastName,
      email,
      roleName,
      personalMeetingUrl,
      timezone,
      createdAt,
      lastLoginTime,
      language,
      status,
    ];
  }
}
