import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';

class CategoryLoader extends StatelessWidget {
  const CategoryLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: List.generate(
          5, (index) => const CategoryLoadingSingle().pOnly(bottom: 16)),
    );
  }
}

class CategoryLoadingSingle extends StatelessWidget {
  const CategoryLoadingSingle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: crossCenter,
      children: [
        gap8,
        const KSkeletonWidget(
          shape: BoxShape.circle,
          height: 28,
          width: 28,
        ),
        gap6,
        KSkeletonWidget(
          margin: 8.paddingHorizontal,
          height: 16,
        ),
      ],
    );
  }
}
