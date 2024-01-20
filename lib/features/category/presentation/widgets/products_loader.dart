import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';

class ProductsLoader extends StatelessWidget {
  const ProductsLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 8,
      itemBuilder: (context, index) => Flex(
        direction: Axis.vertical,
        children: [
          KSkeletonWidget(
            height: 80,
            margin: 10.padding,
          ),
          gap12,
          KSkeletonWidget(
            margin: 20.paddingHorizontal,
            height: 14,
          ),
          gap4,
          KSkeletonWidget(
            height: 14,
            margin: 6.paddingHorizontal,
          ),
        ],
      ).box.white.roundedSM.make(),
    );
  }
}
