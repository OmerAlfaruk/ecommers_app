import 'package:ecommerce/common/widget/images/circular_image.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    required this.textColor,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: OSizes.spaceBtwItems),
        child: Column(
          children: [
            /// circular Icon
            CircularImage(
              image: image,
              isNetworkImage: isNetworkImage,
              fit: BoxFit.fitWidth,
              backgroundColor: backgroundColor,
              overLayColor: OHelperFunctions.isDark(context)
                  ? OAppColor.grey
                  : OAppColor.dark,
            ),
            SizedBox(
              height: OSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
