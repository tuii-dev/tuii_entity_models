import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:tuiicore/core/enums/enums.dart';
import 'package:tuiicore/core/models/lesson_configuration.dart';
import 'package:tuiicore/core/models/lesson_time_segment_configuration.dart';
import 'package:tuiicore/core/models/stripe_product_model.dart';
import 'package:uuid/uuid.dart';

class SubjectRateModel extends Equatable {
  final String subject;
  final LessonDeliveryType deliveryMode;
  final int lengthInMins;
  final bool publicAdvertise;
  final bool studentSelfService;
  final bool enabled;
  final StripeProduct? product;
  final double? price;

  // Stripe price changes
  final double? undoCost;
  final int? index;
  final String? lessonConfigurationId;

  const SubjectRateModel({
    required this.subject,
    required this.deliveryMode,
    required this.lengthInMins,
    required this.publicAdvertise,
    required this.studentSelfService,
    required this.enabled,
    this.price,
    this.product,
    this.undoCost,
    this.index,
    this.lessonConfigurationId,
  });

  @override
  List<Object?> get props {
    return [
      subject,
      deliveryMode,
      lengthInMins,
      price,
      publicAdvertise,
      studentSelfService,
      enabled,
      product,
      undoCost,
      index,
      lessonConfigurationId,
    ];
  }

  SubjectRateModel copyWith({
    String? subject,
    LessonDeliveryType? deliveryMode,
    int? lengthInMins,
    double? price,
    bool? publicAdvertise,
    bool? studentSelfService,
    bool? enabled,
    StripeProduct? product,
    double? undoCost,
    int? index,
    String? lessonConfigurationId,
  }) {
    return SubjectRateModel(
      subject: subject ?? this.subject,
      deliveryMode: deliveryMode ?? this.deliveryMode,
      lengthInMins: lengthInMins ?? this.lengthInMins,
      price: price ?? this.price,
      publicAdvertise: publicAdvertise ?? this.publicAdvertise,
      studentSelfService: studentSelfService ?? this.studentSelfService,
      enabled: enabled ?? this.enabled,
      product: product ?? this.product,
      undoCost: undoCost ?? this.undoCost,
      index: index ?? this.index,
      lessonConfigurationId:
          lessonConfigurationId ?? this.lessonConfigurationId,
    );
  }

  LessonConfiguration toLessonConfiguration() {
    return LessonConfiguration(
      id: lessonConfigurationId ?? const Uuid().v4(),
      cost: price ?? 0.0,
      defaultRule: false,
      subjects: [subject],
      deliveryModes: [deliveryMode],
      timeSegments: [
        LessonTimeSegmentConfiguration(
          minutes: lengthInMins,
          displayText: getTimeSegmentDisplayText(lengthInMins),
          defaultSegment: false,
        )
      ],
      product: product,
      undoCost: undoCost,
      enabled: enabled,
    );
  }

  LessonTimeSegmentConfiguration toLessonTimeSegmentConfiguration() {
    return LessonTimeSegmentConfiguration(
      minutes: lengthInMins,
      displayText: getTimeSegmentDisplayText(lengthInMins),
      defaultSegment: false,
    );
  }

  String getTimeSegmentDisplayText(int minutes) {
    if (minutes < 60) {
      return "${minutes}m";
    } else {
      int hours = (minutes / 60).floor();
      int mins = minutes % 60;
      if (mins > 0) {
        return "${hours}hr ${mins}m";
      } else {
        return "${hours}hr";
      }
    }
  }

  SubjectRateModel updatePriceBasedOnHourlyRate(double hourlyRate) {
    final hourlyRatio = lengthInMins / 60;
    final calculatedPrice =
        double.parse((hourlyRatio * hourlyRate).toStringAsFixed(2));

    return copyWith(price: calculatedPrice);
  }

  Map<String, dynamic> toMap() {
    return {
      'subject': subject,
      'deliveryMode': deliveryMode.toMap(),
      'lengthInMins': lengthInMins,
      'price': price,
      'publicAdvertise': publicAdvertise,
      'studentSelfService': studentSelfService,
      'product': product?.toMap(),
      'undoCost': undoCost,
      'enabled': enabled,
    };
  }

  factory SubjectRateModel.fromMap(Map<String, dynamic> map) {
    const staticType = LessonDeliveryType.unknown;
    return SubjectRateModel(
      subject: map['subject'] ?? '',
      deliveryMode: staticType.fromMap(map['deliveryMode']),
      lengthInMins: map['lengthInMins']?.toInt() ?? 0,
      price: map['price']?.toDouble() ?? 0.0,
      publicAdvertise: map['publicAdvertise'] ?? false,
      studentSelfService: map['studentSelfService'] ?? false,
      product: map['products'] != null
          ? StripeProduct.fromMap(map['products'])
          : null,
      undoCost: map['undoCost'],
      enabled: map['enabled'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectRateModel.fromJson(String source) =>
      SubjectRateModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubjectRateModel(subject: $subject, deliveryMode: $deliveryMode, lengthInMins: $lengthInMins, price: $price, publicAdvertise: $publicAdvertise, studentSelfService: $studentSelfService)';
  }
}
