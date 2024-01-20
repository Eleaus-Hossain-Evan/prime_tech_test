// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchAllCategoriesHash() =>
    r'd901ec055063490db0503e4aa9192f5409da5e04';

/// See also [fetchAllCategories].
@ProviderFor(fetchAllCategories)
final fetchAllCategoriesProvider =
    AutoDisposeFutureProvider<List<CategoryModel>>.internal(
  fetchAllCategories,
  name: r'fetchAllCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAllCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchAllCategoriesRef
    = AutoDisposeFutureProviderRef<List<CategoryModel>>;
String _$fetchAllProductsHash() => r'd63351096a1d0ceeae77dcc24a1c71f375485c89';

/// See also [fetchAllProducts].
@ProviderFor(fetchAllProducts)
final fetchAllProductsProvider =
    AutoDisposeFutureProvider<List<ProductModel>>.internal(
  fetchAllProducts,
  name: r'fetchAllProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchAllProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchAllProductsRef = AutoDisposeFutureProviderRef<List<ProductModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
