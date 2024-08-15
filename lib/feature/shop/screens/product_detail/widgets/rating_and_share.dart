import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// - Rating & Share Button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///---Rating
            Row(
              children: [
                Icon(Iconsax.star5,color: Colors.amber,size: 24,),
                SizedBox(width: OSizes.spaceBtwItems/2,),
                Text.rich(TextSpan(children: [TextSpan(
                    text: '5.0',style: Theme.of(context).textTheme.bodyLarge
                ),const TextSpan(text: '(199)')]))
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.share),)
            ///---Share
          ],
        )
      ],
    );
  }
}