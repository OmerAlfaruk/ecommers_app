
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding_controller/on_boarding_controller.dart';

class Skip extends StatelessWidget {
  const Skip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: ODeviceUtils.getAppBarHeight(),
      right: OSizes.defaultSpace,
      child: TextButton(onPressed: () {
        OnBoardingController.instance.skipPage();
      }, child: const Text('Skip'),),);
  }
}