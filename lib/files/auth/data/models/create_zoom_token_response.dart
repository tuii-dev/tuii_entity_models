import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuiientitymodels/files/auth/data/models/zoom_account_details_model.dart';

class CreateZoomTokenResponse extends Equatable {
  // final ZoomTokenModel? zoomToken;
  final String? zoomAccessToken;
  final ZoomAccountDetailsModel? accountDetails;
  const CreateZoomTokenResponse({
    // this.zoomToken,
    this.zoomAccessToken,
    this.accountDetails,
  });

  CreateZoomTokenResponse copyWith({
    // ZoomTokenModel? zoomToken,
    String? zoomAccessToken,
    ZoomAccountDetailsModel? accountDetails,
  }) {
    return CreateZoomTokenResponse(
      //zoomToken: zoomToken ?? this.zoomToken,
      zoomAccessToken: zoomAccessToken ?? this.zoomAccessToken,
      accountDetails: accountDetails ?? this.accountDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'zoomToken': zoomToken?.toMap(),
      'zoomAccessToken': zoomAccessToken,
      'accountDetails': accountDetails?.toMap(),
    };
  }

  factory CreateZoomTokenResponse.fromMap(Map<String, dynamic> map) {
    return CreateZoomTokenResponse(
      // zoomToken: map['zoomToken'] != null
      //     ? ZoomTokenModel.fromMap(map['zoomToken'])
      //     : null,
      zoomAccessToken: map['zoomAccessToken'],
      accountDetails: map['accountDetails'] != null
          ? ZoomAccountDetailsModel.fromMap(map['accountDetails'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateZoomTokenResponse.fromJson(String source) =>
      CreateZoomTokenResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'CreateZoomTokenResponse(zoomAccessToken: $zoomAccessToken, accountDetails: $accountDetails)';

  @override
  List<Object?> get props => [zoomAccessToken, accountDetails];
}
