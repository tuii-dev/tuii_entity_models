import 'dart:convert';

import 'package:equatable/equatable.dart';

class PayoutDirectiveScheduleModel extends Equatable {
  final DateTime? scheduledPayoutDate;
  final int? executionKey;

  const PayoutDirectiveScheduleModel({
    this.scheduledPayoutDate,
    this.executionKey,
  });

  PayoutDirectiveScheduleModel copyWith({
    DateTime? scheduledPayoutDate,
    int? executionKey,
  }) {
    return PayoutDirectiveScheduleModel(
      scheduledPayoutDate: scheduledPayoutDate ?? this.scheduledPayoutDate,
      executionKey: executionKey ?? this.executionKey,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'scheduledPayoutDate':
          scheduledPayoutDate?.toUtc().millisecondsSinceEpoch,
      'executionKey': executionKey,
    };
  }

  factory PayoutDirectiveScheduleModel.fromMap(Map<String, dynamic> map) {
    return PayoutDirectiveScheduleModel(
      scheduledPayoutDate: map['scheduledPayoutDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['scheduledPayoutDate'])
              .toLocal()
          : null,
      executionKey: map['executionKey']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PayoutDirectiveScheduleModel.fromJson(String source) =>
      PayoutDirectiveScheduleModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'PayoutDirectiveScheduleModel(scheduledPayoutDate: $scheduledPayoutDate, executionKey: $executionKey)';

  @override
  List<Object?> get props => [scheduledPayoutDate, executionKey];
}
