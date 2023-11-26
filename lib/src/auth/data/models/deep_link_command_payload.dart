import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:tuiicore/core/enums/deep_link_command_type.dart';

class DeepLinkCommandPayload extends Equatable {
  final DeepLinkCommandType? commandType;
  final String? entityId;
  final String? entityRole;

  const DeepLinkCommandPayload({
    this.commandType,
    this.entityId,
    this.entityRole,
  });

  DeepLinkCommandPayload copyWith({
    DeepLinkCommandType? commandType,
    String? entityId,
    String? entityRole,
  }) {
    return DeepLinkCommandPayload(
      commandType: commandType ?? this.commandType,
      entityId: entityId ?? this.entityId,
      entityRole: entityRole ?? this.entityRole,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'commandType': commandType?.toMap(),
      'entityId': entityId,
      'entityRole': entityRole,
    };
  }

  factory DeepLinkCommandPayload.fromMap(Map<String, dynamic> map) {
    const staticType = DeepLinkCommandType.unknown;
    return DeepLinkCommandPayload(
      commandType: map['commandType'] != null
          ? staticType.fromMap(map['commandType'])
          : null,
      entityId: map['entityId'],
      entityRole: map['entityRole'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DeepLinkCommandPayload.fromJson(String source) =>
      DeepLinkCommandPayload.fromMap(json.decode(source));

  @override
  String toString() =>
      'DeepLinkCommandPayload(commandType: $commandType, entityId: $entityId)';

  @override
  List<Object?> get props => [commandType, entityId, entityRole];
}
