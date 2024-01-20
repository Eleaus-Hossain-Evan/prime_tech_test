import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../application/category_provider.dart';
import 'products_loader.dart';

class ProductSection extends HookConsumerWidget {
  const ProductSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fetchAllProductsProvider);

    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: crossStart,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: mainSpaceBetween,
              children: [
                "Products".text.size(16).bold.make(),
                Visibility(
                  visible: state.isLoading,
                  child: const SizedBox.square(
                    dimension: 16,
                    child: CircularProgressIndicator(strokeWidth: .8),
                  ).pOnly(right: 10),
                ),
              ],
            ),
            gap16,
            state.when(
              data: (data) {
                if (data.isEmpty) {
                  return "No products found".text.makeCentered();
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                borderRadius: BorderRadius.circular(8))
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
                log(error.toString(), error: error, stackTrace: stackTrace);
                return Text(error.toString());
              },
              loading: () => const ProductsLoader(),
            ),
          ],
        ),
      ),
    );
  }
}
