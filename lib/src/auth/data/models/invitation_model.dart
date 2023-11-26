import 'dart:convert';
import 'package:equatable/equatable.dart';

class InvitationModel extends Equatable {
  final int index;
  final String? firstName;
  final String? lastName;
  final String? email;
  final bool? showBody;
  final bool? invitationSent;

  const InvitationModel({
    required this.index,
    this.firstName,
    this.lastName,
    this.email,
    this.showBody = true,
    this.invitationSent = false,
  });

  InvitationModel copyWith({
    int? index,
    String? firstName,
    String? lastName,
    String? email,
    bool? showBody,
    bool? invitationSent,
  }) {
    return InvitationModel(
      index: index ?? this.index,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      showBody: showBody ?? this.showBody,
      invitationSent: invitationSent ?? this.invitationSent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }

  factory InvitationModel.fromMap(Map<String, dynamic> map) {
    return InvitationModel(
      index: map['index'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InvitationModel.fromJson(String source) =>
      InvitationModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'InvitationModel(firstName: $firstName, lastName: $lastName, email: $email)';

  @override
  List<Object?> get props =>
      [index, firstName, lastName, email, showBody, invitationSent];
}
