import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prime_tech_test/features/category/presentation/widgets/category_section.dart';
import 'package:prime_tech_test/features/category/presentation/widgets/product_search_section.dart';
import 'package:prime_tech_test/features/category/presentation/widgets/product_section.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/core.dart';
import '../../profile/presentation/profile_screen.dart';
import '../application/category_provider.dart';

class CategoryScreen extends HookConsumerWidget {
  static const route = '/category';

  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useMemoized(RefreshController.new);

    return Scaffold(
      appBar: KAppBar(
        titleText: 'Categories',
        // leading:
        //     Images.iconProfile.assetImage(height: 24, width: 20).onInkTap(() {
        //   context.push(ProfileScreen.route);
        // }).pSymmetric(h: 18, v: 16),

        leading: IconButton(
          icon: Images.iconProfile.assetImage(height: 24, width: 20),
          onPressed: () {
            context.push(ProfileScreen.route);
          },
        ),
        actions: [
          Images.iconHeart.assetImage(height: 24, width: 26),
          const SizedBox(width: 20),
        ],
      ),
      body: SmartRefresher(
        controller: controller,
        onRefresh: () {
          ref.invalidate(selectedCategoryProvider);
          Future.wait([
            ref.refresh(fetchAllCategoriesProvider.future),
            ref.refresh(fetchAllProductsProvider.future),
          ]).then((value) => controller.refreshCompleted());
        },
        child: Column(
          children: [
            gap16,
            const ProductSearchSection(),
            gap16,
            Flexible(
              child: Padding(
                padding: (20, 0, 20, 20).padding,
                child: Row(
                  crossAxisAlignment: crossStart,
                  children: const [
                    CategorySection(),
                    ProductSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
