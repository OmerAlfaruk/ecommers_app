import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(
      {super.key,
      this.height,
      this.width,
      this.radius = 10,
      this.child,
      this.showBoarder = false,
      this.borderColor = OAppColor.dark,
      this.backgroundColor = Colors.transparent,
      this.padding,
      this.margin});

  final double? height, width;
  final double radius;
  final Widget? child;
  final bool showBoarder;
  final Color borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: showBoarder ? Border.all(color: borderColor) : null),
      child: child,
    );
  }
}
