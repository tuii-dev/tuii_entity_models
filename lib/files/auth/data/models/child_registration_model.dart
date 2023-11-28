import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuiientitymodels/files/auth/data/models/nullable_wrapper.dart';

class ChildRegistrationModel extends Equatable {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final DateTime? creationTimestamp;
  final DateTime? dateOfBirth;
  final int? birthYear;

  // Used in ParentTutorConnectionModel
  final bool? isChildConnected;

  // Onboarding new child for existing parent
  final bool? childIsNew;

  // UI Managememt
  final bool? showHeader;
  final bool? showBody;
  final String? label;

  const ChildRegistrationModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.creationTimestamp,
    this.dateOfBirth,
    this.birthYear,
    this.isChildConnected,
    this.childIsNew,
    this.showHeader,
    this.showBody,
    this.label,
  });

  ChildRegistrationModel copyWith({
    String? id,
    NullableWrapper<String?>? firstName,
    NullableWrapper<String?>? lastName,
    String? email,
    DateTime? creationTimestamp,
    DateTime? dateOfBirth,
    NullableWrapper<int?>? birthYear,
    bool? isChildConnected,
    bool? childIsNew,
    bool? showHeader,
    bool? showBody,
    String? label,
  }) {
    return ChildRegistrationModel(
      id: id ?? this.id,
      firstName: firstName != null ? firstName.value : this.firstName,
      lastName: lastName != null ? lastName.value : this.lastName,
      email: email ?? this.email,
      creationTimestamp: creationTimestamp ?? this.creationTimestamp,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      birthYear: birthYear != null ? birthYear.value : this.birthYear,
      isChildConnected: isChildConnected ?? this.isChildConnected,
      childIsNew: childIsNew ?? this.childIsNew,
      showHeader: showHeader ?? this.showHeader,
      showBody: showBody ?? this.showBody,
      label: label ?? this.label,
    );
  }

  ChildRegistrationModel resetBirthYear() {
    return ChildRegistrationModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      creationTimestamp: creationTimestamp,
      dateOfBirth: dateOfBirth,
      isChildConnected: isChildConnected,
      childIsNew: childIsNew,
      showHeader: showHeader,
      showBody: showBody,
      label: label,
    );
  }

  ChildRegistrationModel resetBirthDate() {
    return ChildRegistrationModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      creationTimestamp: creationTimestamp,
      isChildConnected: isChildConnected,
      childIsNew: childIsNew,
      showHeader: showHeader,
      showBody: showBody,
      label: label,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'creationTimestamp': creationTimestamp?.toUtc().millisecondsSinceEpoch,
      'dateOfBirth': dateOfBirth?.toUtc().millisecondsSinceEpoch,
      'birthYear': birthYear,
      'isChildConnected': isChildConnected,
    };
  }

  factory ChildRegistrationModel.fromMap(Map<String, dynamic> map) {
    return ChildRegistrationModel(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      creationTimestamp: map['creationTimestamp'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['creationTimestamp'])
              .toLocal()
          : null,
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth']).toLocal()
          : null,
      birthYear: map['birthYear'],
      isChildConnected: map['isChildConnected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChildRegistrationModel.fromJson(String source) =>
      ChildRegistrationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChildRegistrationModel(id: $id, firstName: $firstName, lastName: $lastName, email: $email, creationTimestamp: $creationTimestamp, dateOfBirth: $dateOfBirth)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      email,
      creationTimestamp,
      dateOfBirth,
      birthYear,
      isChildConnected,
      showHeader,
      showBody,
      label,
    ];
  }
}
