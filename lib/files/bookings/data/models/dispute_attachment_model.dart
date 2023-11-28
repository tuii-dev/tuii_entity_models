import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:tuiicore/core/enums/resource_type.dart';

class DisputeAttachmentModel extends Equatable {
  final String? fileName;
  final ResourceType? fileType;
  final String? documentUrl;
  final Uint8List? fileBytes;

  const DisputeAttachmentModel({
    this.fileName,
    this.fileType,
    this.documentUrl,
    this.fileBytes,
  });

  DisputeAttachmentModel copyWith({
    String? fileName,
    ResourceType? fileType,
    String? documentUrl,
    Uint8List? fileBytes,
  }) {
    return DisputeAttachmentModel(
      fileName: fileName ?? this.fileName,
      fileType: fileType ?? this.fileType,
      documentUrl: documentUrl ?? this.documentUrl,
      fileBytes: fileBytes ?? this.fileBytes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fileName': fileName,
      'fileType': fileType?.toMap(),
      'documentUrl': documentUrl,
    };
  }

  factory DisputeAttachmentModel.fromMap(Map<String, dynamic> map) {
    const staticType = ResourceType.unknown;
    return DisputeAttachmentModel(
      fileName: map['fileName'],
      fileType:
          map['fileType'] != null ? staticType.fromMap(map['fileType']) : null,
      documentUrl: map['documentUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DisputeAttachmentModel.fromJson(String source) =>
      DisputeAttachmentModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'DisputeAttachmentModel(fileName: $fileName, fileType: $fileType, documentUrl: $documentUrl)';

  @override
  List<Object?> get props => [fileName, fileType, documentUrl, fileBytes];
}
