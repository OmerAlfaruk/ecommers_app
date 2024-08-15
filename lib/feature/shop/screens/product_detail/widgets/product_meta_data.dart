import 'package:ecommerce/common/widget/images/circular_image.dart';
import 'package:ecommerce/common/widget/product/product/brand_title.dart';
import 'package:ecommerce/feature/shop/screens/home/widgets/product_title_text.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/custom_shapes/container/rounded_container.dart';
import '../../../../../common/widget/product/product/product_price_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = OHelperFunctions.isDark(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & sale Price
        Row(
          children: [
            /// Sale Tag
            RoundedContainer(
              radius: OSizes.sm,
              backgroundColor: OAppColor.secondary,
              padding: const EdgeInsets.symmetric(
                horizontal: OSizes.sm,
                vertical: OSizes.xs,
              ),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: OAppColor.black),
              ),
            ),
            SizedBox(
              width: OSizes.spaceBtwItems,
            ),

            /// Price
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(
              width: OSizes.spaceBtwItems,
            ),
            ProductPriceText(price: '175',isLarge: true,)
          ],
        ),


        /// Title
        SizedBox(height: OSizes.spaceBtwItems/1.5,),
        ProductTitleText(title: 'Green Nike Sport Shirt', smallSize: false, maxLine: 1,),
        SizedBox(height: OSizes.spaceBtwItems/1.5,),
        /// Stock Status

        Row(
          children: [
            ProductTitleText(title: 'Status', smallSize: false, maxLine: 1,),
            SizedBox(
              width: OSizes.spaceBtwItems,
            ),
            Text('In Stock',style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),

        SizedBox(height: OSizes.spaceBtwItems/1.5,),

        /// Brand
        Row(
          children: [
            CircularImage(image:OImages.nikeLogo , isNetworkImage: false,height: 25,width: 25, overLayColor: dark?OAppColor.white:OAppColor.black,
            ),
            SizedBox(
              width: OSizes.spaceBtwItems/2,
            ),
            BrandTitleText(title: 'Nike', maxLine: 1,brandSize: TextSizes.medium,),
          ],
        )
      ],
    );
  }
}
