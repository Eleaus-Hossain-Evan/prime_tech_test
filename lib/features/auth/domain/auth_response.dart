// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthResponse extends Equatable {
  final String access_token;
  final String refresh_token;
  const AuthResponse({
    required this.access_token,
    required this.refresh_token,
  });

  AuthResponse copyWith({
    String? access_token,
    String? refresh_token,
  }) {
    return AuthResponse(
      access_token: access_token ?? this.access_token,
      refresh_token: refresh_token ?? this.refresh_token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access_token': access_token,
      'refresh_token': refresh_token,
    };
  }

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      access_token: map['access_token'] ?? '',
      refresh_token: map['refresh_token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromJson(String source) =>
      AuthResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'AuthResponse(access_token: $access_token, refresh_token: $refresh_token)';

  @override
  List<Object> get props => [access_token, refresh_token];
}
