import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../product/product/product_cards/product_card_vertical.dart';

class OGridLayout extends StatelessWidget {
  const OGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 250,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        padding: EdgeInsets.zero,

        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: OSizes.gridViewSpacing,
            crossAxisSpacing: OSizes.gridViewSpacing,
            mainAxisExtent: mainAxisExtent),
        itemBuilder: itemBuilder);
  }
}
