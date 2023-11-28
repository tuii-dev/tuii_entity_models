import 'dart:convert';

import 'package:equatable/equatable.dart';

class StripeGetAccountDetailsPayload extends Equatable {
  final String? accountId;
  const StripeGetAccountDetailsPayload({
    this.accountId,
  });

  StripeGetAccountDetailsPayload copyWith({
    String? accountId,
  }) {
    return StripeGetAccountDetailsPayload(
      accountId: accountId ?? this.accountId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'accountId': accountId,
    };
  }

  factory StripeGetAccountDetailsPayload.fromMap(Map<String, dynamic> map) {
    return StripeGetAccountDetailsPayload(
      accountId: map['accountId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StripeGetAccountDetailsPayload.fromJson(String source) =>
      StripeGetAccountDetailsPayload.fromMap(json.decode(source));

  @override
  String toString() => 'StripeGetAccountDetailsPayload(accountId: $accountId)';

  @override
  List<Object?> get props => [accountId];
}
