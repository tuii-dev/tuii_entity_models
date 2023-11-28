import 'dart:convert';

import 'package:equatable/equatable.dart';

class CreateStreamTokenResponse extends Equatable {
  final String? streamToken;
  const CreateStreamTokenResponse({
    this.streamToken,
  });

  CreateStreamTokenResponse copyWith({
    String? streamToken,
  }) {
    return CreateStreamTokenResponse(
      streamToken: streamToken ?? this.streamToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'streamToken': streamToken,
    };
  }

  factory CreateStreamTokenResponse.fromMap(Map<String, dynamic> map) {
    return CreateStreamTokenResponse(
      streamToken: map['streamToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateStreamTokenResponse.fromJson(String source) =>
      CreateStreamTokenResponse.fromMap(json.decode(source));

  @override
  String toString() => 'CreateStreamTokenResponse(streamToken: $streamToken)';

  @override
  List<Object?> get props => [streamToken];
}
