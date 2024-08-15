import 'package:ecommerce/common/widget/appbar/app_bar.dart';
import 'package:ecommerce/feature/shop/screens/product_review/widget/overall_rating_progress_indicator.dart';
import 'package:ecommerce/feature/shop/screens/product_review/widget/progress_indicator_and_rating.dart';
import 'package:ecommerce/feature/shop/screens/product_review/widget/user_review_card.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widget/product/product/Rating/rating_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///---AppBar

      appBar: const OAppBar(
        title: Text('Review & Rating'),
        showBackArrow: true,
      ),

      ///---Body

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(OSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified and are from people who use the same type of device that you use.'),
              const SizedBox(
                height: OSizes.spaceBtwItems,
              ),

              /// Overall Product Rating
              OverallProductRating(),
              ORatingBarIndicator(rating: 3.5,),
              Text('12,611',style: Theme.of(context).textTheme.bodySmall!.apply(fontWeightDelta: 2),),
              SizedBox(height: OSizes.spaceBtwSections,),

              /// User Review List
              UserReviewCard(),UserReviewCard(),UserReviewCard(),


            ],
          ),
        ),
      ),
    );
  }
}








