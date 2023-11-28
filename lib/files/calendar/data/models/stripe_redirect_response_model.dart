import 'dart:convert';

import 'package:equatable/equatable.dart';

class StripeRedirectResponse extends Equatable {
  final String? url;
  const StripeRedirectResponse({
    this.url,
  });

  StripeRedirectResponse copyWith({
    String? url,
  }) {
    return StripeRedirectResponse(
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  factory StripeRedirectResponse.fromMap(Map<String, dynamic> map) {
    return StripeRedirectResponse(
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StripeRedirectResponse.fromJson(String source) =>
      StripeRedirectResponse.fromMap(json.decode(source));

  @override
  String toString() => 'StripeRedirectResponse(url: $url)';

  @override
  List<Object?> get props => [url];
}
