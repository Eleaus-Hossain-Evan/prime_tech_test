import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/core.dart';
import '../../application/category_provider.dart';
import '../../domain/category_model.dart';
import 'category_loader.dart';
import 'category_widget.dart';

class CategorySection extends HookConsumerWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fetchAllCategoriesProvider);
    final selectedCategoryId = ref.watch(selectedCategoryProvider);
    return Container(
      width: 80,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: state.when(
        data: (data) {
          return ListView(
            shrinkWrap: true,
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
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final category = data[index];
                  final isSelected = selectedCategoryId == category.id;
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
          log(error.toString(), error: error, stackTrace: stackTrace);
          return Text(error.toString());
        },
        loading: () => const CategoryLoader(),
      ),
    );
  }
}
