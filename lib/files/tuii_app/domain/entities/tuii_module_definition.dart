import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tuiientitymodels/files/tuii_app/domain/entities/tuii_module_node_definition.dart';

class TuiiModuleDefinition extends Equatable {
  final IconData iconData;
  final String name;
  final String breadCrumbLabel;
  final int index;
  final List<TuiiModuleFormDefinition> forms;
  final bool? hidden;
  const TuiiModuleDefinition({
    required this.iconData,
    required this.name,
    required this.breadCrumbLabel,
    required this.index,
    required this.forms,
    this.hidden = false,
  });

  @override
  List<Object?> get props => [iconData, name, index, forms, hidden];

  TuiiModuleDefinition copyWith({
    IconData? iconData,
    String? name,
    String? breadCrumbLabel,
    int? index,
    List<TuiiModuleFormDefinition>? forms,
    bool? hidden,
  }) {
    return TuiiModuleDefinition(
      iconData: iconData ?? this.iconData,
      name: name ?? this.name,
      breadCrumbLabel: breadCrumbLabel ?? this.breadCrumbLabel,
      index: index ?? this.index,
      forms: forms ?? this.forms,
      hidden: hidden ?? this.hidden,
    );
  }
}
