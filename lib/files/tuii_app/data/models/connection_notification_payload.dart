import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:tuiientitymodels/files/classroom/data/models/subject_model.dart';
import 'package:tuiientitymodels/files/tuii_app/data/models/stream_channel_definition_payload.dart';
import 'package:tuiicore/core/enums/tuii_role_type.dart';

class ConnectNotificationPayload extends Equatable {
  final String senderAddress;
  final String senderBio;
  final TuiiRoleType senderRoleType;
  final List<SubjectModel> senderSubjects;
  final bool senderHasCustodian;
  final String senderCustodianId;
  final List<SubjectModel> receiverSubjects;
  final String receiverFirstName;
  final String receiverLastName;
  final String receiverProfileImageUrl;
  final StreamChannelDefinitionPayload streamChannelDefinition;

  const ConnectNotificationPayload({
    required this.senderAddress,
    required this.senderBio,
    required this.senderRoleType,
    required this.senderSubjects,
    required this.senderHasCustodian,
    required this.senderCustodianId,
    required this.receiverSubjects,
    required this.receiverFirstName,
    required this.receiverLastName,
    required this.receiverProfileImageUrl,
    required this.streamChannelDefinition,
  });

  ConnectNotificationPayload copyWith({
    String? senderAddress,
    String? senderBio,
    TuiiRoleType? senderRoleType,
    List<SubjectModel>? senderSubjects,
    bool? senderHasCustodian,
    String? senderCustodianId,
    List<SubjectModel>? receiverSubjects,
    String? receiverFirstName,
    String? receiverLastName,
    String? receiverProfileImageUrl,
    StreamChannelDefinitionPayload? streamChannelDefinition,
  }) {
    return ConnectNotificationPayload(
      senderAddress: senderAddress ?? this.senderAddress,
      senderBio: senderBio ?? this.senderBio,
      senderRoleType: senderRoleType ?? this.senderRoleType,
      senderSubjects: senderSubjects ?? this.senderSubjects,
      senderHasCustodian: senderHasCustodian ?? this.senderHasCustodian,
      senderCustodianId: senderCustodianId ?? this.senderCustodianId,
      receiverSubjects: receiverSubjects ?? this.receiverSubjects,
      receiverFirstName: receiverFirstName ?? this.receiverFirstName,
      receiverLastName: receiverLastName ?? this.receiverLastName,
      receiverProfileImageUrl:
          receiverProfileImageUrl ?? this.receiverProfileImageUrl,
      streamChannelDefinition:
          streamChannelDefinition ?? this.streamChannelDefinition,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderAddress': senderAddress,
      'senderBio': senderBio,
      'senderRoleType': senderRoleType.toMap(),
      'senderSubjects': senderSubjects.map((x) => x.toMap()).toList(),
      'senderHasCustodian': senderHasCustodian,
      'senderCustodianId': senderCustodianId,
      'receiverSubjects': receiverSubjects.map((x) => x.toMap()).toList(),
      'receiverFirstName': receiverFirstName,
      'receiverLastName': receiverLastName,
      'receiverProfileImageUrl': receiverProfileImageUrl,
      'streamChannelDefinition': streamChannelDefinition.toMap(),
    };
  }

  factory ConnectNotificationPayload.fromMap(Map<String, dynamic> map) {
    const staticType = TuiiRoleType.unknown;
    return ConnectNotificationPayload(
      senderAddress: map['senderAddress'] ?? '',
      senderBio: map['senderBio'] ?? '',
      senderRoleType: staticType.fromMap(map['senderRoleType'] ?? ''),
      senderSubjects: List<SubjectModel>.from(
          map['senderSubjects']?.map((x) => SubjectModel.fromMap(x))),
      senderHasCustodian: map['senderHasCustodian'] ?? false,
      senderCustodianId: map['senderCustodianId'],
      receiverSubjects: List<SubjectModel>.from(
          map['receiverSubjects']?.map((x) => SubjectModel.fromMap(x))),
      receiverFirstName: map['receiverFirstName'],
      receiverLastName: map['receiverLastName'],
      receiverProfileImageUrl: map['receiverProfileImageUrl'],
      streamChannelDefinition: StreamChannelDefinitionPayload.fromMap(
          map['streamChannelDefinition']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConnectNotificationPayload.fromJson(String source) =>
      ConnectNotificationPayload.fromMap(json.decode(source));

  @override
  String toString() =>
      'ConnectNotificationPayload(address: $senderAddress, bio: $senderBio, subjects: $senderSubjects)';

  @override
  List<Object> get props => [
        senderAddress,
        senderBio,
        senderRoleType,
        senderSubjects,
        senderHasCustodian,
        senderCustodianId,
        receiverSubjects,
        receiverFirstName,
        receiverLastName,
        receiverProfileImageUrl,
        streamChannelDefinition
      ];
}
