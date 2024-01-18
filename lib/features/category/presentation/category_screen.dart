import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prime_tech_test/features/category/domain/category_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../../profile/presentation/profile_screen.dart';
import '../application/category_provider.dart';

class CategoryScreen extends HookConsumerWidget {
  static const route = '/category';

  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fetchAllCategories);
    final selectedCategoryId = ref.watch(selectedCategoryProvider);

    final productState = ref.watch(fetchAllProducts);

    // final controller = useMemoized(RefreshController.new);

    return Scaffold(
      appBar: KAppBar(
        titleText: 'Categories',
        leading:
            Images.iconProfile.assetImage(height: 24, width: 20).onInkTap(() {
          context.push(ProfileScreen.route);
        }).pSymmetric(h: 18, v: 16),
        actions: [
          Images.iconHeart.assetImage(height: 24, width: 26),
          const SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          gap16,
          Row(
            children: [
              "Search product"
                  .text
                  .size(16)
                  .color(AppColors.text300)
                  .make()
                  .pSymmetric(h: 40, v: 12)
                  .expand(),
              Images.iconSearch
                  .assetImage(height: 24, width: 24)
                  .pSymmetric(h: 20),
            ],
          ).box.white.roundedLg.make().pSymmetric(h: 16),
          gap16,
          Expanded(
            child: Padding(
              padding: (20, 0, 20, 20).padding,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: state.when(
                      data: (data) {
                        return Column(
                          children: [
                            CategoryWidget(
                              category: const CategoryModel(
                                  id: 0,
                                  name: "All",
                                  image: "",
                                  creationAt: "",
                                  updatedAt: ""),
                              isSelected: selectedCategoryId == 0,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final category = data[index];
                                final isSelected =
                                    selectedCategoryId == category.id;
                                return CategoryWidget(
                                  category: category,
                                  isSelected: isSelected,
                                );
                              },
                            ),
                          ],
                        );
                      },
                      error: (error, stackTrace) {
                        log(error.toString(),
                            error: error, stackTrace: stackTrace);
                        return Text(error.toString());
                      },
                      loading: () => const CircularProgressIndicator(),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: crossStart,
                        children: [
                          "Products"
                              .text
                              .size(16)
                              .bold
                              .make()
                              .pSymmetric(h: 20),
                          gap16,
                          productState.when(
                            data: (data) {
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.7,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                ),
                                itemBuilder: (context, index) {
                                  final product = data[index];
                                  return Column(
                                    children: [
                                      product.images.first
                                          .networkImage(
                                              height: 80,
                                              borderRadius:
                                                  BorderRadius.circular(8))
                                          .p12(),
                                      gap8,
                                      product.title.text
                                          .maxLines(2)
                                          .ellipsis
                                          .center
                                          .size(12)
                                          .make()
                                          .px8(),
                                    ],
                                  ).box.white.roundedSM.make();
                                },
                                itemCount: data.length,
                              );
                            },
                            error: (error, stackTrace) {
                              log(error.toString(),
                                  error: error, stackTrace: stackTrace);
                              return Text(error.toString());
                            },
                            loading: () => const CircularProgressIndicator(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryWidget extends HookConsumerWidget {
  const CategoryWidget({
    super.key,
    required this.category,
    required this.isSelected,
  });

  final CategoryModel category;
  final bool isSelected;

  @override
  Widget build(BuildContext context, ref) {
    return KInkWell(
      onTap: () {
        ref.read(selectedCategoryProvider.notifier).state = category.id;
      },
      child: Row(
        crossAxisAlignment: crossStart,
        children: [
          Expanded(
            child: Column(
              children: [
                gap16,
                category.image.networkImage(height: 24, width: 20),
                const SizedBox(height: 8),
                category.name.text.center
                    .size(12)
                    .color(isSelected ? AppColors.primary : AppColors.text300)
                    .makeCentered(),
              ],
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: isSelected
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Container(
              width: 4,
              height: 58,
              // margin: 16.paddingTop,
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
            ),
            secondChild: const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
