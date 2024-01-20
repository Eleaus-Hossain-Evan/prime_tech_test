import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../application/category_provider.dart';
import '../../domain/category_model.dart';

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
