import 'package:ecommerce/feature/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
final controller=SignupController.instance;
    return Row(
      children: [
        Obx(
        ()=>SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) {
                controller.privacyPolicy.value=!controller.privacyPolicy.value;
              },
            ),
          ),
        ),
        const SizedBox(
          width: OSizes.spaceBtwItems,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: OText.iAgreeTo,
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: OText.privacyPolicy,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                      color: dark
                          ? OAppColor.white
                          : OAppColor.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark
                          ? OAppColor.white
                          : OAppColor.primary),
                ),
                TextSpan(
                    text: ' and ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: OText.termsOfUse,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                      color: dark
                          ? OAppColor.white
                          : OAppColor.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark
                          ? OAppColor.white
                          : OAppColor.primary),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}