import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/calendar/data/models/lesson_booking_model.dart';
import 'package:tuii_entity_models/src/home/domain/entities/lesson_appointment.dart';
import 'package:tuiicore/core/enums/calendar_booking_mode_type.dart';
import 'package:tuiicore/core/enums/cancel_booking_route_target_type.dart';

class ExternalExistingBookingRouteArgs extends Equatable {
  final CalendarBookingModeType calendarBookingMode;
  final LessonBookingModel lessonBooking;
  final CancelBookingRouteTarget? cancelBookingRouteTarget;
  final dynamic backRouteArgs;
  final bool? isRescheduleRoute;
  final LessonAppointment? rescheduleAppointment;

  const ExternalExistingBookingRouteArgs({
    required this.calendarBookingMode,
    required this.lessonBooking,
    this.cancelBookingRouteTarget = CancelBookingRouteTarget.home,
    this.backRouteArgs = const {},
    this.isRescheduleRoute = false,
    this.rescheduleAppointment,
  });

  @override
  List<Object?> get props => [
        calendarBookingMode,
        lessonBooking,
        cancelBookingRouteTarget,
        backRouteArgs,
        isRescheduleRoute,
        rescheduleAppointment,
      ];

  ExternalExistingBookingRouteArgs copyWith({
    CalendarBookingModeType? calendarBookingMode,
    LessonBookingModel? lessonBooking,
    CancelBookingRouteTarget? cancelBookingRouteTarget,
    dynamic backRouteArgs,
    bool? isRescheduleRoute,
    LessonAppointment? rescheduleAppointment,
  }) {
    return ExternalExistingBookingRouteArgs(
      calendarBookingMode: calendarBookingMode ?? this.calendarBookingMode,
      lessonBooking: lessonBooking ?? this.lessonBooking,
      cancelBookingRouteTarget:
          cancelBookingRouteTarget ?? this.cancelBookingRouteTarget,
      backRouteArgs: backRouteArgs ?? this.backRouteArgs,
      isRescheduleRoute: isRescheduleRoute ?? this.isRescheduleRoute,
      rescheduleAppointment:
          rescheduleAppointment ?? this.rescheduleAppointment,
    );
  }
}
