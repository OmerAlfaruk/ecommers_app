import 'package:ecommerce/common/widget/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/common/widget/images/rounded_image.dart';
import 'package:ecommerce/common/widget/product/product/brand_title_with_verified_icon.dart';
import 'package:ecommerce/common/widget/product/product/product_price_text.dart';
import 'package:ecommerce/feature/shop/screens/home/widgets/product_title_text.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../styles/shadows.dart';
import '../../../circular_icon/circular_icon.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = OHelperFunctions.isDark(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(OSizes.productImageRadius),
          color: dark ? OAppColor.darkerGrey : OAppColor.softGrey),
      child: Row(
        children: [
          ///Thumbnail
          RoundedContainer(
            height: 120,
            padding: EdgeInsets.all(OSizes.sm),
            backgroundColor: dark ? OAppColor.dark : OAppColor.light,
            child: Stack(children: [
              SizedBox(
                  height: 120,
                  width: 120,
                  child: RoundedBorderImage(
                    imageUrl: OImages.productImage1,
                    applyImageRadius: true,
                  )),

              /// --sale Tag
              Positioned(
                top: 12,
                child: RoundedContainer(
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
              ),

              /// ---Favorite Icon Button
              const Positioned(
                  top: 0,
                  right: 0,
                  child: CircularIcon(
                    icon: Iconsax.heart,
                    color: Colors.red,
                    backGroundColor: Colors.transparent,
                  )),
            ]),
          ),

          /// Detail
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: OSizes.sm,left: OSizes.sm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(
                        title: 'Green Nike Half sleeves Shirt',
                        maxLine: 2,
                        smallSize: true,
                      ),
                      SizedBox(
                        height: OSizes.spaceBtwItems / 2,
                      ),
                      BrandTitleTextWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: ProductPriceText(price: '256.0-257.8965677',)),
                      Container(
                        decoration: const BoxDecoration(
                            color: OAppColor.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(OSizes.cardRadiusMd),
                              bottomRight: Radius.circular(OSizes.productImageRadius),
                            )
                        ),
                        child: const SizedBox(
                            width:OSizes.iconLg*1.2,
                            height: OSizes.iconLg*1.2,
                            child: Center(child: Icon(Iconsax.add,color: Colors.white,))),

                      )

                    ]
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
