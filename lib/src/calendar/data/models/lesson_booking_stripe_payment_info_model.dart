import 'dart:convert';

import 'package:equatable/equatable.dart';

class LessonBookingStripePaymentInfoModel extends Equatable {
  final String? paymentIntentId;
  final String? receiptUrl;
  const LessonBookingStripePaymentInfoModel({
    this.paymentIntentId,
    this.receiptUrl,
  });

  LessonBookingStripePaymentInfoModel copyWith({
    String? paymentIntentId,
    String? receiptUrl,
  }) {
    return LessonBookingStripePaymentInfoModel(
      paymentIntentId: paymentIntentId ?? this.paymentIntentId,
      receiptUrl: receiptUrl ?? this.receiptUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'paymentIntentId': paymentIntentId,
      'receiptUrl': receiptUrl,
    };
  }

  factory LessonBookingStripePaymentInfoModel.fromMap(
      Map<String, dynamic> map) {
    return LessonBookingStripePaymentInfoModel(
      paymentIntentId: map['paymentIntentId'],
      receiptUrl: map['receiptUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonBookingStripePaymentInfoModel.fromJson(String source) =>
      LessonBookingStripePaymentInfoModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'LessonBookingStripePaymentInfoModel(paymentIntentId: $paymentIntentId, receiptUrl: $receiptUrl)';

  @override
  List<Object?> get props => [paymentIntentId, receiptUrl];
}
