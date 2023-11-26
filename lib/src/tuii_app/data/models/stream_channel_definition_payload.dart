import 'dart:convert';

import 'package:equatable/equatable.dart';

class StreamChannelDefinitionPayload extends Equatable {
  final String? channelId;
  final String? createdById;
  final List<String>? members;
  final StreamChannelDefinitionTuiiMetadataPayload? tuii;

  const StreamChannelDefinitionPayload({
    this.channelId,
    this.createdById,
    this.members,
    this.tuii,
  });

  StreamChannelDefinitionPayload copyWith({
    String? channelId,
    String? createdById,
    List<String>? members,
    StreamChannelDefinitionTuiiMetadataPayload? tuii,
  }) {
    return StreamChannelDefinitionPayload(
      channelId: channelId ?? this.channelId,
      createdById: createdById ?? this.createdById,
      members: members ?? this.members,
      tuii: tuii ?? this.tuii,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'channelId': channelId,
      'createdById': createdById,
      'members': members,
      'tuii': tuii?.toMap(),
    };
  }

  factory StreamChannelDefinitionPayload.fromMap(Map<String, dynamic> map) {
    return StreamChannelDefinitionPayload(
      channelId: map['channelId'],
      createdById: map['createdById'],
      members: List<String>.from(map['members']),
      tuii: map['tuii'] != null
          ? StreamChannelDefinitionTuiiMetadataPayload.fromMap(map['tuii'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StreamChannelDefinitionPayload.fromJson(String source) =>
      StreamChannelDefinitionPayload.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StreamChannelDefinitionPayload(channelId: $channelId, createdById: $createdById, members: $members, tuii: $tuii)';
  }

  @override
  List<Object?> get props => [channelId, createdById, members, tuii];
}

class StreamChannelDefinitionTuiiMetadataPayload extends Equatable {
  final StreamChannelDefinitionTutorMetadataPayload? tutor;
  final StreamChannelDefinitionStudentMetadataPayload? student;
  const StreamChannelDefinitionTuiiMetadataPayload({
    this.tutor,
    this.student,
  });

  StreamChannelDefinitionTuiiMetadataPayload copyWith({
    StreamChannelDefinitionTutorMetadataPayload? tutor,
    StreamChannelDefinitionStudentMetadataPayload? student,
  }) {
    return StreamChannelDefinitionTuiiMetadataPayload(
      tutor: tutor ?? this.tutor,
      student: student ?? this.student,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tutor': tutor?.toMap(),
      'student': student?.toMap(),
    };
  }

  factory StreamChannelDefinitionTuiiMetadataPayload.fromMap(
      Map<String, dynamic> map) {
    return StreamChannelDefinitionTuiiMetadataPayload(
      tutor: map['tutor'] != null
          ? StreamChannelDefinitionTutorMetadataPayload.fromMap(map['tutor'])
          : null,
      student: map['student'] != null
          ? StreamChannelDefinitionStudentMetadataPayload.fromMap(
              map['student'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StreamChannelDefinitionTuiiMetadataPayload.fromJson(String source) =>
      StreamChannelDefinitionTuiiMetadataPayload.fromMap(json.decode(source));

  @override
  String toString() =>
      'StreamChannelDefinitionTuiiMetadataPayload(tutor: $tutor, student: $student)';

  @override
  List<Object?> get props => [tutor, student];
}

class StreamChannelDefinitionTutorMetadataPayload extends Equatable {
  final String? id;
  final String? name;
  final String? profileImageUrl;
  const StreamChannelDefinitionTutorMetadataPayload({
    this.id,
    this.name,
    this.profileImageUrl,
  });

  StreamChannelDefinitionTutorMetadataPayload copyWith({
    String? id,
    String? name,
    String? profileImageUrl,
  }) {
    return StreamChannelDefinitionTutorMetadataPayload(
      id: id ?? this.id,
      name: name ?? this.name,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory StreamChannelDefinitionTutorMetadataPayload.fromMap(
      Map<String, dynamic> map) {
    return StreamChannelDefinitionTutorMetadataPayload(
      id: map['id'],
      name: map['name'],
      profileImageUrl: map['profileImageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StreamChannelDefinitionTutorMetadataPayload.fromJson(String source) =>
      StreamChannelDefinitionTutorMetadataPayload.fromMap(json.decode(source));

  @override
  String toString() =>
      'StreamChannelDefinitionTutorMetadataPayload(id: $id, name: $name, profileImageUrl: $profileImageUrl)';

  @override
  List<Object?> get props => [id, name, profileImageUrl];
}

class StreamChannelDefinitionStudentMetadataPayload extends Equatable {
  final String? id;
  final String? name;
  final String? profileImageUrl;
  final bool? hasCustodian;
  final String? custodianId;
  const StreamChannelDefinitionStudentMetadataPayload({
    this.id,
    this.name,
    this.profileImageUrl,
    this.hasCustodian,
    this.custodianId,
  });

  StreamChannelDefinitionStudentMetadataPayload copyWith({
    String? id,
    String? name,
    String? profileImageUrl,
    bool? hasCustodian,
    String? custodianId,
  }) {
    return StreamChannelDefinitionStudentMetadataPayload(
      id: id ?? this.id,
      name: name ?? this.name,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      hasCustodian: hasCustodian ?? this.hasCustodian,
      custodianId: custodianId ?? this.custodianId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'profileImageUrl': profileImageUrl,
      'hasCustodian': hasCustodian,
      'custodianId': custodianId,
    };
  }

  factory StreamChannelDefinitionStudentMetadataPayload.fromMap(
      Map<String, dynamic> map) {
    return StreamChannelDefinitionStudentMetadataPayload(
      id: map['id'],
      name: map['name'],
      profileImageUrl: map['profileImageUrl'],
      hasCustodian: map['hasCustodian'],
      custodianId: map['custodianId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StreamChannelDefinitionStudentMetadataPayload.fromJson(
          String source) =>
      StreamChannelDefinitionStudentMetadataPayload.fromMap(
          json.decode(source));

  @override
  String toString() {
    return 'StreamChannelDefinitionStudentMetadataPayload(id: $id, name: $name, profileImageUrl: $profileImageUrl, hasCustodian: $hasCustodian, custodianId: $custodianId)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      profileImageUrl,
      hasCustodian,
      custodianId,
    ];
  }
}
