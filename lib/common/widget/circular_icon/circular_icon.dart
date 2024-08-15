import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    this.width, this.height,  this.size, required this.icon, this.color, this.backGroundColor, this.onPressed,
  });
  final double? width,height,size;
  final IconData icon;
  final Color? color;
  final Color? backGroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = OHelperFunctions.isDark(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color:backGroundColor
      ),

      child: IconButton(onPressed: () {  }, icon: Icon(icon,color: color,size: size,),),
    );
  }
}