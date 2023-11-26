import 'dart:convert';

import 'package:equatable/equatable.dart';

class RefundResponseModel extends Equatable {
  final String? refundId;
  final String? status;
  final String? message;

  const RefundResponseModel({
    this.refundId,
    this.status,
    this.message,
  });

  RefundResponseModel copyWith({
    String? refundId,
    String? status,
    String? message,
  }) {
    return RefundResponseModel(
      refundId: refundId ?? this.refundId,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'refundId': refundId,
      'status': status,
      'message': message,
    };
  }

  factory RefundResponseModel.fromMap(Map<String, dynamic> map) {
    return RefundResponseModel(
      refundId: map['refundId'],
      status: map['status'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RefundResponseModel.fromJson(String source) =>
      RefundResponseModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'RefundResponseModel(refundId: $refundId, status: $status, message: $message)';

  @override
  List<Object?> get props => [refundId, status, message];
}
