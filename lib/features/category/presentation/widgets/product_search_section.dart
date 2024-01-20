import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';

class ProductSearchSection extends StatelessWidget {
  const ProductSearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossCenter,
      children: [
        "Search product"
            .text
            .size(16)
            .color(AppColors.text300)
            .make()
            .pSymmetric(h: 40, v: 12)
            .expand(),
        Images.iconSearch.assetImage(height: 24, width: 24).pSymmetric(h: 20),
      ],
    ).box.white.roundedLg.make().pSymmetric(h: 16);
  }
}
