import 'dart:convert';

import 'package:equatable/equatable.dart';

class ParentChildConnectionModel extends Equatable {
  final String tutorId;
  final List<String> connectedChildIds;
  const ParentChildConnectionModel({
    required this.tutorId,
    required this.connectedChildIds,
  });

  ParentChildConnectionModel copyWith({
    String? tutorId,
    List<String>? connectedChildIds,
  }) {
    return ParentChildConnectionModel(
      tutorId: tutorId ?? this.tutorId,
      connectedChildIds: connectedChildIds ?? this.connectedChildIds,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tutorId': tutorId,
      'connectedChildIds': connectedChildIds,
    };
  }

  factory ParentChildConnectionModel.fromMap(Map<String, dynamic> map) {
    return ParentChildConnectionModel(
      tutorId: map['tutorId'] ?? '',
      connectedChildIds: List<String>.from(map['connectedChildIds']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ParentChildConnectionModel.fromJson(String source) =>
      ParentChildConnectionModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ParentChildConnectionModel(tutorId: $tutorId, connectedChildIds: $connectedChildIds)';

  @override
  List<Object> get props => [tutorId, connectedChildIds];
}
