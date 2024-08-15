import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key, this.width=400, this.height=400, this.radius=400, this.child,  this.backGroundColor, this.padding=0, this.margin,
  });
  final double? width;
  final double? height;
  final double? radius; final double? padding;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(0),
      margin: margin,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: backGroundColor,

      ),
      child: child,
    );
  }
}