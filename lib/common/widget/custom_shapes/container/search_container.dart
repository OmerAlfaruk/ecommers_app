


import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key, required this.text, this.icon=Iconsax.search_normal, this.showBackground=true, this.showBorder=true, required this.padding, this.onTap,
  });
  final String text;
  final IconData icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;
  final VoidCallback?onTap;

  @override
  Widget build(BuildContext context) {
    final dark=OHelperFunctions.isDark(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,

        child: Container(
          width: ODeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(OSizes.md),
          decoration: BoxDecoration(
            color: showBackground? dark? OAppColor.dark:OAppColor.light:Colors.transparent,
            borderRadius: BorderRadius.circular(OSizes.cardRadiusLg),
            border:showBorder? Border.all(color: Colors.grey):null,
          ),
          child: Row(children: [
            Icon(icon,color: OAppColor.darkerGrey,),
            const SizedBox(width: OSizes.spaceBtwItems,),
            Text(text,style:Theme.of(context).textTheme.bodySmall,)
          ],),
        ),
      ),
    );
  }
}