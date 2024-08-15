import 'package:ecommerce/common/widget/texts/section_heading.dart';
import 'package:ecommerce/feature/shop/screens/home/widgets/product_title_text.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/chips/choice_chips.dart';
import '../../../../../common/widget/custom_shapes/container/rounded_container.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = OHelperFunctions.isDark(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// selected attribute Price
        RoundedContainer(
          padding: const EdgeInsets.all(OSizes.md),
          backgroundColor: dark ? OAppColor.darkerGrey : OAppColor.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: OSizes.spaceBtwItems,
                  ),
                  Column(
                    children: [
                      Row(
                        /// actual price
                        children: [
                          const ProductTitleText(
                              title: 'Price : ', smallSize: true, maxLine: 1),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(
                                    decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: OSizes.spaceBtwItems,
                          ),
                          Text(
                            '\$20',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),

                          ///  Sale Price
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const ProductTitleText(
                              title: 'Stock : ', smallSize: true, maxLine: 1),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              /// Variation Description
              ProductTitleText(
                  title:
                      'This is the description of product it can go up to max 4 lines',
                  smallSize: true,
                  maxLine: 4)
            ],
          ),
        ),
        SizedBox(
          height: OSizes.spaceBtwItems,
        ),

        /// --- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: 'Colors',showActionButton: false,),
            SizedBox(
              height: OSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
              OChoiceChips(
                text: 'Green',
                selected: true,
                onSelected: (value) {},
              ),
              OChoiceChips(
                text: 'Red',
                selected: false,
                onSelected: (value) {},
              ),
              OChoiceChips(
                text: 'Yellow',
                selected: false,
                onSelected: (value) {},
              ),

            ],),

          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(title: 'Size',showActionButton: false,),
            SizedBox(
              height: OSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
              OChoiceChips(
                text: 'EU 34',
                selected: true,
                onSelected: (value) {},
              ),
              OChoiceChips(
                text: 'EU 36',
                selected: false,
                onSelected: (value) {},
              ),
              OChoiceChips(
                text: 'EU 38',
                selected: false,
                onSelected: (value) {},
              ),

            ],),

          ],
        )
      ],
    );
  }
}
