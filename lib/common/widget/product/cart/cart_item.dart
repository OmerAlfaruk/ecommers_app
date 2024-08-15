import 'package:flutter/material.dart';

import '../../../../feature/shop/screens/home/widgets/product_title_text.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../product/brand_title_with_verified_icon.dart';
class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///Image
        RoundedBorderImage(
          imageUrl: OImages.productImage1,
          height: 60,
          width: 60,
          padding: EdgeInsets.all(OSizes.sm),
          backGroundColor: OHelperFunctions.isDark(context)
              ? OAppColor.darkerGrey
              : OAppColor.light,
        ),
        SizedBox(
          height: OSizes.spaceBtwItems,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: BrandTitleTextWithVerifiedIcon(
                    title: 'Nike', maxLine: 1),
              ),
              Flexible(
                child: ProductTitleText(
                    title: 'Black Sports Shoes', maxLine: 1),
              ),

              /// Attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Green',
                    style: Theme.of(context).textTheme.bodyLarge),TextSpan(
                    text: 'Size',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'UK 08',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}