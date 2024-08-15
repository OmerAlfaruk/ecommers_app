import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({
    super.key, this.iconColor, required this.onPressed,
  });
  final Color? iconColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.shopping_bag,),
        ),
        Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: OAppColor.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(child: Text('2',style: Theme.of(context).textTheme.labelLarge!.apply(color: OAppColor.white,fontSizeFactor: 0.8),),),
            ))
      ],
    );
  }
}