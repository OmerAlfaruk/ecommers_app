import 'package:ecommerce/common/widget/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/common/widget/product/product/Rating/rating_indicator.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = OHelperFunctions.isDark(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(OImages.userProfileImage1),
                ),
                SizedBox(
                  width: OSizes.spaceBtwItems,
                ),
                Text(
                  'Lali Lencho',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        SizedBox(
          height: OSizes.spaceBtwItems,
        ),

        /// Review
        Row(
          children: [
            const ORatingBarIndicator(rating: 4),
            SizedBox(
              width: OSizes.spaceBtwItems,
            ),
            Text(
              '01 Nov.2023',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(
          height: OSizes.spaceBtwItems,
        ),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchase seamlessly. Great job',
          trimLines: 1,
          trimExpandedText: '  show less',
          trimCollapsedText: '  show more',
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: OAppColor.primary),
          lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: OAppColor.primary),
        ),
        SizedBox(
          height: OSizes.spaceBtwItems,
        ),
        RoundedContainer(
          backgroundColor: dark?OAppColor.darkerGrey:OAppColor.grey,
          child: Padding(padding: EdgeInsets.all(OSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("O's Store",style: Theme.of(context).textTheme.titleMedium,),
                    Text("02 Nov,2023",style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                SizedBox(
                  height: OSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to navigate and make purchase seamlessly. Great job',
                  trimLines: 1,
                  trimExpandedText: '  show less',
                  trimCollapsedText: '  show more',
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: OAppColor.primary),
                  lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: OAppColor.primary),
                ),
              ],
            ),





          ),
        ),
        SizedBox(height: OSizes.spaceBtwSections,)
      ],
    );
  }
}
