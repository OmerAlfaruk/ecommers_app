import 'package:ecommerce/common/widget/texts/section_heading.dart';
import 'package:ecommerce/feature/shop/models/product_model.dart';
import 'package:ecommerce/feature/shop/screens/product_detail/widgets/bottom_add_to_card_widget.dart';
import 'package:ecommerce/feature/shop/screens/product_detail/widgets/produc_detail_image_slider.dart';
import 'package:ecommerce/feature/shop/screens/product_detail/widgets/product_attribute.dart';
import 'package:ecommerce/feature/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:ecommerce/feature/shop/screens/product_detail/widgets/rating_and_share.dart';
import 'package:ecommerce/feature/shop/screens/product_review/product_review.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';


class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = OHelperFunctions.isDark(context);
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: OSizes.defaultSpace),
          child: Column(
            children: [
              /// product Image Slider

              ProductImageSlider(dark: dark),

              /// Product Detail
              const RatingAndShare(),
              /// -price ,title,Stock, and brand
              const ProductMetaData(),
              /// --Attributes
              const ProductAttributes(),
              const SizedBox(height: OSizes.spaceBtwSections,),

              /// Checkout Button
              SizedBox(width:double.infinity,child: ElevatedButton(onPressed: (){}, child:  const Text('Checkout'),),),
              const SizedBox(height: OSizes.spaceBtwSections,),
              const SectionHeading(title: 'Description',showActionButton: false,),
              const SizedBox(height: OSizes.spaceBtwItems,),
              const ReadMoreText("This is a product description for blue Nike sleeve less vast.there are more things that can be added but for now this is enough",
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'show more',
              trimExpandedText: '   less',
                moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                lessStyle:  TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
              ),
              /// ---Review
              const Divider(),
              const SizedBox(height: OSizes.spaceBtwItems,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SectionHeading(title: 'Reviews(199)',onPressed: (){},showActionButton: false,),
                  IconButton(onPressed: (){
                    Get.to(const ProductReviewScreen());
                  }, icon: const Icon(Iconsax.arrow_right))
                ],
              ),

              const SizedBox(height: OSizes.spaceBtwSections,),




            ],
          ),
        ),
      ),
    );
  }
}


