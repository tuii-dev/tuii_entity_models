import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/auth/data/models/child_registration_model.dart';
import 'package:tuii_entity_models/src/auth/data/models/parent_child_connection_model.dart';
import 'package:tuii_entity_models/src/classroom/data/models/subject_model.dart';
import 'package:tuii_entity_models/src/tuii_app/data/models/stream_channel_definition_payload.dart';
import 'package:tuiicore/core/enums/tuii_role_type.dart';

class ParentConnectNotificationPayload extends Equatable {
  final String senderAddress;
  final String senderBio;
  final TuiiRoleType senderRoleType;
  final List<SubjectModel> senderSubjects;
  final List<ChildRegistrationModel> children;
  final List<ParentChildConnectionModel> custodianConnections;
  final List<SubjectModel> receiverSubjects;
  final String receiverFirstName;
  final String receiverLastName;
  final String receiverProfileImageUrl;
  final String receiverBio;
  final String receiverAddress;
  final StreamChannelDefinitionPayload streamChannelDefinition;

  const ParentConnectNotificationPayload({
    required this.senderAddress,
    required this.senderBio,
    required this.senderRoleType,
    required this.senderSubjects,
    required this.children,
    required this.custodianConnections,
    required this.receiverSubjects,
    required this.receiverFirstName,
    required this.receiverLastName,
    required this.receiverProfileImageUrl,
    required this.receiverBio,
    required this.receiverAddress,
    required this.streamChannelDefinition,
  });

  ParentConnectNotificationPayload copyWith({
    String? senderAddress,
    String? senderBio,
    TuiiRoleType? senderRoleType,
    List<SubjectModel>? senderSubjects,
    List<ChildRegistrationModel>? children,
    List<ParentChildConnectionModel>? custodianConnections,
    List<SubjectModel>? receiverSubjects,
    String? receiverFirstName,
    String? receiverLastName,
    String? receiverProfileImageUrl,
    String? receiverBio,
    String? receiverAddress,
    StreamChannelDefinitionPayload? streamChannelDefinition,
  }) {
    return ParentConnectNotificationPayload(
      senderAddress: senderAddress ?? this.senderAddress,
      senderBio: senderBio ?? this.senderBio,
      senderRoleType: senderRoleType ?? this.senderRoleType,
      senderSubjects: senderSubjects ?? this.senderSubjects,
      children: children ?? this.children,
      custodianConnections: custodianConnections ?? this.custodianConnections,
      receiverSubjects: receiverSubjects ?? this.receiverSubjects,
      receiverFirstName: receiverFirstName ?? this.receiverFirstName,
      receiverLastName: receiverLastName ?? this.receiverLastName,
      receiverProfileImageUrl:
          receiverProfileImageUrl ?? this.receiverProfileImageUrl,
      receiverBio: receiverBio ?? this.receiverBio,
      receiverAddress: receiverAddress ?? this.receiverAddress,
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
      'children': children.map((x) => x.toMap()).toList(),
      'custodianConnections':
          custodianConnections.map((x) => x.toMap()).toList(),
      'receiverSubjects': receiverSubjects.map((x) => x.toMap()).toList(),
      'receiverFirstName': receiverFirstName,
      'receiverLastName': receiverLastName,
      'receiverProfileImageUrl': receiverProfileImageUrl,
      'receiverBio': receiverBio,
      'receiverAddress': receiverAddress,
      'streamChannelDefinition': streamChannelDefinition.toMap(),
    };
  }

  factory ParentConnectNotificationPayload.fromMap(Map<String, dynamic> map) {
    const staticType = TuiiRoleType.unknown;
    return ParentConnectNotificationPayload(
      senderAddress: map['senderAddress'] ?? '',
      senderBio: map['senderBio'] ?? '',
      senderRoleType: staticType.fromMap(map['senderRoleType'] ?? ''),
      senderSubjects: List<SubjectModel>.from(
          map['senderSubjects']?.map((x) => SubjectModel.fromMap(x))),
      children: List<ChildRegistrationModel>.from(
          map['children']?.map((x) => ChildRegistrationModel.fromMap(x))),
      custodianConnections: List<ParentChildConnectionModel>.from(
          map['custodianConnections']
              .map((x) => ParentChildConnectionModel.fromMap(x))),
      receiverSubjects: List<SubjectModel>.from(
          map['receiverSubjects']?.map((x) => SubjectModel.fromMap(x))),
      receiverFirstName: map['receiverFirstName'],
      receiverLastName: map['receiverLastName'],
      receiverProfileImageUrl: map['receiverProfileImageUrl'],
      receiverBio: map['receiverBio'],
      receiverAddress: map['receiverAddress'],
      streamChannelDefinition: StreamChannelDefinitionPayload.fromMap(
          map['streamChannelDefinition']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ParentConnectNotificationPayload.fromJson(String source) =>
      ParentConnectNotificationPayload.fromMap(json.decode(source));

  @override
  String toString() =>
      'ConnectNotificationPayload(address: $senderAddress, bio: $senderBio, subjects: $senderSubjects)';

  @override
  List<Object?> get props => [
        senderAddress,
        senderBio,
        senderRoleType,
        senderSubjects,
        children,
        custodianConnections,
        receiverSubjects,
        receiverFirstName,
        receiverLastName,
        receiverProfileImageUrl,
        receiverBio,
        receiverAddress,
        streamChannelDefinition,
      ];
}
