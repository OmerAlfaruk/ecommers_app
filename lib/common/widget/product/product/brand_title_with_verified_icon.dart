import 'package:ecommerce/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'brand_title.dart';

class BrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const BrandTitleTextWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLine=1,
    this.textColor,
    this.iconColor=OAppColor.primary,
    this.textAlign,
    this.brandSize,
  });

  final String title;
  final int maxLine;
  final Color? textColor;
  final Color  iconColor;
  final TextAlign? textAlign;
  final TextSizes? brandSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: BrandTitleText(
          title: title,
          maxLine: maxLine,
              textAlign: textAlign,
              color: textColor,
              brandSize: brandSize,
        )
        ),
        const SizedBox(
          width: OSizes.sm,
        ),
        Icon(
          Iconsax.verify,
          color: iconColor,
          size: OSizes.iconXs,
        ),
      ],
    );
  }
}
