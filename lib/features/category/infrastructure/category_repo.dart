import 'dart:convert';

import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:prime_tech_test/features/category/domain/category_model.dart';
import 'package:prime_tech_test/features/category/domain/product_model.dart';

import '../../../core/core.dart';

final categoryRepoProvider = Provider<CategoryRepo>((ref) {
  return CategoryRepo();
});

class CategoryRepo {
  final api = NetworkHandler.instance;

  final client = http.Client();

  Future<List<CategoryModel>> fetchAllCategories() async {
    final uri = Uri.parse(
        '${APIRouteEndpoint.BASE_URL}${APIRouteEndpoint.ALL_CATEGORY}');
    final response = await http.get(
      uri,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception('Error fetching categories');
    }

    Logger.i(response.body);

    final List body = json.decode(response.body);
    return body.map((e) => CategoryModel.fromMap(e)).toList();
  }

  Future<List<ProductModel>> fetchAllProduct() async {
    final uri =
        Uri.parse('${APIRouteEndpoint.BASE_URL}${APIRouteEndpoint.Product}');
    final response = await http.get(
      uri,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception('Error fetching categories');
    }

    Logger.i(response.body);

    final List body = json.decode(response.body);
    return body.map((e) => ProductModel.fromMap(e)).toList();
    // return List.generate(10, (index) => ProductModel.fromJson(productStr));
  }

  Future<List<ProductModel>> fetchProductByCategory(int id) async {
    final uri =
        Uri.parse('${APIRouteEndpoint.BASE_URL}api/v1/categories/$id/products');
    Logger.d(uri);
    final response = await http.get(
      uri,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception('Error fetching categories');
    }

    Logger.i(response.body);

    final List body = json.decode(response.body);
    return body.map((e) => ProductModel.fromMap(e)).toList();
    // return List.generate(10, (index) => ProductModel.fromJson(productStr));
  }
}

const productStr = """
{
        "id": 2,
        "title": "Classic Red Pullover Hoodie",
        "price": 10,
        "description": "Elevate your casual wardrobe with our Classic Red Pullover Hoodie. Crafted with a soft cotton blend for ultimate comfort, this vibrant red hoodie features a kangaroo pocket, adjustable drawstring hood, and ribbed cuffs for a snug fit. The timeless design ensures easy pairing with jeans or joggers for a relaxed yet stylish look, making it a versatile addition to your everyday attire.",
        "images": [
            "https://i.imgur.com/1twoaDy.jpeg",
            "https://i.imgur.com/FDwQgLy.jpeg",
            "https://i.imgur.com/kg1ZhhH.jpeg"
        ],
        "creationAt": "2024-01-18T01:00:56.000Z",
        "updatedAt": "2024-01-18T01:00:56.000Z",
        "category": {
            "id": 1,
            "name": "Clothes",
            "image": "https://i.imgur.com/QkIa5tT.jpeg",
            "creationAt": "2024-01-18T01:00:56.000Z",
            "updatedAt": "2024-01-18T01:00:56.000Z"
        }
    }""";
