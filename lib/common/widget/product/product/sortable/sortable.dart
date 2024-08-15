import 'package:ecommerce/feature/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../layout/grid_view.dart';
import '../product_cards/product_card_vertical.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.sort),
            ),
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
              'Popularity',
            ]
                .map(
                  (option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ),
            )
                .toList(),
            onChanged: (value) {}),
        SizedBox(
          height: OSizes.spaceBtwSections,
        ),
        /// Products
        OGridLayout(itemCount: 20, itemBuilder: (_,index)=>ProductCardVertical(product: ProductModel.empty(),))
      ],
    );
  }
}