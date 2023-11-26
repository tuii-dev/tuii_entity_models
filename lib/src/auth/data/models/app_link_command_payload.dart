import 'dart:convert';

import 'package:equatable/equatable.dart';

class AppLinkCommandPayload extends Equatable {
  final String? learnerEmail;
  final String? learnerFirstName;
  final String? learnerLastName;

  const AppLinkCommandPayload({
    this.learnerEmail,
    this.learnerFirstName,
    this.learnerLastName,
  });

  AppLinkCommandPayload copyWith({
    String? learnerEmail,
    String? learnerFirstName,
    String? learnerLastName,
  }) {
    return AppLinkCommandPayload(
      learnerEmail: learnerEmail ?? this.learnerEmail,
      learnerFirstName: learnerFirstName ?? this.learnerFirstName,
      learnerLastName: learnerLastName ?? this.learnerLastName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'learnerEmail': learnerEmail,
      'learnerFirstName': learnerFirstName,
      'learnerLastName': learnerLastName,
    };
  }

  factory AppLinkCommandPayload.fromMap(Map<String, dynamic> map) {
    return AppLinkCommandPayload(
      learnerEmail: map['learnerEmail'],
      learnerFirstName: map['learnerFirstName'],
      learnerLastName: map['learnerLastName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppLinkCommandPayload.fromJson(String source) =>
      AppLinkCommandPayload.fromMap(json.decode(source));

  @override
  String toString() =>
      'AppLinkCommandPayload(learnerEmail: $learnerEmail, learnerFirstName: $learnerFirstName, learnerLastName: $learnerLastName)';

  @override
  List<Object?> get props => [learnerEmail, learnerFirstName, learnerLastName];
}
