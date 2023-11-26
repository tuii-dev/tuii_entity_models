import 'dart:convert';

import 'package:equatable/equatable.dart';

class LessonBookingRefundAdjustmentStateModel extends Equatable {
  final double? paidPlatformFees;
  final int? paidNumberOfLessons;
  final double? paidPlatformTransactionFee;
  final double? paidPlatformPercentageRate;

  const LessonBookingRefundAdjustmentStateModel({
    this.paidPlatformFees,
    this.paidNumberOfLessons,
    this.paidPlatformTransactionFee,
    this.paidPlatformPercentageRate,
  });

  LessonBookingRefundAdjustmentStateModel copyWith({
    double? paidPlatformFees,
    int? paidNumberOfLessons,
    double? paidPlatformTransactionFee,
    double? paidPlatformPercentageRate,
  }) {
    return LessonBookingRefundAdjustmentStateModel(
      paidPlatformFees: paidPlatformFees ?? this.paidPlatformFees,
      paidNumberOfLessons: paidNumberOfLessons ?? this.paidNumberOfLessons,
      paidPlatformTransactionFee:
          paidPlatformTransactionFee ?? this.paidPlatformTransactionFee,
      paidPlatformPercentageRate:
          paidPlatformPercentageRate ?? this.paidPlatformPercentageRate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'paidPlatformFees': paidPlatformFees,
      'paidNumberOfLessons': paidNumberOfLessons,
      'paidPlatformTransactionFee': paidPlatformTransactionFee,
      'paidPlatformPercentageRate': paidPlatformPercentageRate,
    };
  }

  factory LessonBookingRefundAdjustmentStateModel.fromMap(
      Map<String, dynamic> map) {
    return LessonBookingRefundAdjustmentStateModel(
      paidPlatformFees: map['paidPlatformFees']?.toDouble(),
      paidNumberOfLessons: map['paidNumberOfLessons']?.toInt(),
      paidPlatformTransactionFee: map['paidPlatformTransactionFee']?.toDouble(),
      paidPlatformPercentageRate: map['paidPlatformPercentageRate']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonBookingRefundAdjustmentStateModel.fromJson(String source) =>
      LessonBookingRefundAdjustmentStateModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'LessonBookingRefundStateModel(paidPlatformFees: $paidPlatformFees, paidNumberOfLessons: $paidNumberOfLessons)';

  @override
  List<Object?> get props => [
        paidPlatformFees,
        paidNumberOfLessons,
        paidPlatformTransactionFee,
        paidPlatformPercentageRate,
      ];
}
