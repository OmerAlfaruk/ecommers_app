import 'package:ecommerce/common/styles/spacing_styles.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});
  final String image;
  final String title;
  final String subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: OSpacingStyle.paddingWithAppBarHeight*2,
          child: Column(
            children: [
              /// Image
              Image(
                image: AssetImage(image),
                width: OHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: OSizes.spaceBtwSections,
              ),
        
              /// Title And Subtitles
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
        
              const SizedBox(
                height: OSizes.spaceBtwSections,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: OSizes.spaceBtwSections,
              ),
        
              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text("continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
