

import 'package:ecommerce/feature/authentication/controllers/onboarding_controller/on_boarding_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/device/device_utility.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = OHelperFunctions.isDark(context);
    return Positioned(
        right: OSizes.defaultSpace,
        bottom: ODeviceUtils.getAppBarHeight(),
        child: ElevatedButton(
          onPressed: () {OnBoardingController.instance.nexPage();},
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: dark ? OAppColor.primary : OAppColor.black),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}