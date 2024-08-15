import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/container/rounded_container.dart';
import 'brand_card.dart';
class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBoarder: true,
      backgroundColor: Colors.transparent,
      borderColor: OAppColor.darkerGrey,
      margin: const EdgeInsets.only(bottom: OSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brands with Product Count
          const BrandCard(showBorder: false),

          /// Brand Top 3 Product Images
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }

  Expanded brandTopProductImageWidget(String images, BuildContext context) {
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: OHelperFunctions.isDark(context)
            ? OAppColor.darkerGrey
            : OAppColor.light,
        margin: const EdgeInsets.only(right: OSizes.sm),
        padding: const EdgeInsets.all(OSizes.md),
        child: Image(
            fit: BoxFit.contain,
            image: AssetImage(
              images,
            )),
      ),
    );
  }
}