import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widget/appbar/app_bar.dart';
import '../../../../../common/widget/custom_shapes/curved_shape/curved_edge_widget.dart';
import '../../../../../common/widget/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: dark ? OAppColor.darkGrey : OAppColor.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(OSizes.productImageRadius * 2),
                child: Center(
                    child: Image(
                      image: AssetImage(OImages.productImage1),
                    )),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: OSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => SizedBox(
                    width: OSizes.spaceBtwItems,
                  ),
                  itemCount: 6,
                  itemBuilder: (_, index) {
                    return RoundedBorderImage(
                      imageUrl: OImages.productImage3,
                      width: 80,
                      backGroundColor:
                      dark ? OAppColor.dark : Colors.white,
                      padding: EdgeInsets.all(OSizes.sm),
                    );
                  },
                ),
              ),
            ),
            const OAppBar(
              showBackArrow: true,
              actions: [
                Icon(Iconsax.heart_circle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}