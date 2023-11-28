import 'dart:convert';

import 'package:equatable/equatable.dart';

class AddMessageModel extends Equatable {
  final String? channelId;
  final String? userId;
  final String? message;

  const AddMessageModel({
    this.channelId,
    this.userId,
    this.message,
  });

  AddMessageModel copyWith({
    String? channelId,
    String? userId,
    String? message,
  }) {
    return AddMessageModel(
      channelId: channelId ?? this.channelId,
      userId: userId ?? this.userId,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'channelId': channelId,
      'userId': userId,
      'message': message,
    };
  }

  factory AddMessageModel.fromMap(Map<String, dynamic> map) {
    return AddMessageModel(
      channelId: map['channelId'],
      userId: map['userId'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddMessageModel.fromJson(String source) =>
      AddMessageModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AddMessageModel(channelId: $channelId, userId: $userId, message: $message)';

  @override
  List<Object?> get props => [channelId, userId, message];
}
