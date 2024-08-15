
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/onboarding_controller/on_boarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = OHelperFunctions.isDark(context);
    return Positioned(
      bottom: ODeviceUtils.getBottomNavigationBarHeight() + 25,
      left: OSizes.defaultSpace,
      child: SmoothPageIndicator(
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? OAppColor.light : OAppColor.dark,
            dotHeight: 6),
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
      ),
    );
  }
}
