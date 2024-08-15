import 'package:ecommerce/common/styles/shadows.dart';
import 'package:ecommerce/common/widget/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/common/widget/images/rounded_image.dart';
import 'package:ecommerce/common/widget/product/product/product_price_text.dart';
import 'package:ecommerce/feature/shop/controllers/product_controller.dart';
import 'package:ecommerce/feature/shop/models/enum/enum.dart';
import 'package:ecommerce/feature/shop/models/product_model.dart';
import 'package:ecommerce/feature/shop/screens/product_detail/product_detail.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../feature/shop/screens/home/widgets/product_title_text.dart';
import '../../../circular_icon/circular_icon.dart';
import '../brand_title_with_verified_icon.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller=ProductController.instance;
    final salePercentage=controller.calculateSalePercentage(product.price, product.salePrice);
    final isDark = OHelperFunctions.isDark(context);
    return GestureDetector(
      onTap: ()=>Get.to(()=>ProductDetail(product: product,)),
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [ShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(OSizes.productImageRadius),
            color: isDark ? OAppColor.darkerGrey : OAppColor.white),
        child: Column(
          children: [
            /// Thumbnail, wishList Button, Discount Tag
            RoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(OSizes.sm),
              backgroundColor: isDark ? OAppColor.dark : OAppColor.light,
              child: Stack(
                children: [
                  ///Thumbnail picture
                   Center(
                     child: RoundedBorderImage(
                      imageUrl:product.thumbnail ,
                      applyImageRadius: true,
                       isNetworkImage: true,
                                       ),
                   ),

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
                        '$salePercentage%',
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
                ],
              ),
            ),

            /// -- Details
            Padding(
              padding: const EdgeInsets.only(left: OSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   ProductTitleText(
                    title:product.title,
                    smallSize: true,
                    maxLine: 2,
                  ),
                  const SizedBox(
                    height: OSizes.spaceBtwItems / 2,
                  ),
                  BrandTitleTextWithVerifiedIcon(title: product.brand!.name, maxLine: 1,),


                ],
              ),
            ),
            Spacer(),
            /// price row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// price
                Flexible(
                  child: Column(
                    children: [
                      if(product.productType==ProductType.single.toString() && product.price>0)
                        Padding(
                          padding: const EdgeInsets.only(left: OSizes.sm),
                          child: Text(product.price.toString() ,style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),),
                        ),
                      /// price Show sale price as main price if sale exist
                      Padding(
                        padding: const EdgeInsets.only(left: OSizes.sm),
                        child: ProductPriceText(price:controller.getProductPrice(product) ,),
                      ),
                    ],
                  ),
                ),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}


