import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuiicore/core/enums/channel_type.dart';

class StripeCreateAccountPayloadModel extends Equatable {
  final String? tutorId;
  final String? tutorEmail;
  final String? tutorFirstName;
  final String? tutorLastName;
  final String? tutorUrl;
  final String? tutorCountryCode;
  final String? tutorCurrencyCode;
  final ChannelType? channel;

  const StripeCreateAccountPayloadModel({
    this.tutorId,
    this.tutorEmail,
    this.tutorFirstName,
    this.tutorLastName,
    this.tutorUrl,
    this.tutorCountryCode,
    this.tutorCurrencyCode,
    this.channel,
  });

  StripeCreateAccountPayloadModel copyWith({
    String? tutorId,
    String? tutorEmail,
    String? tutorFirstName,
    String? tutorLastName,
    String? tutorUrl,
    String? tutorCountryCode,
    String? tutorCurrencyCode,
    ChannelType? channel,
  }) {
    return StripeCreateAccountPayloadModel(
      tutorId: tutorId ?? this.tutorId,
      tutorEmail: tutorEmail ?? this.tutorEmail,
      tutorFirstName: tutorFirstName ?? this.tutorFirstName,
      tutorLastName: tutorLastName ?? this.tutorLastName,
      tutorUrl: tutorUrl ?? this.tutorUrl,
      tutorCountryCode: tutorCountryCode ?? this.tutorCountryCode,
      tutorCurrencyCode: tutorCurrencyCode ?? this.tutorCurrencyCode,
      channel: channel ?? this.channel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tutorId': tutorId,
      'tutorEmail': tutorEmail,
      'tutorFirstName': tutorFirstName,
      'tutorLastName': tutorLastName,
      'tutorUrl': tutorUrl,
      'tutorCountryCode': tutorCountryCode,
      'tutorCurrencyCode': tutorCurrencyCode,
      'channel': channel?.toMap(),
    };
  }

  factory StripeCreateAccountPayloadModel.fromMap(Map<String, dynamic> map) {
    return StripeCreateAccountPayloadModel(
      tutorId: map['tutorId'],
      tutorEmail: map['tutorEmail'],
      tutorFirstName: map['tutorFirstName'],
      tutorLastName: map['tutorLastName'],
      tutorUrl: map['tutorUrl'],
      tutorCountryCode: map['tutorCountryCode'],
      tutorCurrencyCode: map['tutorCurrencyCode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StripeCreateAccountPayloadModel.fromJson(String source) =>
      StripeCreateAccountPayloadModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StripeAccountPayloadModel(tutorId: $tutorId, tutorEmail: $tutorEmail, tutorFirstName: $tutorFirstName, tutorLastName: $tutorLastName)';
  }

  @override
  List<Object?> get props => [
        tutorId,
        tutorEmail,
        tutorFirstName,
        tutorLastName,
        tutorUrl,
        tutorCountryCode,
        tutorCurrencyCode,
        channel
      ];
}
