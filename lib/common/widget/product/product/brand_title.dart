import 'package:flutter/material.dart';
import '../../../../utils/constants/enums.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key, required this.title, required this.maxLine,  this.textAlign, this.brandSize, this.color,
  });

  final String title;
  final int maxLine;
  final Color? color;
  final TextAlign? textAlign;
  final TextSizes? brandSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      textAlign: textAlign,

      style: brandSize==TextSizes.small?
      Theme.of(context).textTheme.labelMedium!.apply(color: color):brandSize==TextSizes.medium?
      Theme.of(context).textTheme.bodyLarge!.apply(color: color):brandSize==TextSizes.large?
      Theme.of(context).textTheme.titleLarge!.apply(color: color):Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}