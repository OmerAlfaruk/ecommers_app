

import 'package:ecommerce/common/widget/layout/grid_view.dart';
import 'package:ecommerce/common/widget/product/product/product_cards/product_card_vertical.dart';
import 'package:ecommerce/common/widget/texts/section_heading.dart';
import 'package:ecommerce/feature/shop/models/category_model.dart';
import 'package:ecommerce/feature/shop/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/product/product/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key, required this.category,
  });
final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(OSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(height:OSizes.spaceBtwItems ,),
              /// -- Brands
              BrandShowCase(images: [
                OImages.productImage3,OImages.productImage2,OImages.productImage1,
              ],), BrandShowCase(images: [
                OImages.productImage3,OImages.productImage2,OImages.productImage1,
              ],),
              SizedBox(height:OSizes.spaceBtwItems ,),
              /// -- Products
              SectionHeading(title: 'You might like',showActionButton: true,onPressed: (){},),
              SizedBox(height:OSizes.spaceBtwItems ,),
              OGridLayout(itemCount: 4, itemBuilder: (_,index)=>ProductCardVertical(product: ProductModel.empty())),
            ],
          ),
        ),
      ],
    );
  }
}