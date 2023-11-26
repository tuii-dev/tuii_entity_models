import 'dart:convert';

import 'package:equatable/equatable.dart';

class ZoomTokenPayloadModel extends Equatable {
  final String? tutorId;
  final String? token;
  const ZoomTokenPayloadModel({
    this.tutorId,
    this.token,
  });

  ZoomTokenPayloadModel copyWith({
    String? tutorId,
    String? token,
  }) {
    return ZoomTokenPayloadModel(
      tutorId: tutorId ?? this.tutorId,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tutorId': tutorId,
      'token': token,
    };
  }

  factory ZoomTokenPayloadModel.fromMap(Map<String, dynamic> map) {
    return ZoomTokenPayloadModel(
      tutorId: map['tutorId'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ZoomTokenPayloadModel.fromJson(String source) =>
      ZoomTokenPayloadModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ZoomTokenPayloadModel(tutorId: $tutorId, token: $token,)';
  }

  @override
  List<Object?> get props => [
        tutorId,
        token,
      ];
}
