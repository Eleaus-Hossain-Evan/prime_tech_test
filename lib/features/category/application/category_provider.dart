import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/category_model.dart';
import '../domain/product_model.dart';
import '../infrastructure/category_repo.dart';

final selectedCategoryProvider = StateProvider<int>((ref) {
  return 0;
});

final fetchAllCategories = FutureProvider<List<CategoryModel>>((ref) async {
  return await ref.watch(categoryRepoProvider).fetchAllCategories();
});
final fetchAllProducts = FutureProvider<List<ProductModel>>((ref) async {
  final categoryId = ref.watch(selectedCategoryProvider);
  if (categoryId == 0) {
    return await ref.watch(categoryRepoProvider).fetchAllProduct();
  }
  return await ref
      .watch(categoryRepoProvider)
      .fetchProductByCategory(categoryId);
}, dependencies: [selectedCategoryProvider]);
