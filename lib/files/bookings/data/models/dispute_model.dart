import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuiientitymodels/files/bookings/data/models/dispute_attachment_model.dart';

class DisputeModel extends Equatable {
  final String? disputeNumber;
  final String? message;
  final List<DisputeAttachmentModel>? attachments;
  final String? lessonBookingId;

  const DisputeModel({
    this.disputeNumber,
    this.message,
    this.attachments,
    this.lessonBookingId,
  });

  DisputeModel copyWith({
    String? disputeNumber,
    String? message,
    List<DisputeAttachmentModel>? attachments,
    String? lessonBookingId,
  }) {
    return DisputeModel(
      disputeNumber: disputeNumber ?? this.disputeNumber,
      message: message ?? this.message,
      attachments: attachments ?? this.attachments,
      lessonBookingId: lessonBookingId ?? this.lessonBookingId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'disputeNumber': disputeNumber,
      'message': message,
      'attachments': attachments?.map((x) => x.toMap()).toList(),
      'lessonBookingId': lessonBookingId,
    };
  }

  factory DisputeModel.fromMap(Map<String, dynamic> map) {
    return DisputeModel(
      disputeNumber: map['disputeNumber'],
      message: map['message'],
      attachments: map['attachments'] != null
          ? List<DisputeAttachmentModel>.from(
              map['attachments']?.map((x) => DisputeAttachmentModel.fromMap(x)))
          : null,
      lessonBookingId: map['lessonBookingId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DisputeModel.fromJson(String source) =>
      DisputeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DisputeModel(disputeNumber: $disputeNumber, message: $message, attachments: $attachments, lessonBookingId: $lessonBookingId)';
  }

  @override
  List<Object?> get props =>
      [disputeNumber, message, attachments, lessonBookingId];
}
