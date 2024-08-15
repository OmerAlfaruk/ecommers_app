import 'package:ecommerce/common/widget/layout/grid_view.dart';
import 'package:ecommerce/common/widget/shimmer/shimmer.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({super.key, this.itemCount=4,

  });
final int itemCount;
  @override
  Widget build(BuildContext context) {
    return OGridLayout(itemCount: itemCount, itemBuilder: (_,__)=>const SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OShimmerEffect(width: 180, height: 180),
          /// Image
          SizedBox(
            height: OSizes.spaceBtwItems,
          ),
          /// Text
          OShimmerEffect(width: 160, height: 15),
          SizedBox(
            height: OSizes.spaceBtwItems/2,
          ),
          OShimmerEffect(width: 110, height: 15),
        ],
      ),
    ));
  }
}
