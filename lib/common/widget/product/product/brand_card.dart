import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/container/rounded_container.dart';
import '../../images/circular_image.dart';
import 'brand_title_with_verified_icon.dart';
class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key, required this.showBorder, this.onTap,
  });
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: RoundedContainer(
        padding: EdgeInsets.all(OSizes.sm),
        showBoarder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            ///Icon
            Flexible(
              child: CircularImage(
                image: OImages.clothIcon,
                isNetworkImage: false,
                height: 50,
                width: 50,
                backgroundColor: Colors.transparent,
                overLayColor:
                OHelperFunctions.isDark(context)
                    ? Colors.white
                    : OAppColor.black,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  BrandTitleTextWithVerifiedIcon(
                    title: 'Nike',
                    maxLine: 1,
                    brandSize: TextSizes.large,
                    iconColor: Colors.blue,
                  ),
                  Text(
                    '256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}