import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RoundedBorderImage extends StatelessWidget {
  const RoundedBorderImage({
    super.key,
    this.width = 300,
    this.height = 150,
    required this.imageUrl,
    this.applyImageRadius=true,
    this.border,
    this.backGroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.onPressed,
    this.isNetworkImage = false,
    this.borderRadius = OSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backGroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final bool isNetworkImage;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backGroundColor),
      child: ClipRRect(
        borderRadius: applyImageRadius
            ? BorderRadius.circular(borderRadius)
            : BorderRadius.zero,
        child: Image(
          image: isNetworkImage
              ? NetworkImage(imageUrl)
              : AssetImage(imageUrl) as ImageProvider,
          fit: fit,
        ),
      ),
    );
  }
}