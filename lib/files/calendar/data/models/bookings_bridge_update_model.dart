import 'package:equatable/equatable.dart';
import 'package:tuiientitymodels/files/calendar/data/models/lesson_booking_model.dart';

import 'package:tuiicore/core/enums/calendar_booking_mode_type.dart';
import 'package:tuiicore/core/enums/calendar_mode_type.dart';
import 'package:tuiicore/core/enums/cancel_booking_route_target_type.dart';

class BookingsBridgeUpdateModel extends Equatable {
  final CancelBookingRouteTarget? cancelBookingRouteTarget;
  final CalendarBookingModeType? bookingMode;
  final CalendarModeType? calendarMode;
  final LessonBookingModel? lessonBooking;

  const BookingsBridgeUpdateModel({
    this.cancelBookingRouteTarget,
    this.bookingMode,
    this.calendarMode,
    this.lessonBooking,
  });

  BookingsBridgeUpdateModel copyWith({
    CancelBookingRouteTarget? cancelBookingRouteTarget,
    CalendarBookingModeType? bookingMode,
    CalendarModeType? calendarMode,
    LessonBookingModel? lessonBooking,
  }) {
    return BookingsBridgeUpdateModel(
      cancelBookingRouteTarget:
          cancelBookingRouteTarget ?? this.cancelBookingRouteTarget,
      bookingMode: bookingMode ?? this.bookingMode,
      calendarMode: calendarMode ?? this.calendarMode,
      lessonBooking: lessonBooking ?? this.lessonBooking,
    );
  }

  @override
  List<Object?> get props =>
      [cancelBookingRouteTarget, bookingMode, calendarMode, lessonBooking];
}
