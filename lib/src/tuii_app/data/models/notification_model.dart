import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:tuiicore/core/enums/enums.dart';

class NotificationModel extends Equatable {
  final String? id;
  final String? senderId;
  final String? senderFirstName;
  final String? senderLastName;
  final String? senderEmail;
  final String? senderProfileImageUrl;
  final String? receiverId;
  final DateTime? creationDate;
  final bool? resolved;
  final bool? deleted;
  final DateTime? resolutionDate;
  final NotificationType? notificationType;
  final bool? isCancellation;
  final bool? isParentRejection;
  final String? notificationPreface;
  final bool? resolveOnView;
  final Map<String, dynamic>? payload;

  const NotificationModel({
    this.id,
    this.senderId,
    this.senderFirstName,
    this.senderLastName,
    this.senderEmail,
    this.senderProfileImageUrl,
    this.receiverId,
    this.creationDate,
    this.resolved = false,
    this.deleted = false,
    this.resolutionDate,
    this.notificationType,
    this.isCancellation,
    this.isParentRejection,
    this.notificationPreface,
    this.resolveOnView = false,
    this.payload,
  });

  NotificationModel copyWith({
    String? id,
    String? senderId,
    String? senderFirstName,
    String? senderLastName,
    String? senderEmail,
    String? senderProfileImageUrl,
    String? receiverId,
    DateTime? creationDate,
    bool? resolved,
    DateTime? resolutionDate,
    NotificationType? notificationType,
    bool? isCancellation,
    bool? isParentRejection,
    String? notificationPreface,
    bool? resolveOnView,
    Map<String, dynamic>? payload,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      senderFirstName: senderFirstName ?? this.senderFirstName,
      senderLastName: senderLastName ?? this.senderLastName,
      senderEmail: senderEmail ?? this.senderEmail,
      senderProfileImageUrl:
          senderProfileImageUrl ?? this.senderProfileImageUrl,
      receiverId: receiverId ?? this.receiverId,
      creationDate: creationDate ?? this.creationDate,
      resolved: resolved ?? this.resolved,
      resolutionDate: resolutionDate ?? this.resolutionDate,
      notificationType: notificationType ?? this.notificationType,
      isCancellation: isCancellation ?? this.isCancellation,
      isParentRejection: isParentRejection ?? this.isParentRejection,
      notificationPreface: notificationPreface ?? this.notificationPreface,
      resolveOnView: resolveOnView ?? this.resolveOnView,
      payload: payload ?? this.payload,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'senderFirstName': senderFirstName,
      'senderLastName': senderLastName,
      'senderEmail': senderEmail,
      'senderProfileImageUrl': senderProfileImageUrl,
      'receiverId': receiverId,
      'creationDate': creationDate?.toUtc().millisecondsSinceEpoch,
      'resolved': resolved ?? false,
      'deleted': deleted ?? false,
      'resolutionDate': resolutionDate?.toUtc().millisecondsSinceEpoch,
      'notificationType': notificationType?.toMap(),
      'isCancellation': isCancellation,
      'notificationPreface': notificationPreface,
      'isParentRejection': isParentRejection ?? false,
      'resolveOnView': resolveOnView ?? false,
      'payload': payload,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    const staticType = NotificationType.unknown;
    return NotificationModel(
      id: map['id'],
      senderId: map['senderId'],
      senderFirstName: map['senderFirstName'],
      senderLastName: map['senderLastName'],
      senderEmail: map['senderEmail'],
      senderProfileImageUrl: map['senderProfileImageUrl'],
      receiverId: map['receiverId'],
      creationDate: map['creationDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['creationDate']).toLocal()
          : null,
      resolved: map['resolved'] ?? false,
      deleted: map['deleted'] ?? false,
      resolutionDate: map['resolutionDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['resolutionDate']).toLocal()
          : null,
      notificationType: map['notificationType'] != null
          ? staticType.fromMap(map['notificationType'])
          : null,
      isCancellation: map['isCancellation'] ?? false,
      isParentRejection: map['isParentRejection'] ?? false,
      notificationPreface: map['notificationPreface'],
      resolveOnView: map['resolveOnView'] ?? false,
      payload: map['payload'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NotificationModel(id: $id, senderId: $senderId, senderEmail: $senderEmail, senderProfileImageUrl: $senderProfileImageUrl, receiverId: $receiverId, creationDate: $creationDate, resolutionDate: $resolutionDate, notificationType: $notificationType, notificationPreface: $notificationPreface, payload: $payload)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      senderId,
      senderFirstName,
      senderLastName,
      senderEmail,
      senderProfileImageUrl,
      receiverId,
      creationDate,
      resolved,
      deleted,
      resolutionDate,
      notificationType,
      isCancellation,
      isParentRejection,
      notificationPreface,
      resolveOnView,
      payload,
    ];
  }
}
