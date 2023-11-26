import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TuiiModuleFormDefinition extends Equatable {
  final int? index;
  final String? text;
  final void Function(BuildContext)? breadCrumbTapHandler;

  const TuiiModuleFormDefinition(
      {this.index, this.text, this.breadCrumbTapHandler});

  @override
  List<Object?> get props => [index, text, breadCrumbTapHandler];

  TuiiModuleFormDefinition copyWith({
    int? index,
    String? text,
    Function(BuildContext)? breadCrumbTapHandler,
  }) {
    return TuiiModuleFormDefinition(
      index: index ?? this.index,
      text: text ?? this.text,
      breadCrumbTapHandler: breadCrumbTapHandler ?? this.breadCrumbTapHandler,
    );
  }
}
