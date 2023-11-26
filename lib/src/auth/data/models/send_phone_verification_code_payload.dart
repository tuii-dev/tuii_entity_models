import 'dart:convert';

import 'package:equatable/equatable.dart';

class SendPhoneVerificationCodePayloadModel extends Equatable {
  final String? uid;
  final String? phoneNumber;
  final String? code;

  const SendPhoneVerificationCodePayloadModel({
    this.uid,
    this.phoneNumber,
    this.code,
  });

  @override
  List<Object?> get props => [uid, phoneNumber, code];

  SendPhoneVerificationCodePayloadModel copyWith({
    String? uid,
    String? phoneNumber,
    String? code,
  }) {
    return SendPhoneVerificationCodePayloadModel(
      uid: uid ?? this.uid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'phoneNumber': phoneNumber,
      'code': code,
    };
  }

  factory SendPhoneVerificationCodePayloadModel.fromMap(
      Map<String, dynamic> map) {
    return SendPhoneVerificationCodePayloadModel(
      uid: map['uid'],
      phoneNumber: map['phoneNumber'],
      code: map['code'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SendPhoneVerificationCodePayloadModel.fromJson(String source) =>
      SendPhoneVerificationCodePayloadModel.fromMap(json.decode(source));
}
