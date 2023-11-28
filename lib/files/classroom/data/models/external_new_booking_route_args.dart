import 'package:equatable/equatable.dart';
import 'package:tuiientitymodels/files/home/domain/entities/lesson_appointment.dart';
import 'package:tuiicore/core/enums/calendar_mode_type.dart';
import 'package:tuiicore/core/enums/cancel_booking_route_target_type.dart';

class ExternalNewBookingRouteArgs extends Equatable {
  final CalendarModeType calendarMode;
  final LessonAppointment appointment;
  final CancelBookingRouteTarget? cancelBookingRouteTarget;

  const ExternalNewBookingRouteArgs(
      {required this.calendarMode,
      required this.appointment,
      this.cancelBookingRouteTarget = CancelBookingRouteTarget.bookings});

  @override
  List<Object?> get props => [
        calendarMode,
        appointment,
        cancelBookingRouteTarget,
      ];

  ExternalNewBookingRouteArgs copyWith({
    CalendarModeType? calendarMode,
    LessonAppointment? appointment,
    CancelBookingRouteTarget? cancelBookingRouteTarget,
  }) {
    return ExternalNewBookingRouteArgs(
      calendarMode: calendarMode ?? this.calendarMode,
      appointment: appointment ?? this.appointment,
      cancelBookingRouteTarget:
          cancelBookingRouteTarget ?? this.cancelBookingRouteTarget,
    );
  }
}
