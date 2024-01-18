import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:prime_tech_test/features/category/domain/category_model.dart';

class ProductModel extends Equatable {
  final int id;
  final String title;
  final int price;
  final String description;
  final List<String> images;
  final String creationAt;
  final String updatedAt;
  final CategoryModel category;
  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
  });

  factory ProductModel.init() {
    return const ProductModel(
      id: 0,
      title: '',
      price: 0,
      description: '',
      images: [],
      creationAt: '',
      updatedAt: '',
      category: CategoryModel(
        id: 0,
        name: '',
        image: '',
        creationAt: '',
        updatedAt: '',
      ),
    );
  }

  ProductModel copyWith({
    int? id,
    String? title,
    int? price,
    String? description,
    List<String>? images,
    String? creationAt,
    String? updatedAt,
    CategoryModel? category,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      images: images ?? this.images,
      creationAt: creationAt ?? this.creationAt,
      updatedAt: updatedAt ?? this.updatedAt,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'images': images,
      'creationAt': creationAt,
      'updatedAt': updatedAt,
      'category': category.toMap(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      price: map['price']?.toInt() ?? 0,
      description: map['description'] ?? '',
      images: List<String>.from(map['images'] ?? const []),
      creationAt: map['creationAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      category: CategoryModel.fromMap(map['category']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, price: $price, description: $description, images: $images, creationAt: $creationAt, updatedAt: $updatedAt, category: $category)';
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      price,
      description,
      images,
      creationAt,
      updatedAt,
      category,
    ];
  }
}
