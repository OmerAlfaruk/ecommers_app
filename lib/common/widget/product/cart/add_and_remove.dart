import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../circular_icon/circular_icon.dart';
class ProductQuantityWithAddAndRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddAndRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        /// Add Remove Button
        CircularIcon(icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: OSizes.md,
          color: OHelperFunctions.isDark(context)?OAppColor.white:OAppColor.black,
          backGroundColor: OHelperFunctions.isDark(context)?OAppColor.darkerGrey:OAppColor.light,
        ),
        SizedBox(width: OSizes.spaceBtwItems,),
        Text('2',style: Theme.of(context).textTheme.titleSmall,),
        SizedBox(width: OSizes.spaceBtwItems,),
        CircularIcon(icon: Iconsax.add,
          width: 32,
          height: 32,
          size: OSizes.md,
          color: OAppColor.white,
          backGroundColor:OAppColor.primary,
        ),

      ],
    );
  }
}