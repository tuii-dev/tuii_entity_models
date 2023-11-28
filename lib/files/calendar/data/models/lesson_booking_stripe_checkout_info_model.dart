import 'dart:convert';

import 'package:equatable/equatable.dart';

class LessonBookingStripeCheckoutInfoModel extends Equatable {
  final String? checkoutSessionId;
  final String? paymentIntentId;
  const LessonBookingStripeCheckoutInfoModel({
    this.checkoutSessionId,
    this.paymentIntentId,
  });

  LessonBookingStripeCheckoutInfoModel copyWith({
    String? checkoutSessionId,
    String? paymentIntentId,
  }) {
    return LessonBookingStripeCheckoutInfoModel(
      checkoutSessionId: checkoutSessionId ?? this.checkoutSessionId,
      paymentIntentId: paymentIntentId ?? this.paymentIntentId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'checkoutSessionId': checkoutSessionId,
      'paymentIntentId': paymentIntentId,
    };
  }

  factory LessonBookingStripeCheckoutInfoModel.fromMap(
      Map<String, dynamic> map) {
    return LessonBookingStripeCheckoutInfoModel(
      checkoutSessionId: map['checkoutSessionId'],
      paymentIntentId: map['paymentIntentId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonBookingStripeCheckoutInfoModel.fromJson(String source) =>
      LessonBookingStripeCheckoutInfoModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'LessonBookingStripeInfoModel(checkoutSessionId: $checkoutSessionId, paymentIntentId: $paymentIntentId)';

  @override
  List<Object?> get props => [checkoutSessionId, paymentIntentId];
}
