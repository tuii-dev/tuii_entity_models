import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/calendar/data/models/lesson_booking_model.dart';

class AcceptBookingRefundResponse extends Equatable {
  final LessonBookingModel refundBooking;
  final LessonBookingModel paidBooking;

  const AcceptBookingRefundResponse({
    required this.refundBooking,
    required this.paidBooking,
  });

  AcceptBookingRefundResponse copyWith({
    LessonBookingModel? refundBooking,
    LessonBookingModel? paidBooking,
  }) {
    return AcceptBookingRefundResponse(
      refundBooking: refundBooking ?? this.refundBooking,
      paidBooking: paidBooking ?? this.paidBooking,
    );
  }

  @override
  List<Object> get props => [refundBooking, paidBooking];
}
