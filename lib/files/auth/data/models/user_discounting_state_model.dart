import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserDiscountingStateModel extends Equatable {
  final bool? isDiscounted;
  final DateTime? startDate;
  final DateTime? expiryDate;

  const UserDiscountingStateModel({
    this.isDiscounted,
    this.startDate,
    this.expiryDate,
  });

  UserDiscountingStateModel copyWith({
    bool? isDiscounted,
    DateTime? startDate,
    DateTime? expiryDate,
  }) {
    return UserDiscountingStateModel(
      isDiscounted: isDiscounted ?? this.isDiscounted,
      startDate: startDate ?? this.startDate,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isDiscounted': isDiscounted,
      'startDate': startDate?.toUtc().millisecondsSinceEpoch,
      'expiryDate': expiryDate?.toUtc().millisecondsSinceEpoch,
    };
  }

  factory UserDiscountingStateModel.fromMap(Map<String, dynamic> map) {
    return UserDiscountingStateModel(
      isDiscounted: map['isDiscounted'],
      startDate: map['startDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['startDate']).toLocal()
          : null,
      expiryDate: map['expiryDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['expiryDate']).toLocal()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDiscountingStateModel.fromJson(String source) =>
      UserDiscountingStateModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserDiscountingStateModel(isDiscounted: $isDiscounted, startDate: $startDate, expiryDate: $expiryDate)';

  @override
  List<Object?> get props => [isDiscounted, startDate, expiryDate];
}
