import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/container/rounded_container.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final dark = OHelperFunctions.isDark(context);
    return RoundedContainer(
      showBoarder: true,
      backgroundColor: dark ? OAppColor.dark : OAppColor.white,
      padding: const EdgeInsets.only(
          top: OSizes.sm,
          bottom: OSizes.sm,
          right: OSizes.sm,
          left: OSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark
                    ? OAppColor.white.withOpacity(0.5)
                    : OAppColor.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1),),
              ),
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}