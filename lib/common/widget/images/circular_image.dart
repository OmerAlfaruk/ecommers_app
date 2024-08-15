import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/common/widget/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.fit,
    required this.image,
    this.isNetworkImage = true,
    this.overLayColor,
    this.backgroundColor,
    this.width,
    this.height,
    this.padding,
  });
  final BoxFit? fit;
  final String image;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final Color? overLayColor;
  final Color? backgroundColor;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ??
            (OHelperFunctions.isDark(context)
                ? OAppColor.dark
                : OAppColor.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  color: overLayColor,
                  progressIndicatorBuilder: (context, url, downLoadProgress) =>
                      const OShimmerEffect(
                    width: 55,
                    height: 55,
                    radius: 55,
                  ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  image: AssetImage(image),
                  color: overLayColor,
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
