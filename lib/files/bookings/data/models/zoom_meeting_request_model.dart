import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:tuiicore/core/enums/enums.dart';

class ZoomMeetingRequestModel extends Equatable {
  final String? topic;
  final ZoomMeetingType? type;
  final DateTime? startTime;
  final int? duration;
  final String? scheduleFor;

  const ZoomMeetingRequestModel({
    this.topic,
    this.type,
    this.startTime,
    this.duration,
    this.scheduleFor,
  });

  @override
  List<Object?> get props {
    return [
      topic,
      type,
      startTime,
      duration,
      scheduleFor,
    ];
  }

  ZoomMeetingRequestModel copyWith({
    String? topic,
    ZoomMeetingType? type,
    DateTime? startTime,
    int? duration,
    String? scheduleFor,
  }) {
    return ZoomMeetingRequestModel(
      topic: topic ?? this.topic,
      type: type ?? this.type,
      startTime: startTime ?? this.startTime,
      duration: duration ?? this.duration,
      scheduleFor: scheduleFor ?? this.scheduleFor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'topic': topic,
      'type': type?.zoomIntValue,
      'start_time': _formatDate(startTime ?? DateTime.now()),
      'duration': duration,
      'schedule_for': scheduleFor,
    };
  }

  factory ZoomMeetingRequestModel.fromMap(Map<String, dynamic> map) {
    return ZoomMeetingRequestModel(
      topic: map['topic'],
      type: map['type'] != null
          ? ZoomMeetingType.undefined.fromMap(map['type'])
          : ZoomMeetingType.scheduled,
      startTime: map['startTime'] != null
          ? DateTime.parse(map['startTime'])
          : DateTime.now(),
      duration: map['duration']?.toInt(),
      scheduleFor: map['scheduleFor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ZoomMeetingRequestModel.fromJson(String source) =>
      ZoomMeetingRequestModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ZoomBookingRequestModel(topic: $topic, type: $type, startTime: $startTime, duration: $duration, scheduleFor: $scheduleFor)';
  }

  String _formatDate(DateTime dateTime) {
    var val = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(dateTime);
    final offset = dateTime.timeZoneOffset;
    final hours =
        offset.inHours > 0 ? offset.inHours : 1; // For fixing divide by 0

    if (!offset.isNegative) {
      val = val +
          "+" +
          offset.inHours.toString().padLeft(2, '0') +
          ":" +
          (offset.inMinutes % (hours * 60)).toString().padLeft(2, '0');
    } else {
      val = val +
          "-" +
          (-offset.inHours).toString().padLeft(2, '0') +
          ":" +
          (offset.inMinutes % (hours * 60)).toString().padLeft(2, '0');
    }

    return val;
  }
}
