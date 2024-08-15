

import 'package:ecommerce/feature/authentication/controllers/onboarding_controller/on_boarding_controller.dart';
import 'package:ecommerce/feature/authentication/screens/on_boarding/widget/next_btn.dart';
import 'package:ecommerce/feature/authentication/screens/on_boarding/widget/on_boardig_navigation_dots.dart';
import 'package:ecommerce/feature/authentication/screens/on_boarding/widget/on_boarding_widget.dart';
import 'package:ecommerce/feature/authentication/screens/on_boarding/widget/skip.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoarding(
                  title: OText.onBoardingTitle1,
                  image: OImages.onBoardingImage1,
                  subTitle: OText.onBoardingSubTitle1),
              OnBoarding(
                  title: OText.onBoardingTitle2,
                  image: OImages.onBoardingImage2,
                  subTitle: OText.onBoardingSubTitle2),
              OnBoarding(
                  title: OText.onBoardingTitle3,
                  image: OImages.onBoardingImage3,
                  subTitle: OText.onBoardingSubTitle3),
            ],
          ),

          /// Skip Button
          const Skip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button

          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
