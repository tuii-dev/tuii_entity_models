import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tuiientitymodels/files/tuii_app/domain/entities/tuii_module_node_definition.dart';

class BookingsRouteArgs extends Equatable {
  final bool showMessage;
  final String? message;
  final Color? backgroundColor;
  final Icon? icon;
  final int? selectedFormIndex;
  final List<TuiiModuleFormDefinition>? formPath;

  const BookingsRouteArgs({
    required this.showMessage,
    this.message,
    this.backgroundColor,
    this.icon,
    this.selectedFormIndex = 0,
    this.formPath = const [],
  });

  @override
  List<Object?> get props => [
        showMessage,
        message,
        backgroundColor,
        icon,
        selectedFormIndex,
        formPath,
      ];

  BookingsRouteArgs copyWith({
    bool? showMessage,
    String? message,
    Color? backgroundColor,
    Icon? icon,
    int? selectedFormIndex,
    List<TuiiModuleFormDefinition>? formPath,
  }) {
    return BookingsRouteArgs(
      showMessage: showMessage ?? this.showMessage,
      message: message ?? this.message,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      icon: icon ?? this.icon,
      selectedFormIndex: selectedFormIndex ?? this.selectedFormIndex,
      formPath: formPath ?? this.formPath,
    );
  }
}
