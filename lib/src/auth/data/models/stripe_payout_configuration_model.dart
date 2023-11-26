import 'dart:convert';

import 'package:equatable/equatable.dart';

class StripePayoutConfigurationModel extends Equatable {
  final bool? debitNegativeBalances;
  final StripePayoutScheduleModel? schedule;
  const StripePayoutConfigurationModel({
    this.debitNegativeBalances,
    this.schedule,
  });

  StripePayoutConfigurationModel copyWith({
    bool? debitNegativeBalances,
    StripePayoutScheduleModel? schedule,
  }) {
    return StripePayoutConfigurationModel(
      debitNegativeBalances:
          debitNegativeBalances ?? this.debitNegativeBalances,
      schedule: schedule ?? this.schedule,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'debitNegativeBalances': debitNegativeBalances,
      'schedule': schedule?.toMap(),
    };
  }

  factory StripePayoutConfigurationModel.fromMap(Map<String, dynamic> map) {
    return StripePayoutConfigurationModel(
      debitNegativeBalances: map['debit_negative_balances'],
      schedule: map['schedule'] != null
          ? StripePayoutScheduleModel.fromMap(map['schedule'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StripePayoutConfigurationModel.fromJson(String source) =>
      StripePayoutConfigurationModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'StripePayoutConfigurationModel(debitNegativeBalance: $debitNegativeBalances, schedule: $schedule)';

  @override
  List<Object?> get props => [debitNegativeBalances, schedule];
}

class StripePayoutScheduleModel extends Equatable {
  final int? delaysDays;
  final String? interval;

  const StripePayoutScheduleModel({
    this.delaysDays,
    this.interval,
  });

  StripePayoutScheduleModel copyWith({
    int? delaysDays,
    String? interval,
  }) {
    return StripePayoutScheduleModel(
      delaysDays: delaysDays ?? this.delaysDays,
      interval: interval ?? this.interval,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'delaysDays': delaysDays,
      'interval': interval,
    };
  }

  factory StripePayoutScheduleModel.fromMap(Map<String, dynamic> map) {
    return StripePayoutScheduleModel(
      delaysDays: map['delay_days']?.toInt(),
      interval: map['interval'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StripePayoutScheduleModel.fromJson(String source) =>
      StripePayoutScheduleModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'StripePayoutScheduleModel(delaysDays: $delaysDays, interval: $interval)';

  @override
  List<Object?> get props => [delaysDays, interval];
}
