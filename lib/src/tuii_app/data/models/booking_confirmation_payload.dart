import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/calendar/data/models/lesson_booking_model.dart';

class BookingConfirmationPayload extends Equatable {
  final LessonBookingModel lessonBooking;
  const BookingConfirmationPayload({
    required this.lessonBooking,
  });

  BookingConfirmationPayload copyWith({
    LessonBookingModel? lessonBooking,
  }) {
    return BookingConfirmationPayload(
      lessonBooking: lessonBooking ?? this.lessonBooking,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lessonBooking': lessonBooking.toMapWithStripeInfo(),
    };
  }

  factory BookingConfirmationPayload.fromMap(Map<String, dynamic> map) {
    return BookingConfirmationPayload(
      lessonBooking: LessonBookingModel.fromMap(map['lessonBooking']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingConfirmationPayload.fromJson(String source) =>
      BookingConfirmationPayload.fromMap(json.decode(source));

  @override
  String toString() =>
      'BookingConfirmationPayload(lessonBooking: $lessonBooking)';

  @override
  List<Object> get props => [lessonBooking];
}
