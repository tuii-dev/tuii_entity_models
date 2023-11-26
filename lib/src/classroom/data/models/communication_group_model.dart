import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/auth/data/models/user_model.dart';

class CommunicationGroupModel extends Equatable {
  final String? id;
  final String? groupName;
  final DateTime? creationDate;
  final bool? supportsEmail;
  final bool? supportsSms;
  final bool? supportsMessage;
  final List<UserModel>? users;

  const CommunicationGroupModel({
    this.id,
    this.groupName,
    this.creationDate,
    this.supportsEmail,
    this.supportsSms,
    this.supportsMessage,
    this.users,
  });

  @override
  List<Object?> get props {
    return [
      id,
      groupName,
      creationDate,
      supportsEmail,
      supportsSms,
      supportsMessage,
      users,
    ];
  }

  CommunicationGroupModel copyWith({
    String? id,
    String? groupName,
    DateTime? creationDate,
    bool? supportsEmail,
    bool? supportsSms,
    bool? supportsMessage,
    List<UserModel>? users,
  }) {
    return CommunicationGroupModel(
      id: id ?? this.id,
      groupName: groupName ?? this.groupName,
      creationDate: creationDate ?? this.creationDate,
      supportsEmail: supportsEmail ?? this.supportsEmail,
      supportsSms: supportsSms ?? this.supportsSms,
      supportsMessage: supportsMessage ?? this.supportsMessage,
      users: users ?? this.users,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'groupName': groupName,
      'creationDate': creationDate,
      'supportsEmail': supportsEmail,
      'supportsSms': supportsSms,
      'supportsMessage': supportsMessage,
      'users': users?.map((x) => x.toMap()).toList(),
    };
  }

  factory CommunicationGroupModel.fromMap(Map<String, dynamic> map) {
    return CommunicationGroupModel(
      id: map['id'] ?? '',
      groupName: map['groupName'] ?? '',
      creationDate: map['creationDate'] != null
          ? map['creationDate'].toDate()
          : DateTime.parse('1971-01-01'),
      supportsEmail: map['supportsEmail'] ?? true,
      supportsSms: map['supportsSms'] ?? false,
      supportsMessage: map['supportsMessage'] ?? false,
      users: map['users'] != null
          ? List<UserModel>.from(map['users']?.map((x) => UserModel.fromMap(x)))
          : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory CommunicationGroupModel.fromJson(String source) =>
  //     CommunicationGroupModel.fromMap(json.decode(source));
}
