import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:tuiicore/core/enums/app_link_command_type.dart';

class AppLinkCommandModel extends Equatable {
  final String? key;
  final bool? expired;
  final AppLinkCommandType? type;
  final Map<String, dynamic>? payload;
  final bool? isEmpty;

  const AppLinkCommandModel({
    this.key,
    this.expired,
    this.type,
    this.payload,
    this.isEmpty = false,
  });

  factory AppLinkCommandModel.isEmpty() {
    return const AppLinkCommandModel(isEmpty: true);
  }

  AppLinkCommandModel copyWith({
    String? key,
    bool? expired,
    AppLinkCommandType? type,
    Map<String, dynamic>? payload,
  }) {
    return AppLinkCommandModel(
      key: key ?? this.key,
      expired: expired ?? this.expired,
      type: type ?? this.type,
      payload: payload ?? this.payload,
    );
  }

  AppLinkCommandModel clone() {
    return AppLinkCommandModel(
      key: key,
      expired: expired,
      type: type,
      payload: payload,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'expired': expired,
      'type': type?.toMap(),
      'payload': payload,
    };
  }

  factory AppLinkCommandModel.fromMap(Map<String, dynamic> map) {
    const staticType = AppLinkCommandType.unknown;

    return AppLinkCommandModel(
      key: map['key'],
      expired: map['expired'] ?? false,
      type: staticType.fromMap(map['type']),
      payload: Map<String, dynamic>.from(map['payload']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppLinkCommandModel.fromJson(String source) =>
      AppLinkCommandModel.fromMap(json.decode(source));

  @override
  String toString() => 'AppLinkCommand(type: $type, payload: $payload)';

  @override
  List<Object?> get props => [key, expired, type, payload, isEmpty];
}
