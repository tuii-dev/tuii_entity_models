import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tuii_entity_models/src/auth/domain/entities/user.dart';
import 'package:tuii_entity_models/src/calendar/data/models/lesson_booking_line_item_model.dart';
import 'package:tuii_entity_models/src/calendar/data/models/lesson_booking_payout_model.dart';
import 'package:tuii_entity_models/src/tuii_app/data/models/system_config_model.dart';
import 'package:tuiicore/core/common/common.dart';
import 'package:tuiicore/core/common/core_i18n.dart';
import 'package:tuiicore/core/enums/discount_type.dart';

import 'package:tuiicore/core/enums/lesson_booking_discount_type.dart';
import 'package:tuiicore/core/enums/lesson_booking_refund_type.dart';
import 'package:tuiicore/core/models/stripe_dynamic_line_item.dart';

class LessonBookingCostStructure extends Equatable {
  // Header fields

  // Summation of all booked lessons
  final double? totalLessonCost;

  // Summation of all additional costs
  final double? totalAdditionalCosts;

  // Summation of all booked lessons minus discount
  final double? discountedTotalCost;

  // Total Lesson Cost + PlatformFee
  final double? taxableSubTotalAmount;

  // Total Lesson Cost + PlatformFee
  final double? subTotalAmount;

  // Sub Total Amount * Tax Rate
  final double? totalTaxes;

  // Sub Total Amount Plus Taxes
  final double? totalAmount;

  // Total Lesson Cost - Tutor Platform Fee
  // THIS GETS DEPOSITED IN TUTOR ACCOUNT
  final double? tutorNetIncome;

  // Number Lessons * Configurable platformRatePerLesson
  // THIS GETS DEPOSITED IN TUII ACCOUNT
  final double? platformFees;

  // Configurable Tax Rate
  final double? taxRate;

  // Configurable Tax Label
  final String? taxLabel;

  final String? countryCode;

  final String? currencyCode;

  final String? currencySymbol;

  // Configurable Platform Transaction Fee
  final double? platformTransactionFee;

  // Configurable Platform Percentage Rate
  final double? platformPercentageRate;

  final bool? platformRatesAreDiscounted;

  // Line items
  final List<LessonBookingLineItemModel>? lineItems;

  // Additional Costs
  final List<StripeDynamicLineItem>? additionalCosts;

  final LessonBookingDiscountModel? discount;

  // Payouts
  final List<LessonBookingPayoutModel>? payoutHistory;
  final double? totalPaidOut;
  final double? totalRefunded;
  final double? totalAdjusted;

  const LessonBookingCostStructure({
    this.totalLessonCost,
    this.totalAdditionalCosts,
    this.discountedTotalCost,
    this.taxableSubTotalAmount,
    this.subTotalAmount,
    this.totalTaxes,
    this.totalAmount,
    this.tutorNetIncome,
    this.taxRate,
    this.taxLabel,
    this.countryCode,
    this.currencyCode,
    this.currencySymbol,
    this.platformFees,
    this.platformTransactionFee,
    this.platformPercentageRate,
    this.platformRatesAreDiscounted,
    this.lineItems,
    this.additionalCosts,
    this.discount,
    this.payoutHistory,
    this.totalPaidOut,
    this.totalRefunded,
    this.totalAdjusted,
  });

  factory LessonBookingCostStructure.initial(BuildContext context,
      {required PlatformRatesModel platformRates, required User user}) {
    final countryCode = user.countryCode ?? "AU";
    final currencyCode = user.currencyCode ?? 'AUD';
    return LessonBookingCostStructure(
      totalLessonCost: 0,
      totalAdditionalCosts: 0,
      discountedTotalCost: 0,
      taxableSubTotalAmount: 0,
      subTotalAmount: 0,
      totalTaxes: 0,
      totalAmount: 0,
      tutorNetIncome: 0,
      taxRate: (user.taxableRate ?? 0) / 100,
      taxLabel: user.taxLabel ?? '',
      countryCode: countryCode,
      currencyCode: currencyCode,
      currencySymbol: getCurrencySymbol(currencyCode),
      platformFees: 0,
      platformTransactionFee: platformRates.transactionFee ?? 99,
      platformPercentageRate: platformRates.percentage ?? 0.0675,
      platformRatesAreDiscounted: platformRates.discounted ?? false,
      lineItems: const [],
      additionalCosts: const [],
      discount: const LessonBookingDiscountModel(
          discountType: LessonBookingDiscountType.noDiscount),
      payoutHistory: const [],
      totalPaidOut: 0,
      totalRefunded: 0,
      totalAdjusted: 0,
    );
  }

  LessonBookingCostStructure copyWith({
    double? totalLessonCost,
    double? totalAdditionalCosts,
    double? discountedTotalCost,
    double? taxableSubTotalAmount,
    double? subTotalAmount,
    double? totalTaxes,
    double? totalAmount,
    double? tutorNetIncome,
    double? platformNetIncome,
    double? taxRate,
    String? taxLabel,
    String? countryCode,
    String? currencyCode,
    String? currencySymbol,
    double? platformFees,
    double? platformTransactionFee,
    double? platformPercentageRate,
    bool? platformRatesAreDiscounted,
    List<LessonBookingLineItemModel>? lineItems,
    List<StripeDynamicLineItem>? additionalCosts,
    LessonBookingDiscountModel? discount,
    List<LessonBookingPayoutModel>? payoutHistory,
    double? totalPaidOut,
    double? totalRefunded,
    double? totalAdjusted,
  }) {
    return LessonBookingCostStructure(
      totalLessonCost: totalLessonCost ?? this.totalLessonCost,
      totalAdditionalCosts: totalAdditionalCosts ?? this.totalAdditionalCosts,
      discountedTotalCost: discountedTotalCost ?? this.discountedTotalCost,
      taxableSubTotalAmount:
          taxableSubTotalAmount ?? this.taxableSubTotalAmount,
      subTotalAmount: subTotalAmount ?? this.subTotalAmount,
      totalTaxes: totalTaxes ?? this.totalTaxes,
      totalAmount: totalAmount ?? this.totalAmount,
      tutorNetIncome: tutorNetIncome ?? this.tutorNetIncome,
      taxRate: taxRate ?? this.taxRate,
      taxLabel: taxLabel ?? this.taxLabel,
      countryCode: countryCode ?? this.countryCode,
      currencyCode: currencyCode ?? this.currencyCode,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      platformFees: platformFees ?? this.platformFees,
      platformTransactionFee:
          platformTransactionFee ?? this.platformTransactionFee,
      platformPercentageRate:
          platformPercentageRate ?? this.platformPercentageRate,
      platformRatesAreDiscounted:
          platformRatesAreDiscounted ?? this.platformRatesAreDiscounted,
      lineItems: lineItems ?? this.lineItems,
      additionalCosts: additionalCosts ?? this.additionalCosts,
      discount: discount ?? this.discount,
      payoutHistory: payoutHistory ?? this.payoutHistory,
      totalPaidOut: totalPaidOut ?? this.totalPaidOut,
      totalRefunded: totalRefunded ?? this.totalRefunded,
      totalAdjusted: totalAdjusted ?? this.totalAdjusted,
    );
  }

  LessonBookingCostStructure calculate(
      List<LessonBookingLineItemModel> lineItems,
      {bool roundDown = false,
      List<StripeDynamicLineItem> additionalCosts = const []}) {
    double totalLessonCost = lineItems.fold(
        0,
        (num sum, LessonBookingLineItemModel item) =>
            sum + (item.discountedCostOfLesson ?? item.costOfLesson ?? 0));

    double totalAdditionalCosts = getAdditionalCostTotalAmount(additionalCosts);

    double totalTaxableAdditionalCosts = additionalCosts
        .where((ac) => ac.isTaxExempt != true)
        .fold(0, (num sum, StripeDynamicLineItem item) {
      final quantity = item.quantity!;
      final unitAmount = (item.priceData!.unitAmount! / 100);
      double amount = quantity * unitAmount;
      final discount = item.discount;
      if (discount != null && discount.discountType != DiscountType.none) {
        if (discount.discountType == DiscountType.percentage) {
          amount = amount - (amount * (discount.percentage! / 100));
        } else if (discount.discountType == DiscountType.fixedAmount) {
          amount = amount - discount.fixedAmount!;
        }
      }
      return sum + amount;
    });

    // Add discount if applicable
    double discountedTotalCost = totalLessonCost + totalAdditionalCosts;
    double discountedTaxableTotalLessonCost =
        totalLessonCost + totalTaxableAdditionalCosts;

    // LessonBookingDiscountModel calculatedDiscount = discount!;
    // if (discount!.discountType != LessonBookingDiscountType.noDiscount) {
    //   if (discount!.discountType == LessonBookingDiscountType.percentage) {
    //     if (discount!.percentage != null && discount!.percentage! > 0) {
    //       double discountTotal =
    //           totalLessonCost * (discount!.percentage! / 100);

    //       double taxableDiscountTotal =
    //           discountedTaxableTotalLessonCost * (discount!.percentage! / 100);

    //       calculatedDiscount = calculatedDiscount.copyWith(
    //           discountTotal: discountTotal,
    //           taxableDiscountTotal: taxableDiscountTotal);

    //       discountedTotalCost = discountedTotalCost - discountTotal;
    //       discountedTaxableTotalLessonCost =
    //           discountedTaxableTotalLessonCost - taxableDiscountTotal;
    //     }
    //   } else if (discount!.discountType ==
    //       LessonBookingDiscountType.fixedAmount) {
    //     if (discount!.fixedAmount != null && discount!.fixedAmount! > 0) {
    //       calculatedDiscount = calculatedDiscount.copyWith(
    //           discountTotal: discount!.fixedAmount!);

    //       discountedTotalCost = discountedTotalCost - discount!.fixedAmount!;
    //       discountedTaxableTotalLessonCost =
    //           discountedTaxableTotalLessonCost - discount!.fixedAmount!;
    //     }
    //   }
    // }

    // double platformFees = (discountedTotalCost * platformPercentageRate!) +
    //     (platformTransactionFee! / 100);
    // // platformFees = platformFees.floor().toDouble();
    // platformFees = (platformFees * 100).floor() / 100;

    double subTotalAmount = discountedTotalCost; // + platformFees;
    double taxableSubTotalAmount =
        discountedTaxableTotalLessonCost; // + platformFees;

    double totalTaxes = roundDouble(taxableSubTotalAmount * (taxRate ?? 0), 2);

    if (roundDown == true) {
      subTotalAmount = (subTotalAmount * 100).floor() / 100;
      totalTaxes = (totalTaxes * 100).floor() / 100;
    }

    double totalAmount = subTotalAmount + totalTaxes;

    double newFees = (totalAmount * platformPercentageRate!) +
        (platformTransactionFee! / 100);
    // platformFees = platformFees.floor().toDouble();
    newFees = (newFees * 100).round() / 100;

    double tutorNetIncome = totalAmount - newFees;

    return copyWith(
      totalLessonCost: totalLessonCost,
      totalAdditionalCosts: totalAdditionalCosts,
      discountedTotalCost: discountedTotalCost,
      platformFees: newFees,
      taxableSubTotalAmount: taxableSubTotalAmount,
      subTotalAmount: subTotalAmount,
      taxRate: taxRate,
      taxLabel: taxLabel,
      totalTaxes: totalTaxes,
      totalAmount: totalAmount,
      lineItems: lineItems,
      additionalCosts: additionalCosts,
      tutorNetIncome: tutorNetIncome,
      // discount: calculatedDiscount,
    );
  }

  LessonBookingCostStructure recalculateForRefund(
      {required bool isGlobalRefund,
      required LessonBookingRefundType refundType,
      bool roundDown = false,
      int? paidNumberOfLessons = 0,
      double? paidPlatformFees = 0}) {
    double totalLessonCost = lineItems!.fold(
        0,
        (num sum, LessonBookingLineItemModel item) =>
            sum + (item.discountedCostOfLesson ?? item.costOfLesson ?? 0));

    double totalAdditionalCosts =
        additionalCosts!.fold(0, (num sum, StripeDynamicLineItem item) {
      final quantity = item.quantity!;
      final unitAmount = (item.priceData!.unitAmount! / 100);
      double amount = quantity * unitAmount;
      final discount = item.discount;
      if (discount != null && discount.discountType != DiscountType.none) {
        if (discount.discountType == DiscountType.percentage) {
          amount = amount - (amount * (discount.percentage! / 100));
        } else if (discount.discountType == DiscountType.fixedAmount) {
          amount = amount - discount.fixedAmount!;
        }
      }
      return sum + amount;
    });

    double totalTaxableAdditionalCosts = additionalCosts!
        .where((ac) => ac.isTaxExempt != true)
        .fold(0, (num sum, StripeDynamicLineItem item) {
      final quantity = item.quantity!;
      final unitAmount = (item.priceData!.unitAmount! / 100);
      double amount = quantity * unitAmount;
      final discount = item.discount;
      if (discount != null && discount.discountType != DiscountType.none) {
        if (discount.discountType == DiscountType.percentage) {
          amount = amount - (amount * (discount.percentage! / 100));
        } else if (discount.discountType == DiscountType.fixedAmount) {
          amount = amount - discount.fixedAmount!;
        }
      }
      return sum + amount;
    });

    // Add discount if applicable
    double discountedTotalCost = totalLessonCost + totalAdditionalCosts;
    double discountedTaxableTotalLessonCost =
        totalLessonCost + totalTaxableAdditionalCosts;

    // LessonBookingDiscountModel calculatedDiscount = discount!;
    // if (discount!.discountType != LessonBookingDiscountType.noDiscount) {
    //   if (discount!.discountType == LessonBookingDiscountType.percentage) {
    //     if (discount!.percentage != null && discount!.percentage! > 0) {
    //       double discountTotal =
    //           totalLessonCost * (discount!.percentage! / 100);

    //       double taxableDiscountTotal =
    //           discountedTaxableTotalLessonCost * (discount!.percentage! / 100);

    //       calculatedDiscount = calculatedDiscount.copyWith(
    //           discountTotal: discountTotal,
    //           taxableDiscountTotal: taxableDiscountTotal);

    //       discountedTotalCost = discountedTotalCost - discountTotal;
    //       discountedTaxableTotalLessonCost =
    //           discountedTaxableTotalLessonCost - taxableDiscountTotal;
    //     }
    //   } else if (discount!.discountType ==
    //       LessonBookingDiscountType.fixedAmount) {
    //     if (discount!.fixedAmount != null && discount!.fixedAmount! > 0) {
    //       calculatedDiscount = calculatedDiscount.copyWith(
    //           discountTotal: discount!.fixedAmount!);

    //       discountedTotalCost = discountedTotalCost - discount!.fixedAmount!;
    //       discountedTaxableTotalLessonCost =
    //           discountedTaxableTotalLessonCost - discount!.fixedAmount!;
    //     }
    //   }
    // }

    double subTotalAmount = discountedTotalCost;
    double taxableSubTotalAmount = discountedTaxableTotalLessonCost;

    // if (isGlobalRefund == true) {
    // platformFees = (discountedTotalCost * platformPercentageRate!) +
    //     (platformTransactionFee! / 100);
    // platformFees = (platformFees * 100).floor() / 100;

    // subTotalAmount += platformFees;
    // taxableSubTotalAmount += platformFees;
    // }

    double totalTaxes = roundDouble(taxableSubTotalAmount * (taxRate ?? 0), 2);

    if (roundDown == true) {
      subTotalAmount = (subTotalAmount * 100).floor() / 100;
      totalTaxes = (totalTaxes * 100).floor() / 100;
    }

    double totalAmount = subTotalAmount + totalTaxes;

    double newFees = 0;
    // if (isGlobalRefund == true) {
    // double platformFees = (totalAmount * platformPercentageRate!) +
    //     (platformTransactionFee! / 100);
    // platformFees = (platformFees * 100).floor() / 100;
    if (refundType != LessonBookingRefundType.additionalCostRefund) {
      if (refundType == LessonBookingRefundType.fullRefund) {
        newFees = paidPlatformFees ?? 0;
      } else {
        newFees = paidPlatformFees! / paidNumberOfLessons!;
        newFees = (newFees * 100).round() / 100;
      }
    }

    double tutorNetIncome = totalAmount - newFees;

    return copyWith(
      totalLessonCost: totalLessonCost,
      totalAdditionalCosts: totalAdditionalCosts,
      discountedTotalCost: discountedTotalCost,
      platformFees: newFees,
      taxableSubTotalAmount: taxableSubTotalAmount,
      subTotalAmount: subTotalAmount,
      totalTaxes: totalTaxes,
      totalAmount: totalAmount,
      taxRate: taxRate,
      taxLabel: taxLabel,
      lineItems: lineItems,
      additionalCosts: additionalCosts,
      tutorNetIncome: tutorNetIncome,
      // discount: calculatedDiscount,
    );
  }

  @override
  List<Object?> get props {
    return [
      totalLessonCost,
      totalAdditionalCosts,
      discountedTotalCost,
      taxableSubTotalAmount,
      subTotalAmount,
      totalTaxes,
      totalAmount,
      tutorNetIncome,
      taxRate,
      taxLabel,
      countryCode,
      currencyCode,
      currencySymbol,
      platformFees,
      platformTransactionFee,
      platformPercentageRate,
      platformRatesAreDiscounted,
      lineItems,
      additionalCosts,
      discount,
      payoutHistory,
      totalPaidOut,
      totalRefunded,
      totalAdjusted,
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'totalLessonCost': totalLessonCost ?? 0,
      'totalAdditionalCosts': totalAdditionalCosts ?? 0,
      'discountedTotalLessonCost': discountedTotalCost ?? 0,
      'platformFees': double.parse((platformFees ?? 0).toStringAsFixed(2)),
      'taxableSubTotalAmount':
          double.parse((taxableSubTotalAmount ?? 0).toStringAsFixed(2)),
      'subTotalAmount': double.parse((subTotalAmount ?? 0).toStringAsFixed(2)),
      'totalTaxes': double.parse((totalTaxes ?? 0).toStringAsFixed(2)),
      'totalAmount': double.parse((totalAmount ?? 0).toStringAsFixed(2)),
      'tutorNetIncome': double.parse((tutorNetIncome ?? 0).toStringAsFixed(2)),
      'taxRate': taxRate ?? 0,
      'taxLabel': taxLabel ?? 'Tax'.i18n,
      'countryCode': countryCode ?? 'AU',
      'currencyCode': currencyCode ?? 'AUD',
      'currencySymbol': currencySymbol ?? '\$',
      'platformTransactionFee': platformTransactionFee,
      'platformPercentageRate': platformPercentageRate,
      'platformRatesAreDiscounted': platformRatesAreDiscounted,
      'lineItems': lineItems?.map((x) => x.toMap()).toList(),
      'additionalCosts': additionalCosts?.map((x) => x.toMap()).toList(),
      'discount': discount?.toMap(),
      'payoutHistory': payoutHistory?.map((x) => x.toMap()).toList(),
      'totalPaidOut': totalPaidOut,
      'totalRefunded': totalRefunded,
      'totalAdjusted': totalAdjusted,
    };
  }

  factory LessonBookingCostStructure.fromMap(Map<String, dynamic> map) {
    return LessonBookingCostStructure(
      totalLessonCost: map['totalLessonCost']?.toDouble() ?? 0,
      totalAdditionalCosts: map['totalAdditionalCosts']?.toDouble() ?? 0,
      discountedTotalCost: map['discountedTotalLessonCost']?.toDouble() ?? 0,
      platformFees: map['platformFees']?.toDouble(),
      taxableSubTotalAmount: map['taxableSubTotalAmount']?.toDouble(),
      subTotalAmount: map['subTotalAmount']?.toDouble(),
      totalTaxes: map['totalTaxes']?.toDouble(),
      totalAmount: map['totalAmount']?.toDouble(),
      tutorNetIncome: map['tutorNetIncome']?.toDouble(),
      taxRate: map['taxRate']?.toDouble(),
      taxLabel: map['taxLabel'] ?? 'Tax'.i18n,
      countryCode: map['countryCode'] ?? 'AU',
      currencyCode: map['currencyCode'] ?? 'AUD',
      currencySymbol: map['currencySymbol'] ?? '\$',
      platformTransactionFee: map['platformTransactionFee']?.toDouble(),
      platformPercentageRate: map['platformPercentageRate']?.toDouble(),
      platformRatesAreDiscounted: map['platformRatesAreDiscounted'] ?? false,
      lineItems: map['lineItems'] != null
          ? List<LessonBookingLineItemModel>.from(map['lineItems']
              ?.map((x) => LessonBookingLineItemModel.fromMap(x)))
          : [],
      additionalCosts: map['additionalCosts'] != null
          ? List<StripeDynamicLineItem>.from(map['additionalCosts']
              ?.map((x) => StripeDynamicLineItem.fromMap(x)))
          : [],
      discount: map['discount'] != null
          ? LessonBookingDiscountModel.fromMap(map['discount'])
          : const LessonBookingDiscountModel(
              discountType: LessonBookingDiscountType.noDiscount),
      payoutHistory: map['payoutHistory'] != null
          ? List<LessonBookingPayoutModel>.from(map['payoutHistory']
              ?.map((x) => LessonBookingPayoutModel.fromMap(x)))
          : [],
      totalPaidOut: map['totalPaidOut'],
      totalRefunded: map['totalRefunded'],
      totalAdjusted: map['totalAdjusted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonBookingCostStructure.fromJson(String source) =>
      LessonBookingCostStructure.fromMap(json.decode(source));
}

class LessonBookingDiscountModel extends Equatable {
  final LessonBookingDiscountType? discountType;
  final int? percentage;
  final double? fixedAmount;
  final double? discountTotal;
  final double? taxableDiscountTotal;

  const LessonBookingDiscountModel({
    this.discountType,
    this.percentage,
    this.fixedAmount,
    this.discountTotal,
    this.taxableDiscountTotal,
  });

  LessonBookingDiscountModel copyWith({
    LessonBookingDiscountType? discountType,
    int? percentage,
    double? fixedAmount,
    double? discountTotal,
    double? taxableDiscountTotal,
  }) {
    return LessonBookingDiscountModel(
      discountType: discountType ?? this.discountType,
      percentage: percentage ?? this.percentage,
      fixedAmount: fixedAmount ?? this.fixedAmount,
      discountTotal: discountTotal ?? this.discountTotal,
      taxableDiscountTotal: taxableDiscountTotal ?? this.taxableDiscountTotal,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'discountType': discountType?.toMap(),
      'percentage': percentage,
      'fixedAmount': fixedAmount,
      'discountTotal': discountTotal,
      'taxableDiscountTotal': taxableDiscountTotal,
    };
  }

  factory LessonBookingDiscountModel.fromMap(Map<String, dynamic> map) {
    const staticType = LessonBookingDiscountType.noDiscount;
    return LessonBookingDiscountModel(
      discountType: staticType.fromMap(map['discountType']),
      percentage: map['percentage']?.toInt() ?? 0,
      fixedAmount: map['fixedAmount']?.toDouble(),
      discountTotal: map['discountTotal']?.toDouble(),
      taxableDiscountTotal: map['taxableDiscountTotal']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonBookingDiscountModel.fromJson(String source) =>
      LessonBookingDiscountModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'LessonBookingDiscountModel(discountType: $discountType, percentage: $percentage, amount: $fixedAmount)';

  @override
  List<Object?> get props => [
        discountType,
        percentage,
        fixedAmount,
        discountTotal,
        taxableDiscountTotal
      ];
}
