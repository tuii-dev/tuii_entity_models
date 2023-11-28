import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuiicore/core/common/discount_description_model.dart';

class LessonBookingLineItemModel extends Equatable {
  final String? bookingId;
  final String? subject;
  final String? deliveryMode;
  final String? lengthText;
  final double? costOfLesson;
  final double? discountedCostOfLesson;
  final String? stripePriceId;
  final DiscountDescriptionModel? discountDescription;

  const LessonBookingLineItemModel({
    this.bookingId,
    this.subject,
    this.deliveryMode,
    this.lengthText,
    this.costOfLesson,
    this.discountedCostOfLesson,
    this.stripePriceId,
    this.discountDescription,
  });

  @override
  List<Object?> get props {
    return [
      bookingId,
      subject,
      deliveryMode,
      lengthText,
      costOfLesson,
      discountedCostOfLesson,
      stripePriceId,
      discountDescription,
    ];
  }

  LessonBookingLineItemModel copyWith({
    String? bookingId,
    String? subject,
    String? deliveryMode,
    String? lengthText,
    double? costOfLesson,
    double? discountedCostOfLesson,
    String? stripePriceId,
    DiscountDescriptionModel? discountDescription,
  }) {
    return LessonBookingLineItemModel(
      bookingId: bookingId ?? this.bookingId,
      subject: subject ?? this.subject,
      deliveryMode: deliveryMode ?? this.deliveryMode,
      lengthText: lengthText ?? this.lengthText,
      costOfLesson: costOfLesson ?? this.costOfLesson,
      discountedCostOfLesson:
          discountedCostOfLesson ?? this.discountedCostOfLesson,
      stripePriceId: stripePriceId ?? this.stripePriceId,
      discountDescription: discountDescription ?? this.discountDescription,
    );
  }

  LessonBookingLineItemModel removeDiscount() {
    return LessonBookingLineItemModel(
      bookingId: bookingId,
      subject: subject,
      deliveryMode: deliveryMode,
      lengthText: lengthText,
      costOfLesson: costOfLesson,
      stripePriceId: stripePriceId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bookingId': bookingId,
      'subject': subject,
      'deliveryMode': deliveryMode,
      'lengthText': lengthText,
      'costOfLesson': costOfLesson,
      'discountedCostOfLesson': discountedCostOfLesson,
      'stripePriceId': stripePriceId,
      'discountDescription': discountDescription?.toMap(),
    };
  }

  factory LessonBookingLineItemModel.fromMap(Map<String, dynamic> map) {
    return LessonBookingLineItemModel(
      bookingId: map['bookingId'],
      subject: map['subject'],
      deliveryMode: map['deliveryMode'],
      lengthText: map['lengthText'],
      costOfLesson: map['costOfLesson']?.toDouble(),
      discountedCostOfLesson: map['discountedCostOfLesson']?.toDouble(),
      stripePriceId: map['stripePriceId'] ?? '',
      discountDescription: map['discountDescription'] != null
          ? DiscountDescriptionModel.fromMap(map['discountDescription'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonBookingLineItemModel.fromJson(String source) =>
      LessonBookingLineItemModel.fromMap(json.decode(source));
}
