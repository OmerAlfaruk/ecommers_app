import 'package:ecommerce/common/widget/circular_icon/circular_icon.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = OHelperFunctions.isDark(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: OSizes.defaultSpace, vertical: OSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? OAppColor.darkerGrey : OAppColor.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(OSizes.cardRadiusLg),
          topRight: Radius.circular(OSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircularIcon(
                icon: Iconsax.minus,
                backGroundColor: dark ? OAppColor.darkGrey : OAppColor.darkGrey,
                width: 40,
                height: 40,
                color: dark ? OAppColor.black : OAppColor.white,
              ),
              SizedBox(
                width: OSizes.spaceBtwItems,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                width: OSizes.spaceBtwItems,
              ),
              CircularIcon(
                icon: Iconsax.add,
                backGroundColor: dark ? OAppColor.black : OAppColor.black,
                width: 40,
                height: 40,
                color: dark ? OAppColor.black : OAppColor.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Add to Cart'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(OSizes.md),
              backgroundColor: OAppColor.black,
            ),
          ),
        ],
      ),
    );
  }
}
