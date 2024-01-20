import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String email;
  final String password;
  final String name;
  final String role;
  final String avatar;
  final String creationAt;
  final String updatedAt;
  const UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
    required this.creationAt,
    required this.updatedAt,
  });

  UserModel init() {
    return const UserModel(
      id: 0,
      email: '',
      password: '',
      name: '',
      role: '',
      avatar: '',
      creationAt: '',
      updatedAt: '',
    );
  }

  UserModel copyWith({
    int? id,
    String? email,
    String? password,
    String? name,
    String? role,
    String? avatar,
    String? creationAt,
    String? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      role: role ?? this.role,
      avatar: avatar ?? this.avatar,
      creationAt: creationAt ?? this.creationAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'role': role,
      'avatar': avatar,
      'creationAt': creationAt,
      'updatedAt': updatedAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt() ?? 0,
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      name: map['name'] ?? '',
      role: map['role'] ?? '',
      avatar: map['avatar'] ?? '',
      creationAt: map['creationAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, password: $password, name: $name, role: $role, avatar: $avatar, creationAt: $creationAt, updatedAt: $updatedAt)';
  }

  @override
  List<Object> get props {
    return [
      id,
      email,
      password,
      name,
      role,
      avatar,
      creationAt,
      updatedAt,
    ];
  }
}
