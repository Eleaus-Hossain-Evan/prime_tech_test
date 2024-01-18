import 'dart:convert';

import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final String image;
  final String creationAt;
  final String updatedAt;
  const CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  CategoryModel copyWith({
    int? id,
    String? name,
    String? image,
    String? creationAt,
    String? updatedAt,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      creationAt: creationAt ?? this.creationAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'creationAt': creationAt,
      'updatedAt': updatedAt,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      creationAt: map['creationAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Categoryresponse(id: $id, name: $name, image: $image, creationAt: $creationAt, updatedAt: $updatedAt)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      image,
      creationAt,
      updatedAt,
    ];
  }
}
