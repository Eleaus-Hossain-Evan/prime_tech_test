import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/category_model.dart';
import '../domain/product_model.dart';
import '../infrastructure/category_repo.dart';

part 'category_provider.g.dart';

final selectedCategoryProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

// final fetchAllCategories =
//     FutureProvider.autoDispose<List<CategoryModel>>((ref) async {
//   return await Future.delayed(
//     2000.ms,
//     () => ref.watch(categoryRepoProvider).fetchAllCategories(),
//   );
// });

@riverpod
FutureOr<List<CategoryModel>> fetchAllCategories(FetchAllCategoriesRef ref) {
  return ref.watch(categoryRepoProvider).fetchAllCategories();
}

@riverpod
FutureOr<List<ProductModel>> fetchAllProducts(FetchAllProductsRef ref) async {
  final categoryId = ref.watch(selectedCategoryProvider);
  if (categoryId == 0) {
    return await ref.watch(categoryRepoProvider).fetchAllProduct();
  }
  return await ref
      .watch(categoryRepoProvider)
      .fetchProductByCategory(categoryId);
}
