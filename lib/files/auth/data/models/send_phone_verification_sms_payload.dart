import 'dart:convert';

import 'package:equatable/equatable.dart';

class SendPhoneVerificationSmsPayloadModel extends Equatable {
  final String? uid;
  final String? to;

  const SendPhoneVerificationSmsPayloadModel({
    this.to,
    this.uid,
  });

  @override
  List<Object?> get props => [uid, to];

  SendPhoneVerificationSmsPayloadModel copyWith({
    String? uid,
    String? to,
  }) {
    return SendPhoneVerificationSmsPayloadModel(
      uid: uid ?? this.uid,
      to: to ?? this.to,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'to': to,
    };
  }

  factory SendPhoneVerificationSmsPayloadModel.fromMap(
      Map<String, dynamic> map) {
    return SendPhoneVerificationSmsPayloadModel(
      uid: map['uid'],
      to: map['to'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SendPhoneVerificationSmsPayloadModel.fromJson(String source) =>
      SendPhoneVerificationSmsPayloadModel.fromMap(json.decode(source));
}
