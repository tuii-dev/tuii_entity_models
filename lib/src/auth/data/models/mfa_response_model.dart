import 'package:equatable/equatable.dart';

enum MfaResponseType { success, failed, completed, timedOut }

class MfaResponseModel extends Equatable {
  final MfaResponseType? responseType;
  final String? payload;

  const MfaResponseModel({
    this.responseType,
    this.payload,
  });

  @override
  List<Object?> get props => [responseType, payload];

  MfaResponseModel copyWith({
    MfaResponseType? responseType,
    String? payload,
  }) {
    return MfaResponseModel(
      responseType: responseType ?? this.responseType,
      payload: payload ?? this.payload,
    );
  }
}
