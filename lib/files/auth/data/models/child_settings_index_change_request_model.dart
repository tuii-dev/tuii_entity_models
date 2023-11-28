import 'package:equatable/equatable.dart';

import 'package:tuiicore/core/enums/tuii_role_type.dart';

class ChildSettingsIndexChangeRequestModel extends Equatable {
  final TuiiRoleType roleType;
  final int settingsIndex;

  const ChildSettingsIndexChangeRequestModel({
    required this.roleType,
    required this.settingsIndex,
  });

  @override
  List<Object> get props => [roleType, settingsIndex];
}
