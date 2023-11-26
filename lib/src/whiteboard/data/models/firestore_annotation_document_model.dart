import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:tuiicore/core/common/common.dart';

class FirestoreAnnotationDocument extends Equatable {
  final String? annotationId;
  final DocumentChangeType? docChangeType;
  final String? classroomId;
  final String? resourceId;
  final String? authorId;
  final String? parentAuthorId;
  final String? xfdf;
  final bool? isEmpty;

  const FirestoreAnnotationDocument({
    this.annotationId,
    this.docChangeType,
    this.classroomId,
    this.resourceId,
    this.authorId,
    this.parentAuthorId,
    this.xfdf,
    this.isEmpty = false,
  });

  factory FirestoreAnnotationDocument.empty() {
    return const FirestoreAnnotationDocument(isEmpty: true);
  }

  FirestoreAnnotationDocument copyWith({
    String? annotationId,
    DocumentChangeType? docChangeType,
    String? classroomId,
    String? resourceId,
    String? authorId,
    String? parentAuthorId,
    String? xfdf,
    bool? isEmpty,
  }) {
    return FirestoreAnnotationDocument(
      annotationId: annotationId ?? this.annotationId,
      docChangeType: docChangeType ?? this.docChangeType,
      classroomId: classroomId ?? this.classroomId,
      resourceId: resourceId ?? this.resourceId,
      authorId: authorId ?? this.authorId,
      parentAuthorId: parentAuthorId ?? this.parentAuthorId,
      xfdf: xfdf ?? this.xfdf,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'annotationId': annotationId,
      'classroomId': classroomId,
      'resourceId': resourceId,
      'authorId': authorId,
      'parentAuthorId': parentAuthorId,
      'xfdf': encodeXmlToBase64(xfdf ?? ''),
      'isEmpty': isEmpty,
    };
  }

  Map<String, dynamic> toMapExcludeXmlEncoding() {
    return {
      'annotationId': annotationId,
      'classroomId': classroomId,
      'resourceId': resourceId,
      'authorId': authorId,
      'parentAuthorId': parentAuthorId,
      'xfdf': xfdf ?? '',
      'isEmpty': isEmpty,
    };
  }

  factory FirestoreAnnotationDocument.fromMap(Map<String, dynamic> map) {
    return FirestoreAnnotationDocument(
      annotationId: map['annotationId'],
      classroomId: map['classroomId'],
      resourceId: map['resourceId'],
      authorId: map['authorId'],
      parentAuthorId: map['parentAuthorId'],
      xfdf: decodeXmlToBase64(map['xfdf'] ?? ''),
      isEmpty: map['isEmpty'] ?? false,
    );
  }

  factory FirestoreAnnotationDocument.fromMapExcludeXmlEncoding(
      Map<String, dynamic> map) {
    return FirestoreAnnotationDocument(
      annotationId: map['annotationId'],
      classroomId: map['classroomId'],
      resourceId: map['resourceId'],
      authorId: map['authorId'],
      parentAuthorId: map['parentAuthorId'],
      xfdf: map['xfdf'] ?? '',
      isEmpty: map['isEmpty'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  String toJsonExcludeXmlEncoding() => json.encode(toMapExcludeXmlEncoding());

  factory FirestoreAnnotationDocument.fromJson(String source) =>
      FirestoreAnnotationDocument.fromMap(json.decode(source));

  factory FirestoreAnnotationDocument.fromJsonExcludeXmlEncoding(
          String source) =>
      FirestoreAnnotationDocument.fromMapExcludeXmlEncoding(
          json.decode(source));

  @override
  String toString() {
    return 'FirestoreAnnotationDocument(annotationId: $annotationId, classroomId: $classroomId, authorId: $authorId, parentAuthorId: $parentAuthorId, xfdf: $xfdf, isEmpty: $isEmpty)';
  }

  @override
  List<Object?> get props {
    return [
      annotationId,
      classroomId,
      resourceId,
      authorId,
      parentAuthorId,
      xfdf,
      isEmpty,
    ];
  }
}
