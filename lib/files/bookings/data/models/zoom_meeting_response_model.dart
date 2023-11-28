import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:tuiicore/core/enums/enums.dart';

class ZoomMeetingResponseModel extends Equatable {
  final int? id;
  final ZoomMeetingType? meetingType;
  final String? startTime;
  final int? durationInMinutes;
  final String? createdAt;
  final String? startUrl;
  final String? joinUrl;
  final bool isEmpty;

  const ZoomMeetingResponseModel({
    this.id,
    this.meetingType,
    this.startTime,
    this.durationInMinutes,
    this.createdAt,
    this.startUrl,
    this.joinUrl,
    this.isEmpty = false,
  });

  factory ZoomMeetingResponseModel.empty() {
    return const ZoomMeetingResponseModel(isEmpty: true);
  }

  @override
  List<Object?> get props {
    return [
      id,
      meetingType,
      startTime,
      durationInMinutes,
      createdAt,
      startUrl,
      joinUrl,
    ];
  }

  ZoomMeetingResponseModel copyWith({
    int? id,
    ZoomMeetingType? meetingType,
    String? startTime,
    int? durationInMinutes,
    String? createdAt,
    String? startUrl,
    String? joinUrl,
  }) {
    return ZoomMeetingResponseModel(
      id: id ?? this.id,
      meetingType: meetingType ?? this.meetingType,
      startTime: startTime ?? this.startTime,
      durationInMinutes: durationInMinutes ?? this.durationInMinutes,
      createdAt: createdAt ?? this.createdAt,
      startUrl: startUrl ?? this.startUrl,
      joinUrl: joinUrl ?? this.joinUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'meetingType': meetingType?.zoomIntValue,
      'startTime': startTime,
      'durationInMinutes': durationInMinutes,
      'createdAt': createdAt,
      'startUrl': startUrl,
      'joinUrl': joinUrl,
    };
  }

  factory ZoomMeetingResponseModel.fromMap(Map<String, dynamic> map) {
    return ZoomMeetingResponseModel(
      id: map['id']?.toInt(),
      meetingType: map['type'] != null
          ? ZoomMeetingType.undefined.fromMap(map['type'])
          : ZoomMeetingType.scheduled,
      startTime: map['start_time'],
      durationInMinutes: map['duration']?.toInt(),
      createdAt: map['created_at'],
      startUrl: map['start_url'],
      joinUrl: map['join_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ZoomMeetingResponseModel.fromJson(String source) {
    final map = json.decode(source);
    if (map['success'] == true) {
      final model = ZoomMeetingResponseModel.fromMap(map['response']);
      return model;
    } else {
      return ZoomMeetingResponseModel.empty();
    }
  }

  @override
  String toString() {
    return 'ZoomBookingResponseModel(id: $id, meetingType: $meetingType, startTime: $startTime, durationInMinutes: $durationInMinutes, createdAt: $createdAt, startUrl: $startUrl, joinUrl: $joinUrl)';
  }
}
