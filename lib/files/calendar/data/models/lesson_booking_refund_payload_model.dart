import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:tuiicore/core/enums/lesson_booking_refund_type.dart';
import 'package:tuiicore/core/models/stripe_dynamic_line_item.dart';
import 'package:tuiicore/core/models/stripe_product_line_item_model.dart';

class LessonBookingRefundPayload extends Equatable {
  final String? paymentIntent;
  final String? bookingId;
  final String? studentId;
  final String? tutorId;
  final String? tutorAccountId;
  final LessonBookingRefundType? refundType;
  final List<StripeProductLineItem>? lessonLineItems;
  final List<StripeDynamicLineItem>? additionalCosts;
  final double? amount;
  final double? tutorNetRefundedAmount;
  final String? paidBookingId;
  final double? taxRate;
  final String? taxLabel;
  final String? countryCode;
  final String? currencyCode;
  final String? currencySymbol;
  final double? platformTransactionFee;
  final double? platformPercentageRate;

  const LessonBookingRefundPayload({
    this.paymentIntent,
    this.bookingId,
    this.studentId,
    this.tutorId,
    this.tutorAccountId,
    this.refundType,
    this.lessonLineItems,
    this.additionalCosts,
    this.amount,
    this.tutorNetRefundedAmount,
    this.paidBookingId,
    this.taxRate,
    this.taxLabel,
    this.countryCode,
    this.currencyCode,
    this.currencySymbol,
    this.platformTransactionFee,
    this.platformPercentageRate,
  });

  LessonBookingRefundPayload copyWith({
    String? paymentIntent,
    String? bookingId,
    String? studentId,
    String? tutorId,
    String? tutorAccountId,
    LessonBookingRefundType? refundType,
    List<StripeProductLineItem>? lessonLineItems,
    List<StripeDynamicLineItem>? additionalCosts,
    double? amount,
    double? tutorNetRefundedAmount,
    String? paidBookingId,
    double? taxRate,
    String? taxLabel,
    String? countryCode,
    String? currencyCode,
    String? currencySymbol,
    double? platformTransactionFee,
    double? platformPercentageRate,
  }) {
    return LessonBookingRefundPayload(
      paymentIntent: paymentIntent ?? this.paymentIntent,
      bookingId: bookingId ?? this.bookingId,
      studentId: studentId ?? this.studentId,
      tutorId: tutorId ?? this.tutorId,
      tutorAccountId: tutorAccountId ?? this.tutorAccountId,
      refundType: refundType ?? this.refundType,
      lessonLineItems: lessonLineItems ?? this.lessonLineItems,
      additionalCosts: additionalCosts ?? this.additionalCosts,
      amount: amount ?? this.amount,
      tutorNetRefundedAmount:
          tutorNetRefundedAmount ?? this.tutorNetRefundedAmount,
      paidBookingId: paidBookingId ?? this.paidBookingId,
      taxRate: taxRate ?? this.taxRate,
      taxLabel: taxLabel ?? this.taxLabel,
      countryCode: countryCode ?? this.countryCode,
      currencyCode: currencyCode ?? this.currencyCode,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      platformTransactionFee:
          platformTransactionFee ?? this.platformTransactionFee,
      platformPercentageRate:
          platformPercentageRate ?? this.platformPercentageRate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'paymentIntent': paymentIntent,
      'bookingId': bookingId,
      'studentId': studentId,
      'tutorId': tutorId,
      'tutorAccountId': tutorAccountId,
      'refundType': refundType?.toMap(),
      'lessonLineItems': lessonLineItems?.map((x) => x.toMap()).toList(),
      'additionalCosts': additionalCosts?.map((x) => x.toMap()).toList(),
      'amount': amount,
      'tutorNetRefundedAmount': tutorNetRefundedAmount,
      'paidBookingId': paidBookingId,
      'taxRate': taxRate,
      'taxLabel': taxLabel,
      'countryCode': countryCode,
      'currencyCode': currencyCode,
      'currencySymbol': currencySymbol,
      'platformTransactionFee': platformTransactionFee,
      'platformPercentageRate': platformPercentageRate,
    };
  }

  factory LessonBookingRefundPayload.fromMap(Map<String, dynamic> map) {
    const staticType = LessonBookingRefundType.unknown;
    return LessonBookingRefundPayload(
      paymentIntent: map['paymentIntent'],
      bookingId: map['bookingId'],
      studentId: map['studentId'],
      tutorId: map['tutorId'],
      tutorAccountId: map['tutorAccountId'],
      refundType: staticType.fromMap(map['refundType']),
      lessonLineItems: map['lessonLineItems'] != null
          ? List<StripeProductLineItem>.from(map['lessonLineItems']
              ?.map((x) => StripeProductLineItem.fromMap(x)))
          : [],
      additionalCosts: map['additionalCosts'] != null
          ? List<StripeDynamicLineItem>.from(map['additionalCosts']
              ?.map((x) => StripeDynamicLineItem.fromMap(x)))
          : [],
      amount: map['amount']?.toDouble(),
      tutorNetRefundedAmount: map['tutorNetRefundedAmount']?.toDouble(),
      paidBookingId: map['paidBookingId'],
      taxRate: map['taxRate'],
      taxLabel: map['taxLabel'],
      countryCode: map['countryCode'],
      currencyCode: map['countryCode'],
      currencySymbol: map['currencySymbol'],
      platformTransactionFee: map['platformTransactionFee'],
      platformPercentageRate: map['platformPercentageRate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonBookingRefundPayload.fromJson(String source) =>
      LessonBookingRefundPayload.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LessonBookingRefundPayload(paymentIntent: $paymentIntent, bookingId: $bookingId, studentId: $studentId, tutorId: $tutorId, tutorAccountId: $tutorAccountId, lessonLineItems: $lessonLineItems, amount: $amount)';
  }

  @override
  List<Object?> get props {
    return [
      paymentIntent,
      bookingId,
      studentId,
      tutorId,
      tutorAccountId,
      refundType,
      lessonLineItems,
      additionalCosts,
      amount,
      tutorNetRefundedAmount,
      paidBookingId,
      taxRate,
      taxLabel,
      countryCode,
      currencyCode,
      currencySymbol,
      platformTransactionFee,
    ];
  }
}
