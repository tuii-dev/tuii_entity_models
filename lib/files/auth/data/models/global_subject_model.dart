import 'dart:convert';

import 'package:equatable/equatable.dart';

class GlobalSubjectModel extends Equatable {
  final String? id;
  final String? createdByUserId;
  final String? key;
  final String? name;
  final List<String>? searchTags;
  const GlobalSubjectModel({
    this.id,
    this.createdByUserId,
    this.key,
    this.name,
    this.searchTags,
  });

  factory GlobalSubjectModel.init(String createdByUserId, String tag) {
    final key = tag.toLowerCase().replaceAll(' ', '');
    final tags = tag.toLowerCase().trim().split(' ');
    return GlobalSubjectModel(
        createdByUserId: createdByUserId,
        key: key,
        name: tag,
        searchTags: tags);
  }

  GlobalSubjectModel copyWith({
    String? createdByUserId,
    String? id,
    String? key,
    String? name,
    List<String>? searchTags,
  }) {
    return GlobalSubjectModel(
      createdByUserId: createdByUserId ?? this.createdByUserId,
      id: id ?? this.id,
      key: key ?? this.key,
      name: name ?? this.name,
      searchTags: searchTags ?? this.searchTags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'createdByUserId': createdByUserId,
      'id': id,
      'key': key,
      'name': name,
      'searchTags': searchTags,
    };
  }

  factory GlobalSubjectModel.fromMap(Map<String, dynamic> map) {
    return GlobalSubjectModel(
      createdByUserId: map['createdByUserId'] ?? '',
      id: map['id'] ?? '',
      key: map['key'] ?? '',
      name: map['name'] ?? '',
      searchTags: List<String>.from(map['searchTags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GlobalSubjectModel.fromJson(String source) =>
      GlobalSubjectModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GlobalSubjectModel(createdByUserId: $createdByUserId, id: $id, key: $key, name: $name, searchTags: $searchTags)';
  }

  @override
  List<Object?> get props {
    return [
      createdByUserId,
      id,
      key,
      name,
      searchTags,
    ];
  }
}
